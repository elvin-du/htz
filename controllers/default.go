package controllers

import (
	"time"
)

type MainController struct {
	Controller
}

func (this *MainController) Get() {
	news1 := News{Title: "幸福内心禅（一百零八）", Content: `不屑与朋友去唱K而得罪了朋友该怎么办？
怎么区别“直性子”和“狭隘”？
家里常有太多剩菜，在爱惜食物和养生之间该怎么选择？
“打佛七”和学黄庭禅有冲突吗？
静坐4年了还是会昏沉和思绪纷飞该怎么办？
【公案】
有样东西“不是心，不是佛，不是物”，常常问自己“是个什么”也能开悟哦，试试看吧~
【见微知著】
“一个女子因为在开车时不断挑衅别人而遭暴打”的事件在网上引发热议，这竟然和小时候的教育有关。亲爱的爸妈们，在尊重孩子玩乐自由的同时，你也许正在给孩子种下“自私”的种子哦~`, Uri: "/news/1", Date: time.Now()}

	news2 := News{Title: "近期课程（广州、北京）", Content: `不屑与朋友去唱K而得罪了朋友该怎么办？
怎么区别“直性子”和“狭隘”？
家里常有太多剩菜，在爱惜食物和养生之间该怎么选择？
“打佛七”和学黄庭禅有冲突吗？
静坐4年了还是会昏沉和思绪纷飞该怎么办？
【公案】
有样东西“不是心，不是佛，不是物”，常常问自己“是个什么”也能开悟哦，试试看吧~
【见微知著】
“一个女子因为在开车时不断挑衅别人而遭暴打”的事件在网上引发热议，这竟然和小时候的教育有关。亲爱的爸妈们，在尊重孩子玩乐自由的同时，你也许正在给孩子种下“自私”的种子哦~`, Uri: "/news/2", Date: time.Now()}

	var newsArr = []*News{}
    newsArr = append(newsArr,&news1)
    newsArr = append(newsArr,&news2)

	this.Data["News"] = newsArr
	this.Data["IsHome"] = true
	this.Layout = "index.html"
	this.TplNames = "content.html"
}
