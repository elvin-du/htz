package controllers

import (
	"htz/models"
	"time"
)

type Nav struct {
	models.Nav
	NavItems []*models.NavItem
}

type News struct {
	Title   string
	Content string
	Uri     string
	Date    time.Time
}
