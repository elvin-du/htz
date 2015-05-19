package controllers

import(
    "time"
)

type Nav struct{
	Name string
	NavItems []*NavItem
}

type NavItem struct{
	Name string
	Uri string
}

type News struct{
    Title string
    Content string
    Uri string
    Date time.Time
}
