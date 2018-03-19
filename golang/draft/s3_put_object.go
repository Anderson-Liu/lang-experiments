package main

import (
	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/endpoints"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/dynamodb"
	"github.com/aws/aws-sdk-go/service/s3"
	"github.com/aws/aws-sdk-go/service/sqs"
	"fmt"
)

func main() {
	defaultResolver := endpoints.DefaultResolver()
	s3CustResolverFn := func(service, region string, optFns ...func(*endpoints.Options)) (endpoints.ResolvedEndpoint, error) {
		if service == "s3" {
			return endpoints.ResolvedEndpoint{
				URL:           "http://s3.bjcc.addops.soft.360.cn",
				SigningRegion: "bjcc-s3",
			}, nil
		}

		return defaultResolver.EndpointFor(service, region, optFns...)
	}
	sess := session.Must(session.NewSessionWithOptions(session.Options{
		Config: aws.Config{
			Region:           aws.String("bjcc-s3"),
			EndpointResolver: endpoints.ResolverFunc(s3CustResolverFn),
		},
	}))

	// Create the S3 service client with the shared session. This will
	// automatically use the S3 custom endpoint configured in the custom
	// endpoint resolver wrapping the default endpoint resolver.
	s3Svc := s3.New(sess)
	// Operation calls will be made to the custom endpoint.
	s3Svc.GetObject(&s3.GetObjectInput{
		Bucket: aws.String("test_firmware"),
		Key:    aws.String("prefixDell_Dell_B2375dfw_Mono_Multifunction_Printer_Software_OPD_Dell_A16_Win.zip"),
	})

	// Create the SQS service client with the shared session. This will
	// fallback to the default endpoint resolver because the customization
	// passes any non S3 service endpoint resolve to the default resolver.
	sqsSvc := sqs.New(sess)

	i := 0
	bucket := "firmware-test"
	err := s3Svc.ListObjectsPages(&s3.ListObjectsInput{
		Bucket: &bucket,
	}, func(p *s3.ListObjectsOutput, last bool) (shouldContinue bool) {
		fmt.Println("Page,", i)
		i++

		for _, obj := range p.Contents {
			fmt.Println("Object:", *obj.Key)
		}
		return true
	})
	if err != nil {
		fmt.Println("failed to list objects", err)
		return
	}

	// Operation calls will be made to the default endpoint for SQS for the
	// region configured.
	sqsSvc.ReceiveMessage(&sqs.ReceiveMessageInput{
		QueueUrl: aws.String("my-queue-url"),
	})

	// Create a DynamoDB service client that will use a custom endpoint
	// resolver that overrides the shared session's. This is useful when
	// custom endpoints are generated, or multiple endpoints are switched on
	// by a region value.
	ddbCustResolverFn := func(service, region string, optFns ...func(*endpoints.Options)) (endpoints.ResolvedEndpoint, error) {
		return endpoints.ResolvedEndpoint{
			URL:           "dynamodb.custom.endpoint",
			SigningRegion: "custom-signing-region",
		}, nil
	}
	ddbSvc := dynamodb.New(sess, &aws.Config{
		EndpointResolver: endpoints.ResolverFunc(ddbCustResolverFn),
	})
	// Operation calls will be made to the custom endpoint set in the
	// ddCustResolverFn.
	ddbSvc.ListTables(&dynamodb.ListTablesInput{})

	// Setting Config's Endpoint will override the EndpointResolver. Forcing
	// the service client to make all operation to the endpoint specified
	// the in the config.
	ddbSvcLocal := dynamodb.New(sess, &aws.Config{
		Endpoint: aws.String("http://localhost:8088"),
	})
	ddbSvcLocal.ListTables(&dynamodb.ListTablesInput{})
}