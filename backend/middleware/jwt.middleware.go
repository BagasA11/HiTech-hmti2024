package middleware

import (
	"BagasA11/GSC-quizHealthEdu-BE/helpers"
	"net/http"
	"strings"

	"github.com/gin-gonic/gin"
)

func JwtAuth() gin.HandlerFunc {
	return func(ctx *gin.Context) {
		authHeader := ctx.Request.Header.Get("Authorization")
		if authHeader == "" {
			ctx.JSON(http.StatusUnauthorized, gin.H{
				"error": "access token required",
			})
			ctx.Abort()
			return
		}
		authHeaderParts := strings.Split(authHeader, " ")
		if len(authHeaderParts) >= 2 && authHeaderParts[0] != "Bearer" {
			ctx.JSON(http.StatusBadRequest, gin.H{
				"error": "invalid type access token",
			})
			ctx.Abort()
			return
		}
		accessToken := authHeaderParts[1]
		claims, err := helpers.ValidateToken(accessToken)
		if err != nil {
			ctx.JSON(http.StatusUnauthorized, gin.H{
				"error":   err,
				"message": "failed to validate",
			})
			ctx.Abort()
			return
		}
		ctx.Set("ID", claims.ID)
		ctx.Set("Username", claims.Username)
		ctx.Set("TokenType", claims.TokenType)
		ctx.Next()
	}
}
