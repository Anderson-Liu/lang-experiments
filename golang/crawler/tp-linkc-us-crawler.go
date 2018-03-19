package crawler

import (
	"fmt"
	"os"
	"github.com/anaskhan96/soup"
	"strings"
	"time"
	"github.com/json-iterator/go"
)

var json = jsoniter.ConfigCompatibleWithStandardLibrary

var USFile *os.File
var usHost = "https://www.tp-link.com"
var logChannelUS chan map[string]string

func parseUSProduct(prodUrl string, productName string, logChannel chan<- map[string]string) {
	resp, err := soup.Get(prodUrl)
	if resp == "" {
		time.Sleep(3 * time.Second)
		parseUSProduct(prodUrl, productName, logChannel)
	} else {
		check(err)
		prodSoup := soup.HTMLParse(resp)
		downloadBtn := prodSoup.Find("table").Find("a")
		if downloadBtn.Pointer == nil {
			fmt.Printf("[Continue]%s does not contains product, url: %s \n", productName, prodUrl)
			return
		}
		fileUrl := downloadBtn.Attrs()["href"]
		splitResult := strings.Split(fileUrl, "/")
		fileName := splitResult[len(splitResult)-1]
		newItem := map[string]string{
			"company":  company,
			"product":  productName,
			"fileName": fileName,
			"fileUrl":  fileUrl,
		}
		logChannel <- newItem

		a_list := prodSoup.Find("div", "class", "download-list").FindAll("a")
		for _, a := range a_list {
			fileUrl := a.Attrs()["href"]
			splitResult := strings.Split(fileUrl, "/")
			fileName := splitResult[len(splitResult)-1]
			newItem := map[string]string{
				"company":  company,
				"product":  productName,
				"fileName": fileName,
				"fileUrl":  fileUrl,
			}
			logChannel <- newItem
		}
	}
}

