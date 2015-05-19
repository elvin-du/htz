package models

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
    "strconv"
)

type navModel struct{}

var _nav navModel

func NavModel() *navModel {
	return &_nav
}

func (this *navModel) Navs() ([]*Nav, error) {
	var navs = []*Nav{}
	var maps []orm.Params

	o := orm.NewOrm()
	_, err := o.Raw("SELECT id,name FROM navs").Values(&maps)
	if nil != err {
		beego.Error(err)
		return nil, err
	}

	for _, v := range maps {
		var nav Nav
		nav.Id,err = strconv.Atoi(v["id"].(string))
        if nil != err{
            beego.Error(err)
            return nil,err
        }
        nav.Name = v["name"].(string)
		navs = append(navs, &nav)
	}

	return navs, nil
}

func (this *navModel) NavItems(id int) ([]*NavItem, error) {
	var navItems = []*NavItem{}
	var maps []orm.Params

	o := orm.NewOrm()
	_, err := o.Raw("SELECT id,nav_id,name,uri FROM nav_items WHERE nav_id=?", id).Values(&maps)
	if nil != err {
		beego.Error(err)
		return nil, err
	}

	for _, v := range maps {
		var item NavItem
		item.Id,err = strconv.Atoi(v["id"].(string))
        if nil != err{
            beego.Error(err)
            return nil,err
        }
		item.Name = v["name"].(string)
		item.NavId = id
		item.Uri = v["uri"].(string)
		navItems = append(navItems, &item)
	}

	return navItems, nil
}
