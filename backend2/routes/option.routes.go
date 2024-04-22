package routes

import (
	"BagasA11/GSC-quizHealthEdu-BE/api/controllers"
	"BagasA11/GSC-quizHealthEdu-BE/middleware"

	"github.com/gin-gonic/gin"
)

func OptionRoutes(group *gin.RouterGroup) {
	oc := controllers.NewOptionController()
	group.GET("/option/:id", middleware.JwtAuth(), oc.FindID)
	group.POST("/question/:id/option/create", middleware.JwtAuth(), oc.Create)
	group.PUT("/option/edit/:id", middleware.JwtAuth(), oc.Edit)
	group.DELETE("option/delete/:id")
}
