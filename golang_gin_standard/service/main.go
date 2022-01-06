package main

import (
	"fmt"
	"net/http"
	"runtime"

	"github.com/gin-gonic/gin"
)

type responseStruct struct {
	Status           string `json:"status"`
	Message          string `json:"message"`
	Stack            string `json:"stack"`
	StackVersion     string `json:"stackversion"`
	Framework        string `json:"framework"`
	FrameworkVersion string `json:"frameworkversion"`
	BaseImageVersion string `json:"baseimageversion"`
	PackageManager   string `json:"packagemanager"`
}

var response = responseStruct{
	Status:           "success",
	Message:          "Hello World!",
	Stack:            "go",
	Framework:        "gin",
	StackVersion:     runtime.Version(),
	FrameworkVersion: gin.Version,
	BaseImageVersion: "Debian 10 (buster)",
	PackageManager:   "GOLang",
}

func getResponse(c *gin.Context) {
	c.IndentedJSON(http.StatusOK, response)
}

const addr = "0.0.0.0:1300"

func main() {
	fmt.Printf("[%v] Server golang app (standard) - addr: %s\n", runtime.Version(), addr)

	gin.SetMode(gin.ReleaseMode)
	router := gin.Default()
	router.GET("/", getResponse)

	router.Run(addr)
}
