package models

import (
	"errors"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	"strconv"
	"time"
)

type articleModel struct{}

var _article articleModel

func ArticleModel() *articleModel {
	return &_article
}

func (this *articleModel) List(kind int) ([]*Article, error) {
	var maps []orm.Params
	beego.Debug(kind)
	o := orm.NewOrm()
	_, err := o.Raw("SELECT id,title,content,created_at FROM articles WHERE nav_item_id = ? ORDER BY created_at DESC", kind).Values(&maps)
	if nil != err {
		beego.Error(err)
		return nil, err
	}

	if len(maps) == 0 {
		return nil, errors.New("not found")
	}

	var as = []*Article{}
	for _, v := range maps {
		var a Article
		a.Id, err = strconv.Atoi(v["id"].(string))
		if nil != err {
			beego.Error(err)
			return nil, err
		}
		a.Title = v["title"].(string)
		a.Content = v["content"].(string)
		createdAt, err := strconv.ParseInt(v["created_at"].(string), 10, 64)
		if nil != err {
			beego.Error(err)
			return nil, err
		}

		a.CreatedAt = time.Unix(createdAt, 0)

		a.NavItemId = kind
		beego.Debug(a)
		as = append(as, &a)
	}

	return as, nil
}

func (this *articleModel) InfoById(id int) (*Article, error) {
	var a Article

	o := orm.NewOrm()
	err := o.Raw("SELECT id,title,content,nav_item_id, created_at FROM articles WHERE id = ?", id).QueryRow(&a)
	if nil != err {
		beego.Error(err)
		return nil, err
	}

	return &a, nil
}
