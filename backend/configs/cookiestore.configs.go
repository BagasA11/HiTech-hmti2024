package configs

import (
	"github.com/gorilla/sessions"
)

var Store = sessions.NewCookieStore([]byte("asdaskdhasdhgsajdgasdsadksakdhasidoajsdousahdopj"))

// var Store = ""
