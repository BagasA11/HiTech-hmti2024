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
	//token validation
	//get user id in token
	uID, exist := c.Get("ID")
	if !exist {
		c.JSON(http.StatusBadRequest, gin.H{
			"massage": "cannot find ID from header",
		})
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

	id, err := qc.service.CreateQuiz(req, uID.(uint))
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"massage": "failed to create data",
			"error":   err.Error(),
		})
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"massage": "success create data",
		"id":      id,
	})
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
			"error": err.Error(),
		})
		return
	}
	data, err := qc.service.GetByID(uint(id))
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{
			"error":   err.Error(),
			"massage": "Quiz id not found",
		})
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"massage": "success",
		"data":    data,
	})
}

func (qc *QuizController) Self(c *gin.Context) {
	//token validation
	//get user id in token
	uID, exist := c.Get("ID")
	if !exist {
		c.JSON(http.StatusBadRequest, gin.H{
			"massage": "cannot find ID from header",
		})
		return
	}
	data, err := qc.service.Self(uID.(uint))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"massage": "failed to get quiz data",
			"error":   err.Error(),
		})
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"data": data,
	})
}

func (qc *QuizController) Edit(c *gin.Context) {
	//token validation
	//get user id in token
	uID, exist := c.Get("ID")
	if !exist {
		c.JSON(http.StatusBadRequest, gin.H{
			"massage": "cannot find ID from header",
		})
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
			"massage": "failed convert id to int",
			"error":   err.Error(),
		})
		return
	}
	//serving to update data
	err = qc.service.Update(uint(id), uID.(uint), req)
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
	//get user id in token
	uID, exist := c.Get("ID")
	if !exist {
		c.JSON(http.StatusBadRequest, gin.H{
			"massage": "cannot find ID from header",
		})
		return
	}

	//get id from url
	// url/quiz/upload/:id
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"massage": "failed convert id to int",
			"error":   err.Error(),
		})
		return
	}

	//upload image from form file type

	filePath, err := upload(c, uint(id))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"massage": "failed to upload quiz image",
			"error":   err.Error(),
		})
		return
	}
	//save file path to database
	err = qc.service.UploadImgCover(uint(id), uID.(uint), filePath)
	//error validation
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"massage": "failed to upload quiz image",
			"error":   err.Error(),
		})
		return
	}
	c.JSON(http.StatusOK, "upload success")
}

func (qc *QuizController) Delete(c *gin.Context) {
	//token validation
	//get user id in token
	uID, exist := c.Get("ID")
	if !exist {
		c.JSON(http.StatusBadRequest, gin.H{
			"massage": "cannot find ID from header",
		})
		return
	}
	//retrieve id from url parameter
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		return
	}

	err = qc.service.Delete(uint(id), uID.(uint))
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

func upload(c *gin.Context, id uint) (string, error) {
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
	if !slices.Contains([]string{"jpg", "jpeg", "png", "svg"}, strings.ToLower(ext)) {
		return "", errors.New("file not image type")
	}

	newname, err := helpers.Rename("quiz", id, ext)
	if err != nil {
		return "", err
	}

	err = c.SaveUploadedFile(file, fmt.Sprintf("asset/img/quiz/%s", newname))
	if err != nil {
		return "", err
	}
	path := fmt.Sprintf("asset/img/quiz/%s", newname)
	return path, nil
}
