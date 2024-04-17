package controllers

import (
	"BagasA11/GSC-quizHealthEdu-BE/api/dto"
	"BagasA11/GSC-quizHealthEdu-BE/api/service"
	"errors"
	"fmt"
	"net/http"
	"slices"
	"strconv"
	"strings"

	"github.com/gin-gonic/gin"
	"github.com/go-playground/validator/v10"
	"github.com/google/uuid"
)

type UserController struct {
	service *service.UserService
}

func NewUserController() *UserController {
	return &UserController{
		service: service.NewUserService(),
	}
}

/*Create User or Player service*/
func (uc *UserController) CreateUser(c *gin.Context) {
	req := new(dto.UserCreate)
	err := c.ShouldBindJSON(&req)
	if err != nil {
		validationErrs, ok := err.(validator.ValidationErrors)
		if !ok {
			c.JSON(http.StatusBadRequest, "Invalid request")
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
	err = uc.service.CreateUser(req)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"message": "failed to create user",
			"error":   err,
		})
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"message": "success",
	})
}

func (uc *UserController) CreateAdmin(c *gin.Context) {
	//get Request data
	req := new(dto.AdminCreate)
	err := c.ShouldBindJSON(&req)
	if err != nil {
		validationErrs, ok := err.(validator.ValidationErrors)
		if !ok {
			c.JSON(http.StatusBadRequest, "Invalid request")
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
	//verify token type
	tokenType, exist := c.Get("TokenType")
	if !exist {
		c.JSON(http.StatusInternalServerError, gin.H{
			"message": "TokenType value not set",
		})
		return
	}

	if tokenType.(string) != "admin" {
		c.JSON(http.StatusForbidden, gin.H{
			"message": "User are not allowed to create Admin",
		})
		return
	}
	//service
	err = uc.service.CreateAdmin(req)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"message": "failed to create admin",
			"error":   err,
		})
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"message": "success",
	})
}

func (uc *UserController) FindUsername(c *gin.Context) {
	req := new(dto.FindUsername)
	err := c.ShouldBindJSON(&req)
	//request validation
	if err != nil {
		validationErrs, ok := err.(validator.ValidationErrors)
		if !ok {
			c.JSON(http.StatusBadRequest, "Invalid request")
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
	//token validation
	_, exist := c.Get("ID")
	if !exist {
		c.JSON(http.StatusInternalServerError, gin.H{
			"message": "id value not found",
		})
		return
	}
	//data query
	data, err := uc.service.GetUserByUsername(req.Username)
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{
			"message": "username not found",
		})
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"message": "username found",
		"data":    data,
	})
}

func (uc *UserController) FindAdminbyUsername(c *gin.Context) {
	//token validation
	//id checking
	_, exist := c.Get("ID")
	if !exist {
		c.JSON(http.StatusUnauthorized, "invalid Credentias")
		return
	}
	typ, exist := c.Get("TokenType")
	if !exist {
		c.JSON(http.StatusBadRequest, "invalid request")
		return
	}
	if typ.(string) != "admin" {
		c.JSON(http.StatusForbidden, gin.H{
			"message": "This page only for admin",
		})
		return
	}

	//bind data from request
	req := new(dto.FindUsername)
	err := c.ShouldBindJSON(&req)
	//request validation
	if err != nil {
		validationErrs, ok := err.(validator.ValidationErrors)
		if !ok {
			c.JSON(http.StatusBadRequest, "Invalid request")
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

	//send request data to service
	u, err := uc.service.GetAdminByUsername(req.Username)
	//error validation
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{
			"message": "username not found",
		})
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"message": "username found",
		"data":    u,
	})

}

func (uc *UserController) AdminID(c *gin.Context) {
	//token validation
	_, exist := c.Get("ID")
	if !exist {
		c.JSON(http.StatusUnauthorized, "invalid Credentias")
		return
	}
	typ, exist := c.Get("TokenType")
	if !exist {
		c.JSON(http.StatusBadRequest, "invalid request")
		return
	}
	if typ.(string) != "admin" {
		c.JSON(http.StatusForbidden, gin.H{
			"message": "This page only for admin",
		})
		return
	}
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err,
		})
		return
	}
	a, err := uc.service.GetAdminByID(uint(id))
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{
			"massage": "user not found",
		})
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"massage": "user found",
		"data":    a,
	})
}

func (uc *UserController) AllUser(c *gin.Context) {
	_, exist := c.Get("ID")
	if !exist {
		c.JSON(http.StatusUnauthorized, gin.H{
			"massage": "credentials not found",
		})
		return
	}
	u, err := uc.service.GetAllUser()
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"massage": "failed to get data",
		})
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"massage": "success",
		"data":    u,
	})
}

func (uc *UserController) GetUserByID(c *gin.Context) {
	//token validation
	_, exist := c.Get("ID")
	if !exist {
		c.JSON(http.StatusForbidden, gin.H{
			"message": "token not found",
		})
		return
	}

	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err,
		})
		return
	}
	u, err := uc.service.GetUserByID(uint(id))
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{
			"massage": "user not found",
		})
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"massage": "user found",
		"data":    u,
	})
}

