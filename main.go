package main

import (
	_ "htz/routers"
	"github.com/astaxie/beego"
    "htz/utils"
)

func main() {
    beego.AddFuncMap("dateYMD",utils.DateYMD)
	beego.Run()
}

