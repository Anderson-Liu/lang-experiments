package crawler

import (
	"fmt"
	"os"
	"github.com/anaskhan96/soup"
	"strings"
	"strconv"
	"time"
)

var CNFile *os.File
var company = "TP-Link"
var CNHost = "http://service.tp-link.com.cn"
var logChannelCN chan map[string]string

func check(e error) {
	if e != nil {
		panic(e)
	}
}

func parseCNProduct(prodUrl string, logChannel chan<- map[string]string) {
	resp, err := soup.Get(prodUrl)
	if resp == "Server Busy." {
		time.Sleep(3 * time.Second)
		parseCNProduct(prodUrl, logChannel)
	} else {
		check(err)
		prodSoup := soup.HTMLParse(resp)
		productName := prodSoup.Find("div", "class", "showname").Text()
		downloadBtn := prodSoup.Find("table").Find("a")
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
	}
}

func parseCNMenu(menuUrl string) {
	// Why it not continue execute?
	resp, err := soup.Get(menuUrl)
	if resp == "Server Busy." {
		time.Sleep(3 * time.Second)
		parseCNMenu(menuUrl)
	} else {
		check(err)
		menuSoup := soup.HTMLParse(resp)
		aList := menuSoup.Find("table", "id", "mainlist").FindAll("a")
		for _, a := range aList {
			productUrl := CNHost + a.Attrs()["href"]
			fmt.Printf("Take url %s\n", productUrl)
			// TODO: go many of goroutine
			go parseCNProduct(productUrl, logChannelCN)
		}
	}
}

func crawlCN() {
	pageCounts := [2]int{9, 115}

	for _, pageCount := range pageCounts {
		var modelUrl string
		if pageCount == 9 {
			modelUrl = "http://service.tp-link.com.cn/list_download_hardware_[count]_0.html"
		} else if pageCount == 115 {
			modelUrl = "http://service.tp-link.com.cn/list_download_software_[count]_0.html"
		}

		for i := 1; i < pageCount; i++ {
			menuUrl := strings.Replace(modelUrl, "[count]", strconv.Itoa(i), 1)
			// Is here run same menuUrl goroutine many times?
			fmt.Printf("Start crawlCN menuUrl: %s\n", menuUrl)
			go parseCNMenu(menuUrl)
		}
	}
}

func main() {
	var err error
	CNFile, err = os.Create("tp-link-cn_file_links")
	check(err)
	logChannelCN = make(chan map[string]string, 10)
	crawlCN()
	ticker := time.NewTicker(10 * time.Second)
	for {
		select {
		case <-ticker.C:
			fmt.Println("Wating...")
		case msg := <-logChannelCN:
			CNFile.WriteString(fmt.Sprintf("%s,%s,%s,%s\n",
				msg["company"],
				msg["product"],
				msg["fileName"],
				msg["fileUrl"]))
			fmt.Printf("wrote %s to log file\n", msg)
			CNFile.Sync()
		}
	}
}