func (uc *UserController) Me(c *gin.Context) {
	//token validation
	//get id from token
	ID, exist := c.Get("ID")
	if !exist {
		c.JSON(http.StatusUnauthorized, gin.H{
			"massage": "credentials not found",
		})
		return
	}
	u, err := uc.service.FindId(ID.(uint))
	//error validation
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{
			"massage": "not found",
			"error":   err,
		})
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"massage": "success",
		"data":    u,
	})
}

func (uc *UserController) UpdateUsername(ctx *gin.Context) {
	req := new(dto.UpdateUsername)
	err := ctx.ShouldBindJSON(&req)
	if err != nil {
		validationErrs, ok := err.(validator.ValidationErrors)
		if !ok {
			ctx.JSON(http.StatusBadRequest, "Invalid request")
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
	//Get User ID from Token
	ID, exist := ctx.Get("ID")
	if !exist {
		ctx.JSON(http.StatusInternalServerError, gin.H{
			"message": "id value not found",
		})
		return
	}
	//verify token type
	tokenType, exist := ctx.Get("TokenType")
	if !exist {
		ctx.JSON(http.StatusInternalServerError, gin.H{
			"message": "TokenType field not set",
		})
		return
	}

	if tokenType.(string) == "admin" {
		ctx.JSON(http.StatusForbidden, gin.H{
			"message": "Admin are not allowed change username",
		})
		return
	}
	err = uc.service.UpdateUsername(ID.(uint), *req)
	if err != nil {
		ctx.JSON(http.StatusBadRequest, gin.H{
			"message": "failed to update password",
			"error":   err,
		})
		return
	}
	ctx.JSON(http.StatusOK, gin.H{
		"message": "success",
	})
}

func (uc *UserController) UpdateAvatar(c *gin.Context) {
	//get id and token validation
	id, exist := c.Get("ID")
	if !exist {
		c.JSON(http.StatusInternalServerError, gin.H{
			"message": "id value not found",
		})
		return
	}

	filename, err := uploadAvatar(c)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"massage": "failed to upload avatar",
			"error":   err,
		})
		return
	}
	err = uc.service.SetAvatar(id.(uint), filename)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"massage": "failed to upload avatar",
			"error":   err,
		})
		return
	}
	c.JSON(http.StatusOK, "upload success")
}

/*return path of image and nil error if success, else: return empty string and error*/
func uploadAvatar(c *gin.Context) (string, error) {
	file, err := c.FormFile("file")
	if err != nil {
		return "", err
	}
	//file validation
	ext := strings.Split(file.Filename, ".")[1]
	if ext == "" {
		return "", errors.New("file has not extension")
	}
	if !slices.Contains([]string{"jpg", "jpeg", "png", "svg"}, ext) {
		return "", errors.New("file not image type")
	}

	filename := uuid.New().String() + "." + ext //img.jpg

	err = c.SaveUploadedFile(file, fmt.Sprintf("asset/img/user/%s", filename))
	if err != nil {
		return "", err
	}
	path := "/asset/img/user/" + filename
	return path, nil
}

func (uc *UserController) UpdatePassword(c *gin.Context) {
	req := new(dto.UpdatePassword)
	err := c.ShouldBindJSON(&req)
	if err != nil {
		validationErrs, ok := err.(validator.ValidationErrors)
		if !ok {
			c.JSON(http.StatusBadRequest, "Invalid request")
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
	//Jwt claims
	rawID, exist := c.Get("ID")
	if !exist {
		c.JSON(http.StatusInternalServerError, gin.H{
			"message": "id value not found",
		})
		return
	}
	ID, _ := rawID.(uint)
	// service
	err = uc.service.UpdatePassword(ID, req)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"message": "failed to update password",
			"error":   err,
		})
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"message": "success",
	})
}

func (uc *UserController) BlockUser(c *gin.Context) {
	tTyp, exist := c.Get("TokenType")
	if !exist {
		c.JSON(http.StatusInternalServerError, gin.H{
			"message": "token type not set",
		})
		return
	}
	if tTyp.(string) != "admin" {
		c.JSON(http.StatusForbidden, gin.H{
			"massage": "User are forbidden to block user",
		})
		return
	}
	//get id from url
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err,
		})
		return
	}
	err = uc.service.BlockUser(uint(id))
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{
			"message": "user id not found",
			"error":   err,
		})
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"message": "user block successfuly",
	})
}

func (uc *UserController) Delete(c *gin.Context) {
	req := new(*dto.DeleteUser)
	err := c.ShouldBindJSON(&req)
	if err != nil {
		validationErrs, ok := err.(validator.ValidationErrors)
		if !ok {
			c.JSON(http.StatusBadRequest, "Invalid request")
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

	id, exist := c.Get("ID")
	if !exist {
		c.JSON(http.StatusInternalServerError, gin.H{
			"message": "id value not found",
		})
		return
	}
	err = uc.service.DeleteUser(id.(uint), *req)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"message": "failed to update password",
			"error":   err,
		})
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"message": "success to Delete Account",
	})
}
