package models

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
)

type navModel struct{}

var _nav navModel

func NavModel() *navModel {
	return &_nav
}

func (this *navModel) Navs() ([]*Nav, error) {
	var navs = []*Nav{}

	o := orm.NewOrm()
	_, err := o.Raw("SELECT * FROM navs").QueryRows(&navs)
	if nil != err && orm.ErrNoRows != err{
		beego.Error(err)
		return nil, err
	}

	return navs, nil
}

func (this *navModel) NavItems(id int) ([]*NavItem, error) {
	var navItems = []*NavItem{}

	o := orm.NewOrm()
	_, err := o.Raw("SELECT * FROM nav_items WHERE nav_id=?", id).QueryRows(&navItems)
	if nil != err {
		beego.Error(err)
		return nil, err
	}

	if nil != err && orm.ErrNoRows != err{
		beego.Error(err)
		return nil, err
	}

	return navItems, nil
}

//func (this *navModel) InfoById(id int) (*Nav, error) {
//	var navs = []*Nav{}

//	o := orm.NewOrm()
//	_, err := o.Raw("SELECT * FROM navs").QueryRows(&navs)
//	if nil != err && orm.ErrNoRows != err{
//		beego.Error(err)
//		return nil, err
//	}

//	return navs, nil
//}
