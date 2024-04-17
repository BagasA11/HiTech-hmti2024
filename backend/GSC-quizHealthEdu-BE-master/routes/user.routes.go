package routes

// Create data for admin => middleware.Jwt
// Create data for User
// Login for admin
// Login for User
// Update Username => middleware.Jwt
// Update password => middleware.Jwt
import (
	"BagasA11/GSC-quizHealthEdu-BE/api/controllers"
	"BagasA11/GSC-quizHealthEdu-BE/middleware"

	"github.com/gin-gonic/gin"
)

func UserRoutes(group *gin.RouterGroup) {
	uc := controllers.NewUserController()
	ac := controllers.NewAuthController()

	//user
	//User Registration
	//using logger middleware
	group.Use(middleware.Logger())
	group.POST("/user/register", uc.CreateUser)
	//user login
	group.POST("/user/login", ac.UserLogin)
	//find user by its username
	group.POST("/user/username", middleware.JwtAuth(), uc.FindUsername)
	//get all user
	group.GET("/user/all", middleware.JwtAuth(), uc.AllUser)
	//get user & admin profile
	group.GET("/user", middleware.JwtAuth(), uc.Me)
	//see another user profile by id given
	group.GET("/user/:id", middleware.JwtAuth(), uc.GetUserByID)
	//logout
	group.GET("/user/logout", middleware.JwtAuth(), ac.Logout)
	//update username ... admin is not allowed to update username
	group.PUT("/user/username/update", middleware.JwtAuth(), uc.UpdateUsername)
	//update password
	group.PUT("/user/password", middleware.JwtAuth(), uc.UpdatePassword)
	//avatar
	group.PUT("/user/avatar", middleware.JwtAuth(), uc.UpdateAvatar)
	//delete user
	group.DELETE("/user/delete", middleware.JwtAuth(), uc.Delete)

	// ==================================

	//admin
	// login page for admin
	group.POST("/user/admin/login", ac.AdmiLogin)
	//Create another admin
	group.POST("/user/admin/create", middleware.JwtAuth(), uc.CreateAdmin)
	//find admin by username
	group.POST("/user/admin/username", middleware.JwtAuth(), uc.FindAdminbyUsername)
	//get admin by id
	group.GET("/user/admin/:id", middleware.JwtAuth(), uc.AdminID)
	//block user ... admin cannot be blocked
	group.PUT("/user/block/:id", middleware.JwtAuth(), uc.BlockUser)
	//general

	group.GET("/token", ac.AllToken)
}
