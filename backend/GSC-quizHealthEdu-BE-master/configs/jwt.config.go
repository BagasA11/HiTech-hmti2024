package configs

import (
	"os"

	"github.com/golang-jwt/jwt/v5"
)

var JWT_KEY = []byte(os.Getenv("JWT_SECRET_KEY"))

type JWTClaims struct {
	ID        uint   `json:"id"`
	Username  string `json:"username"`
	TokenType string `json:"tokenType"`
	jwt.RegisteredClaims
}
