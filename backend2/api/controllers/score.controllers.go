package controllers

import (
	"BagasA11/GSC-quizHealthEdu-BE/api/dto"
	"BagasA11/GSC-quizHealthEdu-BE/api/service"
	"fmt"
	"net/http"

	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/go-playground/validator/v10"
)

// "BagasA11/GSC-quizHealthEdu-BE/api/service"
// "strconv"
// "fmt"
// "github.com/joho/godotenv"
// "BagasA11/GSC-quizHealthEdu-BE/api/dto"
// os

// var Store = sessions.NewCookieStore([]byte("7aR9bYpL3jKvX5qF2wN6tH8eZsDxJ1"))

// var Store = sessions.NewCookieStore([]byte(os.Getenv("SESSION_KEY")))

type ScoreController struct {
	service *service.ScoreService
}

func NewScoreController() *ScoreController {
	return &ScoreController{
		service: service.NewScoreService(),
	}
}

func (sc *ScoreController) Create(c *gin.Context) {
	//token validation
	userID, exist := c.Get("ID")
	if !exist {
		c.JSON(http.StatusBadRequest, "user id not found")
		return
	}
	// convert str to int
	// get id from url
	quizID, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"massage": "cannot convert string to integer or url id is unavailable",
			"error":   err.Error(),
		})
		return
	}

	var quest = service.NewQuestionService()

	req := new(dto.Send)
	if err = c.ShouldBindJSON(&req); err != nil {
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

	var counter int = 0
	issue := []string{}

	for id, val := range req.Answer {
		ans, err := quest.FindAnswer(val.ID)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{
				"error": err.Error(),
			})
			return
		}

		if ans == "" {
			issue[id] = "questions not found"
			continue
		}

		if val.Checkbox == ans {
			counter++
		}
	}

	score := float32(counter) / float32(len(req.Answer)) * 100
	err = sc.service.Create(dto.Score{
		UserID: userID.(uint),
		QuizID: uint(quizID),
		Score:  score,
	})
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"massage": "failed to save score",
			"error":   err.Error(),
		})
	}

	c.JSON(http.StatusOK, gin.H{
		"massage": "congratulations",
		"score":   score,
		"issue":   issue,
	})

}

func (ss *ScoreController) Rank(c *gin.Context) {
	//token validation
	_, exist := c.Get("ID")
	if !exist {
		c.JSON(http.StatusBadRequest, "user id not found")
		return
	}
	quizID, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"massage": "cannot convert string to integer or url id is unavailable",
			"error":   err,
		})
		return
	}
	score, err := ss.service.Rank(uint(quizID))
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"massage": "cannot serve request",
			"error":   err,
		})
		return
	}
	c.JSON(200, gin.H{
		"data": score,
	})
}

func (sc *ScoreController) History(c *gin.Context) {
	//get user id from token
	userID, exist := c.Get("ID")
	if !exist {
		c.JSON(http.StatusBadRequest, "user id not found")
		return
	}

	s, err := sc.service.GetHistory(userID.(uint))
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"massage": "cannot serve request",
			"error":   err,
		})
		return
	}
	c.JSON(200, gin.H{
		"data": s,
	})
}
