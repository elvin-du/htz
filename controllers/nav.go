package controllers

import (
	"github.com/astaxie/beego"
	"htz/models"
	"strconv"
)

type NavController struct {
	Controller
}

func (this *NavController) Get() {
	idStr := this.Ctx.Input.Param(":id")
	id, err := strconv.Atoi(idStr)
	if nil != err {
		beego.Error(err)
        this.Abort(err.Error())
		return
	}

	article, err := models.NavModel().InfoById(id)
	if nil != err {
		beego.Error(err)
		this.Abort(err.Error())
		return
	}

	this.Data["Article"] = article
	this.Layout = "index.html"
	this.TplNames = "articles.html"
}
