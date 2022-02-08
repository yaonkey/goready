package models

/*
mutex (sync)
atomic
reflect
слайсы и массивы
интерфейсы
горутины, каналы
строки
сборщик мусора
gin, echo
zap
viper
*/

import "time"

type User struct {
	Id        int
	Name      string
	Firstname string
	Email     string
	Is_ready  bool
	Birthday  time.Time
}

type UserController interface {
	Create(UserInfo *User)

	DeleteById(Id int)

	UpdateById(Id int, NewUser User)
	UpdateUserIsReadyStatus(Id int)

	GetUserName(Id int) string
	GetUserFirstname(Id int) string
	GetUserEmail(id int) string
	GetUserIsReadyStatus(Id int) bool
	GetUserIdByEmail(Email string) int
}
