package configs

import (
	"BagasA11/GSC-quizHealthEdu-BE/api/models"
	"fmt"
	"os"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

//	"gorm.io/driver/mysql"
//	"gorm.io/gorm"
//
// ""
var dbClient *gorm.DB

func InitDb() error {
	var err error
	Dsn := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=utf8mb4&parseTime=True&loc=Local",
		os.Getenv("MYSQL_USERNAME"),
		os.Getenv("MYSQL_PASSWORD"),
		os.Getenv("MYSQL_HOST"),
		os.Getenv("MYSQL_PORT"),
		os.Getenv("MYSQL_DATABASE"),
	)
	dbClient, err = gorm.Open(mysql.Open(Dsn), &gorm.Config{})
	if err != nil {
		return err
	}
	// fmt.Println(dbClient)
	err = dbClient.AutoMigrate(&models.User{}, &models.Quiz{}, &models.Question{}, &models.Option{}, &models.Score{}, &models.TopUp{}, &models.Transaction{}, &models.BlacklistToken{})
	return err
}

func GetDB() *gorm.DB {
	return dbClient
}
