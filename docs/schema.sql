CREATE DATABASE IF NOT EXISTS `htz` DEFAULT CHARACTER SET utf8;
USE `htz`;

DROP TABLE IF EXISTS `navs`;
CREATE TABLE `navs`(
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(100) NOT NULL DEFAULT '',
	`uri` VARCHAR(500) NOT NULL DEFAULT '/',
	PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `nav_items`;
CREATE TABLE `nav_items`(
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`nav_id` INT UNSIGNED NOT NULL,
	`name` VARCHAR(100) NOT NULL DEFAULT '',
	`uri` VARCHAR(500) NOT NULL DEFAULT '/',
	PRIMARY KEY (`id`),
	KEY `nav_items_nav_id` (`nav_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles`(
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(100) NOT NULL DEFAULT '',
	`content_abstract` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`content` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`nav_item_id` INT UNSIGNED NOT NULL,
	`read_count` INT UNSIGNED NOT NULL DEFAULT 0,
	`created_at` DATETIME NOT NULL,
	PRIMARY KEY (`id`),
	KEY `articles_nav_item_id_created_at` (`nav_item_id`,`created_at`),
	KEY `articles_read_count_nav_item_id` (`read_count`,`nav_item_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO navs SET id=1, name='中岭山禅院',uri='/navs/1';
INSERT INTO navs SET id=2, name='黄庭禅',uri='/navs/2';
INSERT INTO navs SET id=3, name='讲师著作及下载',uri='/navs/3';
INSERT INTO navs SET id=4, name='在线讲座',uri='/navs/4';
INSERT INTO navs SET id=5, name='黄庭禅电子报',uri='/navs/5';
INSERT INTO navs SET id=6, name='菜根香',uri='/navs/6';
INSERT INTO navs SET id=7, name='近期活动',uri='/navs/7';

INSERT INTO nav_items SET id=1, nav_id=1,uri='/founder', name='创办人介绍';
INSERT INTO nav_items SET id=2, nav_id=1,uri='/vision', name='初衷与愿景';
INSERT INTO nav_items SET id=3, nav_id=1,uri='/startup-story', name='开山点滴故事';
INSERT INTO nav_items SET id=4, nav_id=1,uri='/zhonglingshan', name='中岭山风光';

INSERT INTO nav_items SET id=5, nav_id=2,uri='/articles/5', name='黄庭禅浅释';
INSERT INTO nav_items SET id=6, nav_id=2,uri='/articles/6', name='黄庭禅禅修课程';
INSERT INTO nav_items SET id=7, nav_id=2,uri='/articles/7', name='黄庭禅禅修心得';
INSERT INTO nav_items SET id=8, nav_id=2,uri='/articles/8', name='禅坐释疑';
INSERT INTO nav_items SET id=9, nav_id=2,uri='/articles/9', name='基本概念释疑';
INSERT INTO nav_items SET id=10, nav_id=2,uri='/articles/10', name='内管实修释疑';
INSERT INTO nav_items SET id=11, nav_id=2,uri='/articles/11', name='解脱真意释疑';

INSERT INTO nav_items SET id=12, nav_id=3,uri='/articles/12', name='已出版著作';
INSERT INTO nav_items SET id=13, nav_id=3,uri='/articles/13', name='国学';
INSERT INTO nav_items SET id=14, nav_id=3,uri='/articles/14', name='佛学';
INSERT INTO nav_items SET id=15, nav_id=3,uri='/articles/15', name='其他';

INSERT INTO nav_items SET id=16, nav_id=4,uri='/articles/16', name='参加方法';
INSERT INTO nav_items SET id=17, nav_id=4,uri='/articles/17', name='往期录音';

INSERT INTO nav_items SET id=18, nav_id=5,uri='/epaper/newest', name='最新电子报';
INSERT INTO nav_items SET id=19, nav_id=5,uri='/epapers', name='各期电子报查询';
INSERT INTO nav_items SET id=20, nav_id=5,uri='mailto:dumanxiang@163.com?subject=subscribe-epaper', name='订阅电子报';
INSERT INTO nav_items SET id=21, nav_id=5,uri='/cotribute-email', name='投稿邮箱';

INSERT INTO nav_items SET id=22, nav_id=6,uri='/articles/22', name='分享文章';
INSERT INTO nav_items SET id=23, nav_id=6,uri='/articles/23', name='素食料理';
INSERT INTO nav_items SET id=24, nav_id=6,uri='/articles/24', name='百草园';

INSERT INTO nav_items SET id=25, nav_id=7,uri='/articles/25', name='精品课程';
INSERT INTO nav_items SET id=26, nav_id=7,uri='/articles/26', name='新闻与动态';
INSERT INTO nav_items SET id=27, nav_id=7,uri='/articles/27', name='着陆引言-直指方向';
INSERT INTO nav_items SET id=28, nav_id=7,uri='/articles/28', name='着陆结语-讲师的提醒（三分钟）';
INSERT INTO nav_items SET id=29, nav_id=7,uri='/articles/29', name='着陆-晚两秒';
INSERT INTO nav_items SET id=30, nav_id=7,uri='/articles/30', name='着陆-成人成己';
INSERT INTO nav_items SET id=31, nav_id=7,uri='/articles/31', name='着陆-大小先后';
INSERT INTO nav_items SET id=32, nav_id=7,uri='/articles/32', name='近期内陆课程';
INSERT INTO nav_items SET id=33, nav_id=7,uri='/articles/33', name='近期中岭山课程';

INSERT INTO articles SET id=1, title='酸辣海带豆干丝',content_abstract='酸味的主要来源是醋。醋由粮食等含糖原料，经过微生物发酵，慢慢酿造熟成。中国人从西周就开始酿醋，以谷物为原料，外国则多用葡萄等水果。但现代人急功近利，人工快速合成醋大行其道', content='<p>
    <span style="background-color: rgb(155, 187, 89);"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</p>
<h1 style="line-height: 40px; height: auto; text-align: center; font-size: 20px; font-family: 黑体, 宋体; font-weight: normal; color: rgb(112, 112, 112); white-space: normal;">
    <span style="color: rgb(255, 0, 0); background-color: rgb(255, 255, 255);">酸辣海带豆干丝</span>
</h1>
<p>
    <span style="color: rgb(255, 0, 0); background-color: rgb(255, 255, 255);"></span>
</p>
<hr/>
<p style="text-align: center;">
    <span style="color: rgb(129, 129, 129); font-family: 宋体; font-size: 13.3333330154419px; line-height: 14px; text-align: center; text-indent: 40px;">2012-08-01 16:13&nbsp;</span><br/>
</p>
<p>
    <span style="color: rgb(255, 0, 0); background-color: rgb(255, 255, 255);"></span>
</p>
<hr/>
<p>
    <span style="color: rgb(255, 0, 0); background-color: rgb(255, 255, 255);"></span><br/>
</p>
<p>
    <span style="color: rgb(255, 0, 0); background-color: rgb(255, 255, 255);"><br/></span>
</p>
<p>
    <span style="background-color: rgb(255, 255, 255);">&nbsp; &nbsp; &nbsp; &nbsp;<span style="color: rgb(112, 112, 112); font-family: 宋体; font-size: 14.6666669845581px; line-height: 26px; text-indent: 26px;">夏日炎炎，憧憬大海，纯净而蔚蓝地覆盖着地球表面的百分之七十，自远古以来就是孕育生命的广阔摇篮。住在海边的人，时常和海亲密接触，三餐都离不开海，而最常吃的蔬菜恐怕就是鲜美的海带。</span></span>
</p>
<p>
    <span style="color: rgb(112, 112, 112); font-family: 宋体; font-size: 14.6666669845581px; line-height: 26px; text-indent: 26px; background-color: rgb(255, 255, 255);">&nbsp;&nbsp;&nbsp;&nbsp;海带营养价值很高，富含矿物质、微量元素和胶质，更具“碱性食物之冠”的美名，很有利于平衡现代人普遍偏酸的体质。带着浓浓大海气息的海带，可拌可炒可汤可卤，花样多多搭配随意，是难得的营养好煮食材。本期“菜根香”为大家推荐最简单的酸辣凉拌法来做海带，酸味收敛，辣味发散，彼此平衡，且温热的辣味还可调和海带的寒性，一举两得哦～</span>
</p>
<p>
    <span style="color: rgb(112, 112, 112); font-family: 宋体; font-size: 14.6666669845581px; line-height: 26px; text-indent: 26px; background-color: rgb(255, 255, 255);">&nbsp;准备：<br/></span>
</p>
<ul class=" list-paddingleft-2" style="list-style-type: disc;">
    <li>
        <p>
            <span style="background-color: rgb(255, 255, 255);">海带干用冷水浸泡8-12小时。完全泡发后，用盐搓洗，去除黏液，切丝待用。</span>
        </p>
    </li>
    <li>
        <p>
            <span style="background-color: rgb(255, 255, 255);">豆干洗净，切丝。</span>
        </p>
    </li>
    <li>
        <p>
            <span style="background-color: rgb(255, 255, 255);">青辣椒洗净，去籽，切丝。</span>
        </p>
        <p>
            <br/>
        </p>
    </li>
</ul>
<p>
    <br/>
</p>
<p>
    <br/>
</p>
<p>
    <span style="color: rgb(112, 112, 112); font-family: 宋体; font-size: 14.6666669845581px; line-height: 26px; text-indent: 26px;"><br/></span>
</p>',read_count=3, nav_item_id=23,created_at='2015-05-20 20:08:09';

INSERT INTO articles SET id=2, title='姜麻油拌茄丝',content_abstract='通常来讲，我们会觉得令自己感到舒适、愉悦的就是“好情绪”；令自己不适的就是“坏情绪”。但情绪真的有好坏之分吗，我们能说愤怒是不好的，悲伤是不好的，恐惧是不好的吗', content='<p>
    <span style="background-color: rgb(155, 187, 89);"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</p>
<h1 style="line-height: 40px; height: auto; text-align: center; font-size: 20px; font-family: 黑体, 宋体; font-weight: normal; color: rgb(112, 112, 112); white-space: normal;">
    <span style="color: rgb(255, 0, 0); background-color: rgb(255, 255, 255);">酸辣海带豆干丝</span>
</h1>
<p>
    <span style="color: rgb(255, 0, 0); background-color: rgb(255, 255, 255);"></span>
</p>
<hr/>
<p style="text-align: center;">
    <span style="color: rgb(129, 129, 129); font-family: 宋体; font-size: 13.3333330154419px; line-height: 14px; text-align: center; text-indent: 40px;">2012-08-01 16:13&nbsp;</span><br/>
</p>
<p>
    <span style="color: rgb(255, 0, 0); background-color: rgb(255, 255, 255);"></span>
</p>
<hr/>
<p>
    <span style="color: rgb(255, 0, 0); background-color: rgb(255, 255, 255);"></span><br/>
</p>
<p>
    <span style="color: rgb(255, 0, 0); background-color: rgb(255, 255, 255);"><br/></span>
</p>
<p>
    <span style="background-color: rgb(255, 255, 255);">&nbsp; &nbsp; &nbsp; &nbsp;<span style="color: rgb(112, 112, 112); font-family: 宋体; font-size: 14.6666669845581px; line-height: 26px; text-indent: 26px;">夏日炎炎，憧憬大海，纯净而蔚蓝地覆盖着地球表面的百分之七十，自远古以来就是孕育生命的广阔摇篮。住在海边的人，时常和海亲密接触，三餐都离不开海，而最常吃的蔬菜恐怕就是鲜美的海带。</span></span>
</p>
<p>
    <span style="color: rgb(112, 112, 112); font-family: 宋体; font-size: 14.6666669845581px; line-height: 26px; text-indent: 26px; background-color: rgb(255, 255, 255);">&nbsp;&nbsp;&nbsp;&nbsp;海带营养价值很高，富含矿物质、微量元素和胶质，更具“碱性食物之冠”的美名，很有利于平衡现代人普遍偏酸的体质。带着浓浓大海气息的海带，可拌可炒可汤可卤，花样多多搭配随意，是难得的营养好煮食材。本期“菜根香”为大家推荐最简单的酸辣凉拌法来做海带，酸味收敛，辣味发散，彼此平衡，且温热的辣味还可调和海带的寒性，一举两得哦～</span>
</p>
<p>
    <span style="color: rgb(112, 112, 112); font-family: 宋体; font-size: 14.6666669845581px; line-height: 26px; text-indent: 26px; background-color: rgb(255, 255, 255);">&nbsp;准备：<br/></span>
</p>
<ul class=" list-paddingleft-2" style="list-style-type: disc;">
    <li>
        <p>
            <span style="background-color: rgb(255, 255, 255);">海带干用冷水浸泡8-12小时。完全泡发后，用盐搓洗，去除黏液，切丝待用。</span>
        </p>
    </li>
    <li>
        <p>
            <span style="background-color: rgb(255, 255, 255);">豆干洗净，切丝。</span>
        </p>
    </li>
    <li>
        <p>
            <span style="background-color: rgb(255, 255, 255);">青辣椒洗净，去籽，切丝。</span>
        </p>
        <p>
            <br/>
        </p>
    </li>
</ul>
<p>
    <br/>
</p>
<p>
    <br/>
</p>
<p>
    <span style="color: rgb(112, 112, 112); font-family: 宋体; font-size: 14.6666669845581px; line-height: 26px; text-indent: 26px;"><br/></span>
</p>',read_count=2, nav_item_id=23,created_at='2015-05-20 20:08:09';

INSERT INTO articles SET id=3, title='盐水煮毛豆',content_abstract='在我们的教育中，流露情绪往往被认为是不好的。在古代，“喜怒不形于色”会被认为是有涵养的表现。而直到现在，人们也会认为：生气会伤害到别人，哭泣会麻烦到别人、会被人看不起等等',content='<p>
    <span style="background-color: rgb(155, 187, 89);"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</p>
<h1 style="line-height: 40px; height: auto; text-align: center; font-size: 20px; font-family: 黑体, 宋体; font-weight: normal; color: rgb(112, 112, 112); white-space: normal;">
    <span style="color: rgb(255, 0, 0); background-color: rgb(255, 255, 255);">酸辣海带豆干丝</span>
</h1>
<p>
    <span style="color: rgb(255, 0, 0); background-color: rgb(255, 255, 255);"></span>
</p>
<hr/>
<p style="text-align: center;">
    <span style="color: rgb(129, 129, 129); font-family: 宋体; font-size: 13.3333330154419px; line-height: 14px; text-align: center; text-indent: 40px;">2012-08-01 16:13&nbsp;</span><br/>
</p>
<p>
    <span style="color: rgb(255, 0, 0); background-color: rgb(255, 255, 255);"></span>
</p>
<hr/>
<p>
    <span style="color: rgb(255, 0, 0); background-color: rgb(255, 255, 255);"></span><br/>
</p>
<p>
    <span style="color: rgb(255, 0, 0); background-color: rgb(255, 255, 255);"><br/></span>
</p>
<p>
    <span style="background-color: rgb(255, 255, 255);">&nbsp; &nbsp; &nbsp; &nbsp;<span style="color: rgb(112, 112, 112); font-family: 宋体; font-size: 14.6666669845581px; line-height: 26px; text-indent: 26px;">夏日炎炎，憧憬大海，纯净而蔚蓝地覆盖着地球表面的百分之七十，自远古以来就是孕育生命的广阔摇篮。住在海边的人，时常和海亲密接触，三餐都离不开海，而最常吃的蔬菜恐怕就是鲜美的海带。</span></span>
</p>
<p>
    <span style="color: rgb(112, 112, 112); font-family: 宋体; font-size: 14.6666669845581px; line-height: 26px; text-indent: 26px; background-color: rgb(255, 255, 255);">&nbsp;&nbsp;&nbsp;&nbsp;海带营养价值很高，富含矿物质、微量元素和胶质，更具“碱性食物之冠”的美名，很有利于平衡现代人普遍偏酸的体质。带着浓浓大海气息的海带，可拌可炒可汤可卤，花样多多搭配随意，是难得的营养好煮食材。本期“菜根香”为大家推荐最简单的酸辣凉拌法来做海带，酸味收敛，辣味发散，彼此平衡，且温热的辣味还可调和海带的寒性，一举两得哦～</span>
</p>
<p>
    <span style="color: rgb(112, 112, 112); font-family: 宋体; font-size: 14.6666669845581px; line-height: 26px; text-indent: 26px; background-color: rgb(255, 255, 255);">&nbsp;准备：<br/></span>
</p>
<ul class=" list-paddingleft-2" style="list-style-type: disc;">
    <li>
        <p>
            <span style="background-color: rgb(255, 255, 255);">海带干用冷水浸泡8-12小时。完全泡发后，用盐搓洗，去除黏液，切丝待用。</span>
        </p>
    </li>
    <li>
        <p>
            <span style="background-color: rgb(255, 255, 255);">豆干洗净，切丝。</span>
        </p>
    </li>
    <li>
        <p>
            <span style="background-color: rgb(255, 255, 255);">青辣椒洗净，去籽，切丝。</span>
        </p>
        <p>
            <br/>
        </p>
    </li>
</ul>
<p>
    <br/>
</p>
<p>
    <br/>
</p>
<p>
    <span style="color: rgb(112, 112, 112); font-family: 宋体; font-size: 14.6666669845581px; line-height: 26px; text-indent: 26px;"><br/></span>
</p>', read_count=8,nav_item_id=23,created_at='2015-05-20 20:08:09';

INSERT INTO articles SET id=4, title='自制蕃茄酱意大利面',content_abstract='有人认为情绪是必须被控制的，有人则感觉情绪完全不由自主，能把人淹没。或许你我都经历过一个突如其来的情绪，然后长时间陷入其中无法自拔。但仔细想想，我们真的无法自拔',content='<p>
    <span style="background-color: rgb(155, 187, 89);"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</p>
<h1 style="line-height: 40px; height: auto; text-align: center; font-size: 20px; font-family: 黑体, 宋体; font-weight: normal; color: rgb(112, 112, 112); white-space: normal;">
    <span style="color: rgb(255, 0, 0); background-color: rgb(255, 255, 255);">酸辣海带豆干丝</span>
</h1>
<p>
    <span style="color: rgb(255, 0, 0); background-color: rgb(255, 255, 255);"></span>
</p>
<hr/>
<p style="text-align: center;">
    <span style="color: rgb(129, 129, 129); font-family: 宋体; font-size: 13.3333330154419px; line-height: 14px; text-align: center; text-indent: 40px;">2012-08-01 16:13&nbsp;</span><br/>
</p>
<p>
    <span style="color: rgb(255, 0, 0); background-color: rgb(255, 255, 255);"></span>
</p>
<hr/>
<p>
    <span style="color: rgb(255, 0, 0); background-color: rgb(255, 255, 255);"></span><br/>
</p>
<p>
    <span style="color: rgb(255, 0, 0); background-color: rgb(255, 255, 255);"><br/></span>
</p>
<p>
    <span style="background-color: rgb(255, 255, 255);">&nbsp; &nbsp; &nbsp; &nbsp;<span style="color: rgb(112, 112, 112); font-family: 宋体; font-size: 14.6666669845581px; line-height: 26px; text-indent: 26px;">夏日炎炎，憧憬大海，纯净而蔚蓝地覆盖着地球表面的百分之七十，自远古以来就是孕育生命的广阔摇篮。住在海边的人，时常和海亲密接触，三餐都离不开海，而最常吃的蔬菜恐怕就是鲜美的海带。</span></span>
</p>
<p>
    <span style="color: rgb(112, 112, 112); font-family: 宋体; font-size: 14.6666669845581px; line-height: 26px; text-indent: 26px; background-color: rgb(255, 255, 255);">&nbsp;&nbsp;&nbsp;&nbsp;海带营养价值很高，富含矿物质、微量元素和胶质，更具“碱性食物之冠”的美名，很有利于平衡现代人普遍偏酸的体质。带着浓浓大海气息的海带，可拌可炒可汤可卤，花样多多搭配随意，是难得的营养好煮食材。本期“菜根香”为大家推荐最简单的酸辣凉拌法来做海带，酸味收敛，辣味发散，彼此平衡，且温热的辣味还可调和海带的寒性，一举两得哦～</span>
</p>
<p>
    <span style="color: rgb(112, 112, 112); font-family: 宋体; font-size: 14.6666669845581px; line-height: 26px; text-indent: 26px; background-color: rgb(255, 255, 255);">&nbsp;准备：<br/></span>
</p>
<ul class=" list-paddingleft-2" style="list-style-type: disc;">
    <li>
        <p>
            <span style="background-color: rgb(255, 255, 255);">海带干用冷水浸泡8-12小时。完全泡发后，用盐搓洗，去除黏液，切丝待用。</span>
        </p>
    </li>
    <li>
        <p>
            <span style="background-color: rgb(255, 255, 255);">豆干洗净，切丝。</span>
        </p>
    </li>
    <li>
        <p>
            <span style="background-color: rgb(255, 255, 255);">青辣椒洗净，去籽，切丝。</span>
        </p>
        <p>
            <br/>
        </p>
    </li>
</ul>
<p>
    <br/>
</p>
<p>
    <br/>
</p>
<p>
    <span style="color: rgb(112, 112, 112); font-family: 宋体; font-size: 14.6666669845581px; line-height: 26px; text-indent: 26px;"><br/></span>
</p>',read_count=4, nav_item_id=23,created_at='2015-05-20 20:08:09';
