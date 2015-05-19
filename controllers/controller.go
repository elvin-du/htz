package controllers

import (
	"github.com/astaxie/beego"
	"htz/models"
)

type Controller struct {
	beego.Controller
}

func (this *Controller) Prepare() {
	navs, err := models.NavModel().Navs()
	if nil != err {
		beego.Error(err)
		this.Abort(err.Error())
		return
	}

	var ns = []*Nav{}

	for _, v := range navs {
		items, err := models.NavModel().NavItems(v.Id)
		if nil != err {
			beego.Error(err)
			this.Abort(err.Error())
			return
		}

		var n Nav
		n.Id = v.Id
		n.Name = v.Name
		n.NavItems = items
		ns = append(ns, &n)
	}


	//	var navItems []*NavItem
	//	item1 := NavItem{Name: "创始人介绍", Uri: "#"}
	//	navItems = append(navItems, &item1)

	//	item2 := NavItem{Name: "初衷与愿景", Uri: "#"}
	//	navItems = append(navItems, &item2)

	//	item3 := NavItem{Name: "开山点滴故事", Uri: "#"}
	//	navItems = append(navItems, &item3)

	//	item4 := NavItem{Name: "中岭山风光", Uri: "#"}
	//	navItems = append(navItems, &item4)

	//	nav1 := Nav{Name: "中岭山禅院", NavItems: navItems}
	//	navs = append(navs, &nav1)

	//	var navItems2 []*NavItem
	//	item5 := NavItem{Name: "创始人介绍", Uri: "#"}
	//	navItems2 = append(navItems2, &item5)

	//	item6 := NavItem{Name: "初衷与愿景", Uri: "#"}
	//	navItems2 = append(navItems2, &item6)

	//	item7 := NavItem{Name: "开山点滴故事", Uri: "#"}
	//	navItems2 = append(navItems2, &item7)

	//	item8 := NavItem{Name: "中岭山风光", Uri: "#"}
	//	navItems2 = append(navItems2, &item8)

	//	nav2 := Nav{Name: "中岭山禅院", NavItems: navItems2}
	//	navs = append(navs, &nav2)

	this.Data["Navs"] = ns
}
