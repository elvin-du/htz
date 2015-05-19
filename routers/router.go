package routers

import (
	"htz/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.MainController{})
    beego.Router("/about", &controllers.AboutController{})
    beego.Router("/news/:id", &controllers.NewsController{})
}
