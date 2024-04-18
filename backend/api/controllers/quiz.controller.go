package controllers

// 	"BagasA11/GSC-quizHealthEdu-BE/api/service"

import (
	"BagasA11/GSC-quizHealthEdu-BE/api/dto"
	"BagasA11/GSC-quizHealthEdu-BE/api/service"
	"BagasA11/GSC-quizHealthEdu-BE/helpers"
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

type QuizController struct {
	service *service.QuizService
}

func NewQuizController() *QuizController {
	return &QuizController{
		service: service.NewQuizService(),
	}
}

func (qc *QuizController) Create(c *gin.Context) {
	typ, exist := c.Get("TokenType")
	if !exist {
		c.JSON(http.StatusBadRequest, "token type not set")
		return
	}
	if typ.(string) != "admin" {
		c.JSON(http.StatusUnauthorized, "you are not allowed to modificate quiz entity")
		return
	}
	//initial request data
	req := new(dto.QuizCreate)
	//bind data from request
	err := c.ShouldBindJSON(&req)
	//request validation
	if err != nil {
		validationErrs, ok := err.(validator.ValidationErrors)
		if !ok {
			c.JSON(http.StatusBadRequest, gin.H{
				"massage": "Invalid request",
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

	err = qc.service.CreateQuiz(req)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"massage": "failed to create data",
			"error":   err,
		})
		return
	}
	c.JSON(http.StatusOK, "success create data")
}

func (qc *QuizController) FindCheapest(c *gin.Context) {
	data, err := qc.service.Cheapest()
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"message": "failed to get data",
		})
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"massage": "ok",
		"data":    data,
	})
}

func (qc *QuizController) All(c *gin.Context) {
	q, err := qc.service.All()

	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"message": "failed to get data",
		})
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"massage": "ok",
		"data":    q,
	})
}

func (qc *QuizController) NotVerified(c *gin.Context) {
	//token validation
	typ, exist := c.Get("TokenType")
	if !exist {
		c.JSON(http.StatusBadRequest, "Token type not set in header")
		return
	}
	if typ.(string) != "admin" {
		c.JSON(http.StatusForbidden, "this resource is for admin only")
		return
	}

	q, err := qc.service.NotVerified()
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"massages": "failed to get data",
			"error":    err,
		})
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"massage": "success",
		"data":    q,
	})
}

func (qc *QuizController) FindTopic(c *gin.Context) {
	req := new(dto.FindTopic)
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
	q, err := qc.service.FindTopic(req.Topic)
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{
			"massage": "topic not found",
		})
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"massage": "topic found",
		"data":    q,
	})
}

func (qc *QuizController) FindTitle(c *gin.Context) {
	req := new(dto.FindTitle)
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
	q, err := qc.service.FindTopic(req.Title)
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{
			"massage": "title not found",
		})
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"massage": "title found",
		"data":    q,
	})
}

func (qc *QuizController) FindID(c *gin.Context) {
	//retrieve id from url
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err,
		})
		return
	}
	data, err := qc.service.GetByID(uint(id))
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{
			"massage": "Quiz id not found",
		})
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"massage": "success",
		"data":    data,
	})
}

func (qc *QuizController) Edit(c *gin.Context) {
	//token validation
	//get token type
	tokenType, exist := c.Get("TokenType")
	if !exist {
		c.JSON(http.StatusBadRequest, "token type not set")
		return
	}
	if tokenType.(string) != "admin" {
		c.JSON(http.StatusUnauthorized, "you are not allowed to modificate quiz entity")
		return
	}
	//parsing request body
	req := new(dto.QuizEdit)
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
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err,
		})
		return
	}
	//serving to update data
	err = qc.service.Update(uint(id), req)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"massage": "Failed to update Quiz",
		})
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"massage": "success",
	})
}

func (qc *QuizController) UploadImgCover(c *gin.Context) {
	//token validation
	tokenType, exist := c.Get("TokenType")
	if !exist {
		c.JSON(http.StatusBadRequest, "token type not set")
		return
	}
	if tokenType.(string) != "admin" {
		c.JSON(http.StatusForbidden, "user are not allowed to upload quiz image")
		return
	}

	//get id from url
	// url/quiz/upload/:id
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err,
		})
		return
	}

	//upload image from form file type
	oldFile, exist := qc.service.CheckIMG(uint(id))
	filePath, err := upload(c, oldFile, exist)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"massage": "failed to upload quiz image",
			"error":   err,
		})
		return
	}
	//save file path to database
	err = qc.service.UploadImgCover(uint(id), filePath)
	//error validation
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"massage": "failed to upload quiz image",
			"error":   err,
		})
		return
	}
	c.JSON(http.StatusOK, "upload success")
}

func upload(c *gin.Context, oldFile string, exist bool) (string, error) {
	file, err := c.FormFile("file")
	//request validation
	if err != nil {
		return "", err
	}
	//extension validation
	ext := strings.Split(file.Filename, ".")[1]
	if ext == "" {
		return "", errors.New("file has not extension")
	}
	if !slices.Contains([]string{"jpg", "jpeg", "png", "svg"}, ext) {
		return "", errors.New("file not image type")
	}

	//check if image exist in dir
	//img will be deleted
	if exist {
		//remove file from directory
		err := helpers.RemoveFile(oldFile, "quiz")
		//if error occur ... function will terminated with error
		if err != nil {
			return "", err
		}

	}
	var filename string = uuid.NewString() + "." + ext
	err = c.SaveUploadedFile(file, fmt.Sprintf("asset/img/quiz/%s", filename))
	if err != nil {
		return "", err
	}
	path := "/asset/img/question/" + filename
	return path, nil
}

func (qc *QuizController) Verify(c *gin.Context) {
	//token validation
	typ, exist := c.Get("TokenType")
	if !exist {
		c.JSON(http.StatusBadRequest, "token type value is not set")
		return
	}
	if typ.(string) != "admin" {
		c.JSON(http.StatusForbidden, "user cannot access this resource")
	}
	//get id from url
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err,
		})
		return
	}
	err = qc.service.Verify(uint(id))
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"massage": "failed to verifying quiz",
			"error":   err,
		})
		return
	}
	c.JSON(http.StatusOK, "success")
}

func (qc *QuizController) Delete(c *gin.Context) {
	//token validation
	//get token type
	tokenType, exist := c.Get("TokenType")
	if !exist {
		c.JSON(http.StatusBadRequest, "token type not set")
		return
	}
	if tokenType.(string) != "admin" {
		c.JSON(http.StatusUnauthorized, "user are not allowed to delete quiz entity")
		return
	}
	//retrieve id from url parameter
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err,
		})
		return
	}
	err = qc.service.Delete(uint(id))
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"massage": "Failed to delete Quiz",
		})
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"massage": "success to delete quiz object",
	})
}
