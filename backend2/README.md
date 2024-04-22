
# Healthy Quiz - Backend Application

Healthy Quiz is a health-themed quiz application to answer solutions in 2024. Healthy quiz was created as an implementation of the 3rd UN SDG, by providing health education to the public.
 


## Badges



![MariaDB](https://img.shields.io/badge/MariaDB-003545?style=for-the-badge&logo=mariadb&logoColor=white)![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)
![Go](https://img.shields.io/badge/go-%2300ADD8.svg?style=for-the-badge&logo=go&logoColor=white)
![Postman](https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white)
![Apache](https://img.shields.io/badge/apache-%23D42029.svg?style=for-the-badge&logo=apache&logoColor=white)
![Canva](https://img.shields.io/badge/Canva-%2300C4CC.svg?&style=for-the-badge&logo=Canva&logoColor=white)
![jwt](https://img.shields.io/badge/JWT-000000?style=for-the-badge&logo=JSON%20web%20tokens&logoColor=white)


## Member of groups

- [@bagasa11](https://www.github.com/bagasa11)
- [@RAYNF](https://github.com/RAYNF)
- [@davidsugiarto](daaddimaki04@gmail.com)
- [#Ficky maulandani](muhammadficki01@gmail.com)




## License
[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)




## Features

### for User
- Authentication (register, login, logout)
- Grouping quiz
- Leaderboard
- jwt auth
### for Admin
- Authentication (login, logout)
- Create new admin account
- Create, edit, delete, and validate for quiz object
- Manage users
## Run Locally

Clone the project

```bash
  git clone https://github.com/BagasA11/GSC-quizHealthEdu-BE.git
```

install go 1.21 or latest 
```bash
  https://go.dev/dl/
```
move project into go directory
```bash
  local:\go\{GSC-quizHealthEdu-BE.git}
```
go to clone project
```bash
  cd GSC-quizHealthEdu-BE.git
```
run web server and mysql 

Start the server: open cmd 
```bash
    go run main.go
```


## Configure

### using Env file
this is an Env file. You can change 
some attributes as needed
```bash
MYSQL_HOST=127.0.0.1
MYSQL_PORT=3306
MYSQL_USERNAME=root
MYSQL_PASSWORD=
MYSQL_DATABASE=golang-gsc2024
HOST_PORT=8080

JWT_SECRET_KEY=506c616e74207472656573

GIN_MODE=debug
SESSION_KEY=7aR9bYpL3jKvX5qF2wN6tH8eZsDxJ1

```

- SESSION_KEY Field
Field SESSION_KEY is still not implemented because there is an issue when creating a new session with the gorilla package

- Release mode
If you want to deploy your this project to an online server, change 'GIN_MODE' field to 'release'.

```bash
GIN_MODE=release
```

### mysql
- Import SQL file from Project to MySQL client application
- change MYSQL_DATABASE field in the .env with  your db name
```bash
  MYSQL_DATABASE={database name}
```

### postman
- find postman collection file in project
```bash
    GSC-quizHealthEdu-BE/GOOGLE SOLUTION CHALLANGE.postman_collection.json
```
- import this file to postman workspace
```bash
  warning: Make sure that the database name, host, database username, and port match in the env file !!!
```
## 🔗 Mobile apps repository
https://github.com/RAYNF/HealtyQuizz

