package controllers

import (
	"BagasA11/GSC-quizHealthEdu-BE/api/dto"
	"BagasA11/GSC-quizHealthEdu-BE/api/service"
	"BagasA11/GSC-quizHealthEdu-BE/configs"
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

type QuestionController struct {
	service *service.QuestionService
}

func NewQuestionController() *QuestionController {
	return &QuestionController{
		service: service.NewQuestionService(),
	}
}

func (qc *QuestionController) Create(c *gin.Context) {
	//token validation
	//token validation
	//get user id in token
	uID, exist := c.Get("ID")
	if !exist {
		c.JSON(http.StatusBadRequest, gin.H{
			"massage": "cannot find ID from header",
		})
		return
	}
	//get quiz id from url
	quizId, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		return
	}

	//get request data
	req := new(dto.Question)
	err = c.ShouldBindJSON(&req)
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
	id, err := qc.service.Create(uint(quizId), uID.(uint), req)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"message": "failed to create Question",
			"error":   err.Error(),
		})
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"message": "success",
		"id":      id,
	})
}

func (qc *QuestionController) FindID(c *gin.Context) {
	//token validation
	_, exist := c.Get("ID")
	if !exist {
		c.JSON(http.StatusBadRequest, "token not found")
		return
	}
	//retrieve id from url
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		return
	}
	q, err := qc.service.FindID(uint(id))
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{
			"massages": "question id not found",
		})
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"massage": "question was found",
		"data":    q,
	})
}

func (qc *QuestionController) AttemptQuiz(c *gin.Context) {
	//token validation
	uID, exist := c.Get("ID")
	if !exist {
		c.JSON(http.StatusBadRequest, "token id not found")
		return
	}

	// parsing url param
	//get quiz id
	quizID, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{
			"massage": "id not found or param id not set",
			"error":   err.Error(),
		})
		return
	}

	var sessname = fmt.Sprintf("quiz%duser%d", uint(quizID), uID.(uint))
	//session object instance
	session, err := configs.Store.Get(c.Request, sessname)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"massage":       "failed to start session",
			"error":         err.Error(),
			"sessions name": sessname,
		})
		return
	}

	q, err := qc.service.AttemptQuiz(uint(quizID))
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}

	// var point float32 = 0
	session.Values["rows"] = uint(len(q))
	rws := session.Values["rows"].(uint)
	err = session.Save(c.Request, c.Writer)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"massage": "failed to save session",
			"error":   err.Error(),
		})
		return
	}

	c.JSON(200, gin.H{
		"question": q,
		"rows":     len(q),
		"rws":      rws,
	})
}

func (qc *QuestionController) ReferToQuiz(c *gin.Context) {
	if _, exist := c.Get("ID"); !exist {
		c.JSON(http.StatusBadRequest, "token id not found")
		return
	}

	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{
			"massage": "id not found",
			"error":   err.Error(),
		})
		return
	}
	q, err := qc.service.ReferToQuiz(uint(id))
	//q: [{id, question, answer}, {id, question, answer}]
	//[{1, ".......", A}, {3, ....., C}, {11, ......, E}]
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		return
	}

	c.JSON(200, gin.H{
		"massages": "success",
		"data":     q,
	})
}

func (qc *QuestionController) Edit(c *gin.Context) {
	//token validation
	//get user id in token
	uID, exist := c.Get("ID")
	if !exist {
		c.JSON(http.StatusBadRequest, gin.H{
			"massage": "cannot find ID from header",
		})
		return
	}
	//get quiz id from url
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"massage": "failed to convert id to int",
			"error":   err.Error(),
		})
		return
	}
	//get request data
	//get request data
	req := new(dto.Question)
	err = c.ShouldBindJSON(&req)
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
	err = qc.service.Updates(uint(id), req, uID.(uint))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"message": "failed to update Question",
			"error":   err.Error(),
		})
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"message": "success",
	})
}

func (qc *QuestionController) UploadFile(c *gin.Context) {
	//token validation
	//get user id in token
	uID, exist := c.Get("ID")
	if !exist {
		c.JSON(http.StatusBadRequest, gin.H{
			"massage": "cannot find ID from header",
		})
		return
	}

	//get id parameter from url
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"massage": "failed to convert id to int",
			"error":   err.Error(),
		})
		return
	}
	dir, err := moveFile(c, uint(id))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"massage": "failed to upload file",
			"error":   err.Error(),
		})
		return
	}

	err = qc.service.SetImg(uint(id), uID.(uint), dir)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"massage": "failed to update avatar path",
			"error":   err.Error(),
		})
		return
	}
	c.JSON(http.StatusOK, "success")

}

func moveFile(c *gin.Context, id uint) (string, error) {
	file, err := c.FormFile("file")
	if err != nil {
		return "", err
	}
	//file extension validation
	ext := strings.Split(file.Filename, ".")[1]
	if ext == "" {
		return "", errors.New("file extension undefined")
	}
	if !slices.Contains([]string{"jpg", "png", "jpeg", "svg"}, ext) {
		return "", errors.New("file is not image type")
	}

	newname, err := helpers.Rename("question", id, ext)
	if err != nil {
		return "", err
	}

	err = c.SaveUploadedFile(file, fmt.Sprintf("asset/img/question/%s", newname))
	if err != nil {
		return "", err
	}

	return fmt.Sprintf("asset/img/question/%s", newname), nil
}

func (qc *QuestionController) Delete(c *gin.Context) {
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
	//url/question/id
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"massage": "invalid request",
			"error":   err,
		})
		return
	}

	//serving delete behavior
	err = qc.service.Delete(uint(id), uID.(uint))
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}
	c.JSON(http.StatusOK, "delete question success")
}

// func number(rows int) []uint {
// 	num := []uint{}
// 	for i := 1; i <= rows; i++ {
// 		num = append(num, uint(i))
// 	}
// 	return num
// }