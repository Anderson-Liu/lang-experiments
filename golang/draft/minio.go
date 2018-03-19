package main

import (
"github.com/minio/minio-go"
"log"
)


func main() {
	endpoint := "s3.bjcc.addops.soft.360.cn"
	accessKeyID := "qSyVVRXfxWZf5UmYuzY5"
	secretAccessKey := "UHJiOChHcV5TIh7gKg325HdDN6C5cD0MjsGJxWmO"
	useSSL := false

	// Initialize minio client object.
	minioClient, err := minio.New(endpoint, accessKeyID, secretAccessKey, useSSL)
	if err != nil {
		log.Fatalln(err)
	}

	log.Printf("%#v\n", minioClient) // minioClient is now setup
}

