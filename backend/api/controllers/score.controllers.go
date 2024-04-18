package controllers

import (
	"BagasA11/GSC-quizHealthEdu-BE/api/dto"
	"BagasA11/GSC-quizHealthEdu-BE/api/service"
	"BagasA11/GSC-quizHealthEdu-BE/configs"
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

type ScoreController struct {
	service *service.ScoreService
}

func NewScoreController() *ScoreController {
	return &ScoreController{
		service: service.NewScoreService(),
	}
}

func (sc *ScoreController) CreateOrUpdate(c *gin.Context) {

	//session object instance
	session, err := configs.Store.Get(c.Request, "attempt-quiz")
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}

	//token validation
	//get user id from header

	userID, exist := c.Get("ID")
	if !exist {
		c.JSON(400, gin.H{
			"error": "user id is not exist",
		})
	}
	//get quiz id from url
	quizID, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(400, gin.H{
			"massage": "id on url not found or Failed to convert string into integer",
			"error":   err.Error(),
		})
		return
	}

	req := new(dto.Answer)
	// request validation
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
	//length validation
	if req.Num > req.Length {
		c.JSON(400, gin.H{
			"massage": "num is overide max number",
		})
		return
	}

	if req.Num <= 0 || req.Length <= 0 {
		c.JSON(400, gin.H{
			"error": "Num must be greater than 0",
		})
	}

	var point float32 = 0
	// var i float32 = float32(1)/float32(int32(5)) * 100

	if req.Num == 1 {

		if session.Values["id"] != nil {
			c.JSON(400, gin.H{
				"massage": "number 1st only can be accessed once",
			})
			return
		}

		if req.Answer == req.Checkbox {
			point = float32(1) / float32(int32(req.Length)) * 100
		}

		s := dto.Score{
			QuizID: uint(quizID),
			UserID: userID.(uint),
			Score:  point,
		}

		id, err := sc.service.Create(s)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{
				"massage": "failed to initializating score",
				"error":   err.Error(),
			})
			return
		}

		session.Values["point"] = point
		session.Values["id"] = id

		err = session.Save(c.Request, c.Writer)
		if err != nil {
			c.JSON(500, gin.H{"error": err.Error()})
			return
		}

		c.JSON(http.StatusOK, gin.H{
			"masssage": "continoue",
			"result":   req.Answer == req.Checkbox,
			"answer":   req.Answer,
			"point":    point,
		})
		return
	}

	if req.Num == req.Length {

		if session.Values["id"] == nil {
			c.JSON(400, "cannot skip 1st number")
			return
		}
		// get id from session
		scoreId := session.Values["id"].(uint)

		if req.Answer == req.Checkbox {
			point = float32(1) / float32(int32(req.Length)) * 100
		}

		if session.Values["point"] != nil {
			point += session.Values["point"].(float32)
		}

		s := dto.Score{
			QuizID: uint(quizID),
			UserID: userID.(uint),
			Score:  point,
		}

		//update score
		err := sc.service.Update(scoreId, s)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{
				"massage": "failed to update score",
				"error":   err.Error(),
			})
			return
		}

		//delete session
		session.Options.MaxAge = -1
		err = session.Save(c.Request, c.Writer)
		if err != nil {
			c.JSON(500, gin.H{
				"massage": "failed to delete session",
				"error":   err.Error(),
			})
			return
		}
		c.JSON(200, gin.H{
			"massage": "you have completed quiz",
			"score":   point,
		})
		return
	}

	//ensure that session was created
	if session.Values["id"] == nil {
		c.JSON(400, gin.H{
			"massage": "cannot skip 1st number ",
		})
		return
	}
	//get score id from session
	scoreID := session.Values["id"].(uint)

	if req.Answer == req.Checkbox {
		point = float32(1) / float32(int32(req.Length)) * 100
	}
	if session.Values["point"] != nil {
		point += session.Values["point"].(float32)
	}

	//update score based on score id
	s := dto.Score{
		UserID: userID.(uint),
		QuizID: uint(quizID),
		Score:  point,
	}
	err = sc.service.Update(scoreID, s)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"massage": "failed to update score",
			"error":   err.Error(),
		})
		return
	}

	//save session
	session.Values["point"] = point
	session.Values["id"] = scoreID
	err = session.Save(c.Request, c.Writer)
	if err != nil {
		c.JSON(500, gin.H{
			"massage": "failed to save session",
			"error":   err.Error(),
		})
		return
	}
	c.JSON(200, gin.H{
		"point":   point,
		"massage": "continue",
		"result":  req.Answer == req.Checkbox,
		"answer":  req.Answer,
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
