package routers

import (
	"htz/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.HomeController{})
    beego.Router("/news/:id", &controllers.NewsController{})
    beego.Router("/article/:id", &controllers.ArticleController{},"get:Get")
    beego.Router("/articles/:kind", &controllers.ArticleController{},"get:List")
    beego.Router("/navs/:id", &controllers.NavController{})
}
