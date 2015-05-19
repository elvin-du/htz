package controllers

import (
	"time"
)

type NewsController struct {
	Controller
}

func (this *NewsController) Get() {
	id := this.Ctx.Input.Param(":id")
	switch id {
	case "1":
		this.Data["News"] = `不屑与朋友去唱K而得罪了朋友该怎么办？
怎么区别“直性子”和“狭隘”？
家里常有太多剩菜，在爱惜食物和养生之间该怎么选择？
“打佛七”和学黄庭禅有冲突吗？
静坐4年了还是会昏沉和思绪纷飞该怎么办？
【公案】
有样东西“不是心，不是佛，不是物”，常常问自己“是个什么”也能开悟哦，试试看吧~
【见微知著】
“一个女子因为在开车时不断挑衅别人而遭暴打”的事件在网上引发热议，这竟然和小时候的教育有关。亲爱的爸妈们，在尊重孩子玩乐自由的同时，你也许正在给孩子种下“自私”的种子哦~`
	case "2":
		this.Data["News"] = `爱虽重要，却不易拿捏，许多人受困于原生家庭因为爱而导致的内心创伤，倍感痛苦。殊不知，一扇通往终极解脱的大门，正藏在这痛苦的背后……`
	}

	this.Data["Date"] = time.Now()
	this.Layout = "index.html"
	this.TplNames = "news.html"
}
