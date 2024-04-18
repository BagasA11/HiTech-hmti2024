package main

import (
	"BagasA11/GSC-quizHealthEdu-BE/configs"
	"BagasA11/GSC-quizHealthEdu-BE/routes"
	"fmt"
	"log"

	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
)

func main() {
	fmt.Println("=====================================")
	fmt.Println()
	fmt.Println()
	fmt.Println("main.go ...\t...")
	err := godotenv.Load()
	if err != nil {
		log.Fatalf("Some error occured. Err: %s", err)
	}
	fmt.Print("print error when migrating:\t", configs.InitDb(), "\n")
	fmt.Println("get db pointer:\t", configs.GetDB())
	r := gin.Default()
	routes.RegisterRoutes(r)

}
