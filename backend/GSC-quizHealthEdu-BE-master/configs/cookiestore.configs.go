package configs

import (
	"os"

	"github.com/gorilla/sessions"
)

var Store = sessions.NewCookieStore([]byte(os.Getenv("SESSION_KEY")))

//var Store = 7aR9bYpL3jKvX5qF2wN6tH8eZsDxJ1
