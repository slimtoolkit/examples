package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

type responseStruct struct {
	Status      string `json:"status"`
	Message string `json:"message"`
}

var response = responseStruct{
	ID:      "Success",
	Message: "Hello World!",
}

func getResponse(c *gin.Context) {
	c.IndentedJSON(http.StatusOK, response)
}

func main() {
	gin.SetMode(gin.ReleaseMode)
	router := gin.Default()
	router.GET("/", getResponse)

	router.Run("0.0.0.0:1300")
}
