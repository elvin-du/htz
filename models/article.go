package models

import (
	//	"errors"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
)

type articleModel struct{}

var _article articleModel

func ArticleModel() *articleModel {
	return &_article
}

func (this *articleModel) List(kind int) ([]*Article, error) {
	var as = []*Article{}

	o := orm.NewOrm()
	_, err := o.Raw("SELECT id,title,content,content_abstract,read_count,created_at FROM articles WHERE nav_item_id = ? ORDER BY created_at DESC", kind).QueryRows(&as)
	if nil != err {
		beego.Error(err)
		if orm.ErrNoRows == err {
			return as, nil
		}

		return nil, err
	}

	return as, nil
}

func (this *articleModel) InfoById(id int) (*Article, error) {
	var a Article

	o := orm.NewOrm()
	err := o.Raw("SELECT id,title,content,nav_item_id,content_abstract,read_count, created_at FROM articles WHERE id = ?", id).QueryRow(&a)
	if nil != err {
		beego.Error(err)
		if orm.ErrNoRows == err {
			return &a, nil
		}

		return nil, err
	}
	return &a, nil
}

func (this *articleModel) Hots(num int) ([]*Article, error) {
	var as = []*Article{}

	o := orm.NewOrm()
	_, err := o.Raw("SELECT * FROM articles ORDER BY read_count DESC LIMIT ?", num).QueryRows(&as)
	if nil != err {
		beego.Error(err)
		if orm.ErrNoRows == err {
			return as, nil
		}

		return nil, err
	}

	return as, nil
}

func (this *articleModel) HotsByKind(kind, num int) ([]*Article, error) {
	var as = []*Article{}

	o := orm.NewOrm()
	_, err := o.Raw("SELECT * FROM articles WHERE nav_item_id = ? ORDER BY read_count DESC LIMIT ?", kind, num).QueryRows(&as)
	if nil != err {
		beego.Error(err)
		if orm.ErrNoRows == err {
			return as, nil
		}

		return nil, err
	}
	return as, nil
}

func (this *articleModel) NavItemById(id int) (*NavItem, error) {
	var item NavItem

	o := orm.NewOrm()
	err := o.Raw("SELECT * FROM nav_items WHERE id = ?", id).QueryRow(&item)
	if nil != err {
		beego.Error(err)
		if orm.ErrNoRows == err {
			return &item, nil
		}

		return nil, err
	}

	return &item, nil
}
