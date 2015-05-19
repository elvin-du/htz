package main

import (
	"github.com/astaxie/beego"
	_ "htz/routers"
	"htz/utils"
)

func main() {
	beego.Run()
}

func init() {
	beego.AddFuncMap("dateYMD", utils.DateYMD)
    beego.SetStaticPath("/public","static")
}
