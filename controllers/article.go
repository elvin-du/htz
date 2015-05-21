package controllers

import (
	"github.com/astaxie/beego"
	"htz/models"
	"strconv"
)

type ArticleController struct {
	Controller
}

func (this *ArticleController) Get() {
	idStr := this.Ctx.Input.Param(":id")
	id, err := strconv.Atoi(idStr)
	if nil != err {
		beego.Error(err)
		return
	}
	article, err := models.ArticleModel().InfoById(id)
	if nil != err {
		beego.Error(err)
		this.Abort(err.Error())
		return
	}

	this.Data["Article"] = article
	this.Layout = "common/layout.html"
	this.TplNames = "articles.html"
}

func (this *ArticleController) List() {
	kindStr := this.Ctx.Input.Param(":kind")
	kind, err := strconv.Atoi(kindStr)
	if nil != err {
		this.Abort(err.Error())
		return
	}

	as, err := models.ArticleModel().List(kind)
	if nil != err {
		beego.Error(err)
        this.Abort(err.Error())
		return
	}

    item, err := models.ArticleModel().NavItemById(kind)
	if nil != err {
		beego.Error(err)
        this.Abort(err.Error())
		return
	}

	this.Data["Articles"] = as
    this.Data["Kind"] = item
	this.Layout = "common/layout.html"
	this.TplNames = "articles.html"
}
