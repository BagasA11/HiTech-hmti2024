package routes

import (
	"BagasA11/GSC-quizHealthEdu-BE/api/controllers"
	"BagasA11/GSC-quizHealthEdu-BE/middleware"

	"github.com/gin-gonic/gin"
)

func QuizRoutes(group *gin.RouterGroup) {
	qc := controllers.NewQuizController()
	//create new quiz
	group.POST("/quiz/create", middleware.JwtAuth(), qc.Create)
	//order quiz by lowest price
	group.GET("/quiz/cheapest", qc.FindCheapest)
	//get all quiz data
	group.GET("/quiz", qc.All)
	//get quiz detail by id
	group.GET("/quiz/:id", qc.FindID)

	//show all quiz where not verified by admin
	//admin only
	group.GET("/quiz/not-verified", middleware.JwtAuth(), qc.NotVerified)
	//search quiz with title
	group.POST("/quiz/title", qc.FindTitle)
	//search quiz with topic
	group.POST("/quiz/topic", qc.FindTopic)
	group.PUT("/quiz/edit/:id", middleware.JwtAuth(), qc.Edit)
	//verified quiz content
	group.PUT("/quiz/verify/:id", middleware.JwtAuth(), qc.Verify)
	group.PUT("/quiz/upload/:id", middleware.JwtAuth(), qc.UploadImgCover)
	group.DELETE("/quiz/delete/:id", middleware.JwtAuth(), qc.Delete)
}
