package controllers

import (
	"BagasA11/GSC-quizHealthEdu-BE/api/dto"
	"BagasA11/GSC-quizHealthEdu-BE/api/service"
	"fmt"
	"net/http"
	"strings"

	"github.com/gin-gonic/gin"
	"github.com/go-playground/validator/v10"
)

// "BagasA11/GSC-quizHealthEdu-BE/api/dto"
// 	"BagasA11/GSC-quizHealthEdu-BE/api/service"
// 	"fmt"
// 	"net/http"

// 	"github.com/gin-gonic/gin"
// 	"github.com/go-playground/validator/v10"

type AuthController struct {
	service *service.AuthService
}

func NewAuthController() *AuthController {
	return &AuthController{
		service: service.NewAuthService(),
	}
}

func (ac *AuthController) UserLogin(ctx *gin.Context) {
	//get data from request
	req := new(dto.UserLogin)
	err := ctx.ShouldBindJSON(&req)
	if err != nil {
		validationErrs, ok := err.(validator.ValidationErrors)
		if !ok {
			ctx.JSON(http.StatusBadRequest, gin.H{
				"massage": "Invalid request",
				"error":   err,
			})
			return
		}
		var errorMessage string
		for _, e := range validationErrs {
			errorMessage = fmt.Sprintf("error in field %s condition: %s", e.Field(), e.ActualTag())
			break
		}
		ctx.JSON(http.StatusBadRequest, errorMessage)
		return
	}
	//attempt login request to User login service
	//get access token
	accessToken, err := ac.service.UserLogin(req)
	if err != nil {
		ctx.JSON(http.StatusUnauthorized, gin.H{
			"message": "invalid credentials",
			"error":   err,
		})
		return
	}
	ctx.JSON(http.StatusOK, gin.H{
		"message": "login success",
		"token":   accessToken,
	})

}

func (ac *AuthController) AdmiLogin(c *gin.Context) {
	//bind data from request
	req := new(dto.AdminLogin)
	err := c.ShouldBindJSON(&req)
	//error validation
	if err != nil {
		validationErrs, ok := err.(validator.ValidationErrors)
		if !ok {
			c.JSON(http.StatusBadRequest, gin.H{
				"massage": "Invalid request",
				"error":   err,
			})
			return
		}
		var errorMessage string
		for _, e := range validationErrs {
			errorMessage = fmt.Sprintf("error in field %s condition: %s", e.Field(), e.ActualTag())
			break
		}
		c.JSON(http.StatusBadRequest, errorMessage)
		return
	}

	//attempt login request to User login service
	//get access token
	accessToken, err := ac.service.AdmiLogin(req)
	if err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{
			"message": "invalid credentials",
			"error":   err,
		})
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"message": "login success",
		"token":   accessToken,
	})
}

func (ac *AuthController) Logout(c *gin.Context) {
	//user id token validation
	_, exist := c.Get("ID")
	if !exist {
		c.JSON(http.StatusBadRequest, "user id not found")
		return
	}
	//get user token from auth header
	token := c.Request.Header.Get("Authorization")
	if token == "" {
		c.JSON(http.StatusUnauthorized, "user token required")
		return
	}
	if err := ac.service.Logout(strings.Split(token, " ")[1]); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"massage": "failed to logout",
			"error":   err,
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"massage": "logout success",
	})

}

func (ac *AuthController) AllToken(c *gin.Context) {
	bt, err := ac.service.ListAllToken()
	if err != nil {
		c.JSON(http.StatusBadRequest, "token are empty")
		return
	}
	c.JSON(200, gin.H{
		"all token": bt,
	})
}
