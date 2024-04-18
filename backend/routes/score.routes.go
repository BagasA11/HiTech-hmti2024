package routes

import (
	"BagasA11/GSC-quizHealthEdu-BE/api/controllers"
	"BagasA11/GSC-quizHealthEdu-BE/middleware"

	"github.com/gin-gonic/gin"
)

func ScoreRoutes(group *gin.RouterGroup) {
	sc := controllers.NewScoreController()
	group.GET("/quiz/:id/rank", middleware.JwtAuth(), sc.Rank)
	group.GET("/history", middleware.JwtAuth(), sc.History)
	group.PUT("/quiz/:id/post", middleware.JwtAuth(), sc.CreateOrUpdate)
}
