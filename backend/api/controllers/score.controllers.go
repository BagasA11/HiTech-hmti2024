package controllers

import (
	"BagasA11/GSC-quizHealthEdu-BE/api/dto"

	"BagasA11/GSC-quizHealthEdu-BE/api/service"
	"BagasA11/GSC-quizHealthEdu-BE/configs"
	"fmt"
	"net/http"
	"strconv"
	_ "time"

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
	var quest service.QuestionService
	uID, exist := c.Get("ID")
	if !exist {
		c.JSON(http.StatusBadRequest, gin.H{
			"massage": "cannot find ID from header",
		})
		return
	}

	quizID, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"massage": "cannot convert string to integer or url id is unavailable",
			"error":   err.Error(),
		})
		return
	}

	req := new(dto.Answer)
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

	if session.Values["rows"] == nil {
		c.JSON(http.StatusBadRequest, "session.rows value not set")
		return
	}

	if session.Values["step"] == nil {
		session.Values["step"] = uint(0)
	}

	step := session.Values["step"].(uint)

	if step+1 > session.Values["rows"].(uint) {
		c.JSON(http.StatusBadRequest, "cannot override question")
	}
	var pts float32 = 0

	if step == 0 {
		ans, err := quest.GetAnswer(req.Ids[step])
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{
				"massage": fmt.Sprintf("cannot refers question on %d", req.Ids[step]),
			})
			return
		}

		if req.Checkbox == ans {
			pts = 1 / (float32(session.Values["rows"].(uint)))
		}

		SID, err := sc.service.Create(dto.Score{
			QuizID: uint(quizID),
			UserID: uID.(uint),
			Score:  pts,
		})

		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{
				"massage": "failed to save score",
				"error":   err.Error(),
			})

			return
		}

		session.Values["point"] = pts
		session.Values["step"] = step + 1
		session.Values["sid"] = SID
		err = session.Save(c.Request, c.Writer)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{
				"massage": "failed to save point",
				"error":   err.Error(),
			})
			return
		}

		c.JSON(http.StatusOK, gin.H{
			"point":  pts,
			"answer": ans,
		})
		return

	} else if (step > 0) && (int(step+1) < session.Values["rows"].(int)) {

		ans, err := quest.GetAnswer(req.Ids[step])
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{
				"massage": fmt.Sprintf("cannot refers question on %d", req.Ids[step]),
			})
			return
		}

		pts = session.Values["point"].(float32)
		if req.Checkbox == ans {
			pts += 1 / float32(session.Values["rows"].(int))
		}

		sid := session.Values["sid"].(uint)
		err = sc.service.Update(sid, dto.Score{
			Score:  pts,
			QuizID: uint(quizID),
			UserID: uID.(uint),
		})
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{
				"massage": "failed to save score",
				"error":   err.Error(),
			})
			return
		}

		session.Values["point"] = pts
		session.Values["step"] = step + 1
		session.Values["sid"] = sid
		err = session.Save(c.Request, c.Writer)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{
				"massage": "failed to save point",
				"error":   err.Error(),
			})
			return
		}

		c.JSON(http.StatusOK, gin.H{
			"point":  pts,
			"answer": ans,
		})
		return
	}

	step = session.Values["step"].(uint)
	sid := session.Values["sid"].(uint)
	ans, err := quest.GetAnswer(req.Ids[step])

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"massage": fmt.Sprintf("cannot refers question on %d", req.Ids[step]),
		})
		return
	}

	if req.Checkbox == ans {
		pts += 1 / (float32(session.Values["rows"].(int)))
	}

	err = sc.service.Update(sid, dto.Score{
		UserID: uID.(uint),
		QuizID: uint(quizID),
		Score:  pts,
	})
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"massage": "failed to save score",
			"error":   err.Error(),
		})
		return
	}

	session.Options.MaxAge = -1
	err = session.Save(c.Request, c.Writer)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"massage": "failed to save point",
			"error":   err.Error(),
		})
		return
	}

	rank, _ := sc.service.You(uint(quizID), uID.(uint))

	c.JSON(http.StatusOK, gin.H{
		"massage":     "congratulations",
		"total score": pts,
		"rank":        rank,
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
			"error":   err.Error(),
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
			"error":   err.Error(),
		})
		return
	}
	c.JSON(200, gin.H{
		"data": s,
	})
}
