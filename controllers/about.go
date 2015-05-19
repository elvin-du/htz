package controllers

type AboutController struct {
	Controller
}

func (this *AboutController) Get() {
	this.Data["Email"] = "dumanxiang@163.com"
	this.Layout = "index.html"
	this.TplNames = "about.html"
}
