package dto

type Score struct {
	QuizID uint    `json:"quizId" binding:"required"`
	UserID uint    `json:"userId" binding:"required"`
	Score  float32 `json:"score" binding:"required"`
}

type Answer struct {
	ID       uint   `json:"id" binding:"required"`
	Checkbox string `json:"checkbox" binding:"required,max=1"`
}

type Send struct {
	Answer []Answer
}
