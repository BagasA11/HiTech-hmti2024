package dto

type Score struct {
	QuizID uint    `json:"quizId" binding:"required"`
	UserID uint    `json:"userId" binding:"required"`
	Score  float32 `json:"score" binding:"required"`
}

type Answer struct {
	Num      uint   `json:"num" binding:"required"`
	Length   uint   `json:"length" binding:"required"`
	Answer   string `json:"answer" binding:"required,max=1"`
	Checkbox string `json:"checkbox" binding:"required,max=1"`
}
