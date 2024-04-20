package dto

type QuizCreate struct {
	Title string `form:"title"`
	Topic string `form:"topic"`
	Desc  string `form:"desc"`
}

type QuizEdit struct {
	Title string `json:"title"`
	Topic string `json:"topic"`
	Desc  string `json:"desc"`
}
type Question struct {
	Question string `json:"question" binding:"required"`
	Answer   string `json:"answer" binding:"required"`
	Dura     int    `json:"dura" binding:"required"`
}

type Option struct {
	Alphabet string  `json:"options" binding:"required,max=1"`
	Txt      string  `json:"desc" binding:"required"`
	Color    *string `json:"color"`
}

type FindTopic struct {
	Topic string `json:"topic" binding:"required"`
}

type FindTitle struct {
	Title string `json:"title" binding:"required"`
}
