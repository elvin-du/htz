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

	as, err := models.ArticleModel().Hots(10)
	if nil != err {
		beego.Error(err)
		this.Abort(err.Error())
		return
	}

	this.Data["Hots"] = as
	this.Data["Navs"] = ns
}
