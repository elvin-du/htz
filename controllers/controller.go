package controllers

import (
	"github.com/astaxie/beego"
)

type Controller struct {
	beego.Controller
}

func (this *Controller) Prepare() {
	navs := []*Nav{}

	var navItems []*NavItem
	item1 := NavItem{Name: "创始人介绍", Uri: "#"}
	navItems = append(navItems, &item1)

	item2 := NavItem{Name: "初衷与愿景", Uri: "#"}
	navItems = append(navItems, &item2)

	item3 := NavItem{Name: "开山点滴故事", Uri: "#"}
	navItems = append(navItems, &item3)

	item4 := NavItem{Name: "中岭山风光", Uri: "#"}
	navItems = append(navItems, &item4)

	nav1 := Nav{Name: "中岭山禅院", NavItems: navItems}
	navs = append(navs, &nav1)

	var navItems2 []*NavItem
	item5 := NavItem{Name: "创始人介绍", Uri: "#"}
	navItems2 = append(navItems2, &item5)

	item6 := NavItem{Name: "初衷与愿景", Uri: "#"}
	navItems2 = append(navItems2, &item6)

	item7 := NavItem{Name: "开山点滴故事", Uri: "#"}
	navItems2 = append(navItems2, &item7)

	item8 := NavItem{Name: "中岭山风光", Uri: "#"}
	navItems2 = append(navItems2, &item8)

	nav2 := Nav{Name: "中岭山禅院", NavItems: navItems2}
	navs = append(navs, &nav2)

	this.Data["Navs"] = navs
}
