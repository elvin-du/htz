package models

import (
	"time"
)

type Nav struct {
	Id   int
	Name string
	Uri  string
}

type NavItem struct {
	Id    int
	NavId int
	Name  string
	Uri   string
}

type Article struct {
	Id              int
	Title           string
	Content         string
	ContentAbstract string
	ReadCount       uint
	NavItemId       int
	CreatedAt       time.Time
}