func parseUSMenu() {

	menuUrl := "https://www.tp-link.com/phppage/down-load-model-list.html?showEndLife=false&catid=350&appPath=us"
	resp, err := soup.Get(menuUrl)
	check(err)
	//resp := `[{"id":"10342","title":"Whole-Home <em style=\"white-space:nowrap\">Wi-Fi<\/em>","row":[{"href":"\/us\/download\/Deco-M5.html","model":"Deco M5","text":"Deco M5","version":"V1"}]},{"id":"370","title":"Routers","row":[{"href":"\/us\/download\/AD7200.html","model":"AD7200","text":"AD7200","version":"V1"},{"href":"\/us\/download\/Archer-C1200.html","model":"Archer C1200","text":"Archer C1200","version":"V1"},{"href":"\/us\/download\/Archer-C1900.html","model":"Archer C1900","text":"Archer C1900","version":"V1"},{"href":"\/us\/download\/Archer-C2.html","model":"Archer C2","text":"Archer C2","version":"V1"},{"href":"\/us\/download\/Archer-C2600.html","model":"Archer C2600","text":"Archer C2600","version":"V1"},{"href":"\/us\/download\/Archer-C3000.html","model":"Archer C3000","text":"Archer C3000","version":"V1"},{"href":"\/us\/download\/Archer-C3150.html","model":"Archer C3150","text":"Archer C3150","version":"V1"},{"href":"\/us\/download\/Archer-C3200.html","model":"Archer C3200","text":"Archer C3200","version":"V1"},{"href":"\/us\/download\/Archer-C5.html","model":"Archer C5","text":"Archer C5","version":"V1"},{"href":"\/us\/download\/Archer-C50.html","model":"Archer C50","text":"Archer C50","version":"V1"},{"href":"\/us\/download\/Archer-C5200.html","model":"Archer C5200","text":"Archer C5200","version":"V1"},{"href":"\/us\/download\/Archer-C5400.html","model":"Archer C5400","text":"Archer C5400","version":"V1"},{"href":"\/us\/download\/Archer-C7.html","model":"Archer C7","text":"Archer C7","version":"V1"},{"href":"\/us\/download\/Archer-C8.html","model":"Archer C8","text":"Archer C8","version":"V1"},{"href":"\/us\/download\/Archer-C9.html","model":"Archer C9","text":"Archer C9","version":"V1"},{"href":"\/us\/download\/TGR1900.html","model":"TGR1900","text":"TGR1900","version":"V1"},{"href":"\/us\/download\/TL-WR1043ND.html","model":"TL-WR1043ND","text":"TL-WR1043ND","version":"V1"},{"href":"\/us\/download\/TL-WR710N.html","model":"TL-WR710N","text":"TL-WR710N","version":"V1"},{"href":"\/us\/download\/TL-WR802N.html","model":"TL-WR802N","text":"TL-WR802N","version":"V1"},{"href":"\/us\/download\/TL-WR810N.html","model":"TL-WR810N","text":"TL-WR810N","version":"V1"},{"href":"\/us\/download\/TL-WR841N.html","model":"TL-WR841N","text":"TL-WR841N","version":"V1"},{"href":"\/us\/download\/TL-WR841ND.html","model":"TL-WR841ND","text":"TL-WR841ND","version":"V1"},{"href":"\/us\/download\/TL-WR940N.html","model":"TL-WR940N","text":"TL-WR940N","version":"V1"},{"href":"\/us\/download\/Touch-P5.html","model":"Touch P5","text":"Touch P5","version":"V1"},{"href":"\/us\/download\/Archer-C59.html","model":"Archer C59","text":"Archer C59","version":"V1"},{"href":"\/us\/download\/TL-WR902AC.html","model":"TL-WR902AC","text":"TL-WR902AC","version":"V1"},{"href":"\/us\/download\/TL-WR1043N.html","model":"TL-WR1043N","text":"TL-WR1043N","version":"V1"},{"href":"\/us\/download\/Archer-C2300.html","model":"Archer C2300","text":"Archer C2300","version":"V1"},{"href":"\/us\/download\/Archer-C900.html","model":"Archer C900","text":"Archer C900","version":"V1"},{"href":"\/us\/download\/Archer-A2300.html","model":"Archer A2300","text":"Archer A2300","version":"V1"},{"href":"\/us\/download\/Archer-C3150-V2.html","model":"Archer C3150 V2","text":"Archer C3150 V2","version":"V1"}]},{"id":"371","title":"Network Expansion","row":[{"href":"\/us\/download\/RE205.html","model":"RE205","text":"RE205","version":"V1"},{"href":"\/us\/download\/RE650.html","model":"RE650","text":"RE650","version":"V1"},{"href":"\/us\/download\/RE500.html","model":"RE500","text":"RE500","version":"V1"},{"href":"\/us\/download\/RE590T.html","model":"RE590T","text":"RE590T","version":"V1"},{"href":"\/us\/download\/RE580D.html","model":"RE580D","text":"RE580D","version":"V1"},{"href":"\/us\/download\/RE450.html","model":"RE450","text":"RE450","version":"V1"},{"href":"\/us\/download\/RE400.html","model":"RE400","text":"RE400","version":"V1"},{"href":"\/us\/download\/RE355.html","model":"RE355","text":"RE355","version":"V1"},{"href":"\/us\/download\/RE350K.html","model":"RE350K","text":"RE350K","version":"V1"},{"href":"\/us\/download\/RE305.html","model":"RE305","text":"RE305","version":"V1"},{"href":"\/us\/download\/RE360.html","model":"RE360","text":"RE360","version":"V1"},{"href":"\/us\/download\/RE380D.html","model":"RE380D","text":"RE380D","version":"V1"},{"href":"\/us\/download\/RE350.html","model":"RE350","text":"RE350","version":"V1"},{"href":"\/us\/download\/RE210.html","model":"RE210","text":"RE210","version":"V1"},{"href":"\/us\/download\/RE200.html","model":"RE200","text":"RE200","version":"V1"},{"href":"\/us\/download\/TL-WA855RE.html","model":"TL-WA855RE","text":"TL-WA855RE","version":"V1"},{"href":"\/us\/download\/TL-WA860RE.html","model":"TL-WA860RE","text":"TL-WA860RE","version":"V1"},{"href":"\/us\/download\/TL-WA850RE.html","model":"TL-WA850RE","text":"TL-WA850RE","version":"V1"},{"href":"\/us\/download\/TL-WPA9610-KIT.html","model":"TL-WPA9610 KIT","text":"TL-WPA9610 KIT","version":"V1"},{"href":"\/us\/download\/TL-WPA8730-KIT.html","model":"TL-WPA8730 KIT","text":"TL-WPA8730 KIT","version":"V1"},{"href":"\/us\/download\/TL-WPA8630P-KIT.html","model":"TL-WPA8630P KIT","text":"TL-WPA8630P KIT","version":"V1"},{"href":"\/us\/download\/TL-WPA8630-KIT.html","model":"TL-WPA8630 KIT","text":"TL-WPA8630 KIT","version":"V1"},{"href":"\/us\/download\/TL-PA9020P-KIT.html","model":"TL-PA9020P KIT","text":"TL-PA9020P KIT","version":"V1"},{"href":"\/us\/download\/TL-PA8030P-KIT.html","model":"TL-PA8030P KIT","text":"TL-PA8030P KIT","version":"V1"},{"href":"\/us\/download\/TL-PA8010P-KIT.html","model":"TL-PA8010P KIT","text":"TL-PA8010P KIT","version":"V1"},{"href":"\/us\/download\/TL-PA8010-KIT.html","model":"TL-PA8010 KIT","text":"TL-PA8010 KIT","version":"V1"},{"href":"\/us\/download\/TL-PA7020-KIT.html","model":"TL-PA7020 KIT","text":"TL-PA7020 KIT","version":"V1"},{"href":"\/us\/download\/TL-PA7010-KIT.html","model":"TL-PA7010 KIT","text":"TL-PA7010 KIT","version":"V1"},{"href":"\/us\/download\/TL-WPA7510-KIT.html","model":"TL-WPA7510 KIT","text":"TL-WPA7510 KIT","version":"V1"},{"href":"\/us\/download\/TL-PA7010P-KIT.html","model":"TL-PA7010P KIT","text":"TL-PA7010P KIT","version":"V1"},{"href":"\/us\/download\/TL-WPA4530-KIT.html","model":"TL-WPA4530 KIT","text":"TL-WPA4530 KIT","version":"V1"},{"href":"\/us\/download\/TL-WPA4220KIT.html","model":"TL-WPA4220KIT","text":"TL-WPA4220KIT","version":"V1"},{"href":"\/us\/download\/TL-WPA4220.html","model":"TL-WPA4220","text":"TL-WPA4220","version":"V1"},{"href":"\/us\/download\/TL-PA4020P-KIT.html","model":"TL-PA4020P KIT","text":"TL-PA4020P KIT","version":"V1"},{"href":"\/us\/download\/TL-PA4026-KIT.html","model":"TL-PA4026 KIT","text":"TL-PA4026 KIT","version":"V1"},{"href":"\/us\/download\/TL-PA4010P-KIT.html","model":"TL-PA4010P KIT","text":"TL-PA4010P KIT","version":"V1"},{"href":"\/us\/download\/TL-PA4010-KIT.html","model":"TL-PA4010 KIT","text":"TL-PA4010 KIT","version":"V1"},{"href":"\/us\/download\/TL-PA4010.html","model":"TL-PA4010","text":"TL-PA4010","version":"V1"},{"href":"\/us\/download\/TL-PA7020P-KIT.html","model":"TL-PA7020P KIT","text":"TL-PA7020P KIT","version":"V1"},{"href":"\/us\/download\/TL-PA9020-KIT.html","model":"TL-PA9020 KIT","text":"TL-PA9020 KIT","version":"V1"},{"href":"\/us\/download\/AP500.html","model":"AP500","text":"AP500","version":"V1"},{"href":"\/us\/download\/AP300.html","model":"AP300","text":"AP300","version":"V1"},{"href":"\/us\/download\/TL-WA901ND.html","model":"TL-WA901ND","text":"TL-WA901ND","version":"V1"},{"href":"\/us\/download\/TL-WA801ND.html","model":"TL-WA801ND","text":"TL-WA801ND","version":"V1"}]},{"id":"372","title":"Modems & Gateways","row":[{"href":"\/us\/download\/TC-7610.html","model":"TC-7610","text":"TC-7610","version":"V1"},{"href":"\/us\/download\/TC-7620.html","model":"TC-7620","text":"TC-7620","version":"V1"},{"href":"\/us\/download\/TC7650.html","model":"TC7650","text":"TC7650","version":"V1"},{"href":"\/us\/download\/CR1900.html","model":"CR1900","text":"CR1900","version":"V1"},{"href":"\/us\/download\/Archer-CR700.html","model":"Archer CR700","text":"Archer CR700","version":"V1"},{"href":"\/us\/download\/Archer-CR500.html","model":"Archer CR500","text":"Archer CR500","version":"V1"},{"href":"\/us\/download\/TC-W7960.html","model":"TC-W7960","text":"TC-W7960","version":"V1"}]},{"id":"373","title":"Smart Home","row":[{"href":"\/us\/download\/KC120.html","model":"KC120","text":"KC120","version":"V1"},{"href":"\/us\/download\/HS105.html","model":"HS105","text":"HS105","version":"V1"},{"href":"\/us\/download\/HS105-KIT.html","model":"HS105 KIT","text":"HS105 KIT","version":"V1"},{"href":"\/us\/download\/HS110.html","model":"HS110","text":"HS110","version":"V1"},{"href":"\/us\/download\/HS110-KIT.html","model":"HS110 KIT","text":"HS110 KIT","version":"V1"},{"href":"\/us\/download\/HS100.html","model":"HS100","text":"HS100","version":"V1"},{"href":"\/us\/download\/HS100-KIT.html","model":"HS100 KIT","text":"HS100 KIT","version":"V1"},{"href":"\/us\/download\/KP100-KIT.html","model":"KP100 KIT","text":"KP100 KIT","version":"V1"},{"href":"\/us\/download\/KP100.html","model":"KP100","text":"KP100","version":"V1"},{"href":"\/us\/download\/LB230.html","model":"LB230","text":"LB230","version":"V1"},{"href":"\/us\/download\/LB200.html","model":"LB200","text":"LB200","version":"V1"},{"href":"\/us\/download\/LB130.html","model":"LB130","text":"LB130","version":"V1"},{"href":"\/us\/download\/LB120.html","model":"LB120","text":"LB120","version":"V1"},{"href":"\/us\/download\/LB110.html","model":"LB110","text":"LB110","version":"V1"},{"href":"\/us\/download\/LB100.html","model":"LB100","text":"LB100","version":"V1"},{"href":"\/us\/download\/LB100-TKIT.html","model":"LB100 TKIT","text":"LB100 TKIT","version":"V1"},{"href":"\/us\/download\/KB130.html","model":"KB130","text":"KB130","version":"V1"},{"href":"\/us\/download\/KB100.html","model":"KB100","text":"KB100","version":"V1"},{"href":"\/us\/download\/HS200.html","model":"HS200","text":"HS200","version":"V1"},{"href":"\/us\/download\/HS210-KIT.html","model":"HS210 KIT","text":"HS210 KIT","version":"V1"},{"href":"\/us\/download\/RE370K.html","model":"RE370K","text":"RE370K","version":"V1"},{"href":"\/us\/download\/RE270K.html","model":"RE270K","text":"RE270K","version":"V1"},{"href":"\/us\/download\/SR20.html","model":"SR20","text":"SR20","version":"V1"}]},{"id":"374","title":"Switches","row":[{"href":"\/us\/download\/TL-SG1005D.html","model":"TL-SG1005D","text":"TL-SG1005D","version":"V1"},{"href":"\/us\/download\/TL-SF1005D.html","model":"TL-SF1005D","text":"TL-SF1005D","version":"V1"},{"href":"\/us\/download\/TL-SG1008D.html","model":"TL-SG1008D","text":"TL-SG1008D","version":"V1"},{"href":"\/us\/download\/TL-SF1008D.html","model":"TL-SF1008D","text":"TL-SF1008D","version":"V1"}]},{"id":"375","title":"Adapters","row":[{"href":"\/us\/download\/Archer-T6E.html","model":"Archer T6E","text":"Archer T6E","version":"V1"},{"href":"\/us\/download\/Archer-T9E.html","model":"Archer T9E","text":"Archer T9E","version":"V1"},{"href":"\/us\/download\/TL-WDN4800.html","model":"TL-WDN4800","text":"TL-WDN4800","version":"V1"},{"href":"\/us\/download\/TL-WN881ND.html","model":"TL-WN881ND","text":"TL-WN881ND","version":"V1"},{"href":"\/us\/download\/TL-WN851ND.html","model":"TL-WN851ND","text":"TL-WN851ND","version":"V1"},{"href":"\/us\/download\/TL-WN781ND.html","model":"TL-WN781ND","text":"TL-WN781ND","version":"V1"},{"href":"\/us\/download\/TG-3269.html","model":"TG-3269","text":"TG-3269","version":"V1"},{"href":"\/us\/download\/TG-3468.html","model":"TG-3468","text":"TG-3468","version":"V1"},{"href":"\/us\/download\/TF-3239DL.html","model":"TF-3239DL","text":"TF-3239DL","version":"V1"},{"href":"\/us\/download\/TF-3200.html","model":"TF-3200","text":"TF-3200","version":"V1"},{"href":"\/us\/download\/Archer-T2UHP.html","model":"Archer T2UHP","text":"Archer T2UHP","version":"V1"},{"href":"\/us\/download\/Archer-T9UH.html","model":"Archer T9UH","text":"Archer T9UH","version":"V1"},{"href":"\/us\/download\/Archer-T4UHP.html","model":"Archer T4UHP","text":"Archer T4UHP","version":"V1"},{"href":"\/us\/download\/Archer-T1U.html","model":"Archer T1U","text":"Archer T1U","version":"V1"},{"href":"\/us\/download\/Archer-T4UH.html","model":"Archer T4UH","text":"Archer T4UH","version":"V1"},{"href":"\/us\/download\/Archer-T4U.html","model":"Archer T4U","text":"Archer T4U","version":"V1"},{"href":"\/us\/download\/T4U-V2.html","model":"T4U V2","text":"T4U V2","version":"V1"},{"href":"\/us\/download\/Archer-T2UH.html","model":"Archer T2UH","text":"Archer T2UH","version":"V1"},{"href":"\/us\/download\/Archer-T2U.html","model":"Archer T2U","text":"Archer T2U","version":"V1"},{"href":"\/us\/download\/TL-WN823N.html","model":"TL-WN823N","text":"TL-WN823N","version":"V1"},{"href":"\/us\/download\/TL-WN822N.html","model":"TL-WN822N","text":"TL-WN822N","version":"V1"},{"href":"\/us\/download\/TL-WN821N.html","model":"TL-WN821N","text":"TL-WN821N","version":"V1"},{"href":"\/us\/download\/TL-WN727N.html","model":"TL-WN727N","text":"TL-WN727N","version":"V1"},{"href":"\/us\/download\/TL-WN725N.html","model":"TL-WN725N","text":"TL-WN725N","version":"V1"},{"href":"\/us\/download\/TL-WN723N.html","model":"TL-WN723N","text":"TL-WN723N","version":"V1"},{"href":"\/us\/download\/TL-WN722N.html","model":"TL-WN722N","text":"TL-WN722N","version":"V1"}]},{"id":"376","title":"Accessories","row":[{"href":"\/us\/download\/TL-ANT2408C.html","model":"TL-ANT2408C","text":"TL-ANT2408C","version":"V1"},{"href":"\/us\/download\/TL-ANT2408CL.html","model":"TL-ANT2408CL","text":"TL-ANT2408CL","version":"V1"},{"href":"\/us\/download\/UH400.html","model":"UH400","text":"UH400","version":"V1"},{"href":"\/us\/download\/UH720.html","model":"UH720","text":"UH720","version":"V1"},{"href":"\/us\/download\/UH700.html","model":"UH700","text":"UH700","version":"V1"},{"href":"\/us\/download\/TL-UE300.html","model":"TL-UE300","text":"TL-UE300","version":"V1"},{"href":"\/us\/download\/TL-PB15600.html","model":"TL-PB15600","text":"TL-PB15600","version":"V1"},{"href":"\/us\/download\/PB50.html","model":"PB50","text":"PB50","version":"V1"},{"href":"\/us\/download\/TL-AC210.html","model":"TL-AC210","text":"TL-AC210","version":"V1"},{"href":"\/us\/download\/TL-PB5200.html","model":"TL-PB5200","text":"TL-PB5200","version":"V1"},{"href":"\/us\/download\/TL-PB2600.html","model":"TL-PB2600","text":"TL-PB2600","version":"V1"},{"href":"\/us\/download\/TL-PB10400.html","model":"TL-PB10400","text":"TL-PB10400","version":"V1"},{"href":"\/us\/download\/TL-WPS510U.html","model":"TL-WPS510U","text":"TL-WPS510U","version":"V1"},{"href":"\/us\/download\/TL-PS310U.html","model":"TL-PS310U","text":"TL-PS310U","version":"V1"},{"href":"\/us\/download\/TL-PS110U.html","model":"TL-PS110U","text":"TL-PS110U","version":"V1"},{"href":"\/us\/download\/TL-PS110P.html","model":"TL-PS110P","text":"TL-PS110P","version":"V1"},{"href":"\/us\/download\/BS1001.html","model":"BS1001","text":"BS1001","version":"V1"},{"href":"\/us\/download\/HA100.html","model":"HA100","text":"HA100","version":"V1"}]}]`
	var results []map[string]interface{}
	json.Unmarshal([]byte(resp), &results)
	for _, catolog := range results {
		id := catolog["id"].(string)
		row := catolog["row"].([]interface{})
		for _, item := range row {
			item := item.(map[string]interface{})
			href := usHost + item["href"].(string) + "#Firmware"
			productName := item["model"].(string)
			fmt.Println(id, productName, href)
			go parseUSProduct(href, productName, logChannelUS)
		}
	}
}

func StartUS() {
	var err error
	USFile, err = os.Create("tp-link-us_file_links")
	check(err)
	logChannelUS = make(chan map[string]string, 10)
	parseUSMenu()
	ticker := time.NewTicker(10 * time.Second)
	for {
		select {
		case <-ticker.C:
			fmt.Println("Wating...")
		case msg := <-logChannelUS:
			USFile.WriteString(fmt.Sprintf("%s,%s,%s,%s\n",
				msg["company"],
				msg["product"],
				msg["fileName"],
				msg["fileUrl"]))
			fmt.Printf("wrote %s to log file\n", msg)
			USFile.Sync()
		}
	}
}
