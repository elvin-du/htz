package models

import (
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql" // import your used driver
)

func init() {
	// set default database
	orm.RegisterDataBase("default", "mysql", "root:@/htz?charset=utf8", 30)
}
