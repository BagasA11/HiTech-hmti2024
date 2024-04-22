package middleware

import (
	"fmt"
	"log"
	"time"

	"github.com/gin-gonic/gin"
)

func Logger() gin.HandlerFunc {
	return func(ctx *gin.Context) {
		//time
		//ip adrress
		//user-agent
		//protocol
		//method
		//path
		s := "\n===================================\n"
		s += fmt.Sprintf("time:\t %v \n client-IP:\t %s \n user-agent:\t %s \n\n", time.Now(), ctx.ClientIP(), ctx.Request.UserAgent())
		s += fmt.Sprintf("protocol:\t%s\n method:\t %s \n url:\t %s \n\n %s", ctx.Request.Proto, ctx.Request.Method, ctx.FullPath(), "=================================")
		log.Println(s)
		ctx.Next()
	}
}
