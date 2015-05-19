CREATE DATABASE IF NOT EXISTS `htz` DEFAULT CHARACTER SET utf8;
USE `htz`;

DROP TABLE IF EXISTS `navs`;
CREATE TABLE `navs`(
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(100) NOT NULL DEFAULT '',
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
	`content` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`nav_item_id` INT UNSIGNED NOT NULL,
	`created_at` INT UNSIGNED NOT NULL,
	PRIMARY KEY (`id`),
	KEY `articles_nav_item_id_created_at` (`nav_item_id`,`created_at`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO navs SET id=1, name='中岭山禅院';
INSERT INTO navs SET id=2, name='黄庭禅';
INSERT INTO navs SET id=3, name='讲师著作及下载';
INSERT INTO navs SET id=4, name='在线讲座';
INSERT INTO navs SET id=5, name='黄庭禅电子报';
INSERT INTO navs SET id=6, name='菜根香';
INSERT INTO navs SET id=7, name='近期活动';

INSERT INTO nav_items SET id=1, nav_id=1,uri='/about', name='创办人介绍';
INSERT INTO nav_items SET id=2, nav_id=1,uri='/', name='初衷与愿景';
INSERT INTO nav_items SET id=3, nav_id=1,uri='/', name='开山点滴故事';
INSERT INTO nav_items SET id=4, nav_id=1,uri='/', name='中岭山风光';

INSERT INTO nav_items SET id=5, nav_id=2,uri='/articles/2', name='黄庭禅浅释';
INSERT INTO nav_items SET id=6, nav_id=2,uri='/articles/2', name='黄庭禅禅修课程';
INSERT INTO nav_items SET id=7, nav_id=2,uri='/articles/2', name='黄庭禅禅修心得';
INSERT INTO nav_items SET id=8, nav_id=2,uri='/articles/2', name='禅坐释疑';
INSERT INTO nav_items SET id=9, nav_id=2,uri='/articles/2', name='基本概念释疑';
INSERT INTO nav_items SET id=10, nav_id=2,uri='/articles/2', name='内管实修释疑';
INSERT INTO nav_items SET id=11, nav_id=2,uri='/articles/2', name='解脱真意释疑';

INSERT INTO nav_items SET id=12, nav_id=3,uri='/articles/3', name='已出版著作';
INSERT INTO nav_items SET id=13, nav_id=3,uri='/articles/3', name='国学';
INSERT INTO nav_items SET id=14, nav_id=3,uri='/articles/3', name='佛学';
INSERT INTO nav_items SET id=15, nav_id=3,uri='/articles/3', name='其他';

INSERT INTO nav_items SET id=16, nav_id=4,uri='/', name='参加方法';
INSERT INTO nav_items SET id=17, nav_id=4,uri='/', name='往期录音';

INSERT INTO nav_items SET id=18, nav_id=5,uri='/', name='最新电子报';
INSERT INTO nav_items SET id=19, nav_id=5,uri='/', name='各期电子报查询';
INSERT INTO nav_items SET id=20, nav_id=5,uri='/', name='订阅电子报';
INSERT INTO nav_items SET id=21, nav_id=5,uri='/', name='投稿邮箱';

INSERT INTO nav_items SET id=22, nav_id=6,uri='/articles/6', name='分享文章';
INSERT INTO nav_items SET id=23, nav_id=6,uri='/articles/6', name='素食料理';
INSERT INTO nav_items SET id=24, nav_id=6,uri='/articles/6', name='百草园';

INSERT INTO nav_items SET id=25, nav_id=7,uri='/', name='精品课程';
INSERT INTO nav_items SET id=26, nav_id=7,uri='/', name='新闻与动态';
INSERT INTO nav_items SET id=27, nav_id=7,uri='/', name='着陆引言-直指方向';
INSERT INTO nav_items SET id=28, nav_id=7,uri='/', name='着陆结语-讲师的提醒（三分钟）';
INSERT INTO nav_items SET id=29, nav_id=7,uri='/', name='着陆-晚两秒';
INSERT INTO nav_items SET id=30, nav_id=7,uri='/', name='着陆-成人成己';
INSERT INTO nav_items SET id=31, nav_id=7,uri='/', name='着陆-大小先后';
INSERT INTO nav_items SET id=32, nav_id=7,uri='/', name='近期内陆课程';
INSERT INTO nav_items SET id=33, nav_id=7,uri='/', name='近期中岭山课程';

INSERT INTO articles SET id=1, title='酸辣海带豆干丝',content='酸味的主要来源是醋。醋由粮食等含糖原料，经过微生物发酵，慢慢酿造熟成。中国人从西周就开始酿醋，以谷物为原料，外国则多用葡萄等水果。但现代人急功近利，人工快速合成醋大行其道，以醋酸、色素等多种化学添加物一下就勾兑搞定。化学添加的味道虽美，但黄庭会有一点点的缩紧，这是自我保护的本能反应在告诉我们，此醋不养生！其实酸味的来源不止是醋，还有如柠檬蕃茄等天然蔬果，蕃茄略带甜味，还可省却加糖哦', nav_item_id=6,created_at=1432024787;

INSERT INTO articles SET id=2, title='姜麻油拌茄丝',content='酸味的主要来源是醋。醋由粮食等含糖原料，经过微生物发酵，慢慢酿造熟成。中国人从西周就开始酿醋，以谷物为原料，外国则多用葡萄等水果。但现代人急功近利，人工快速合成醋大行其道，以醋酸、色素等多种化学添加物一下就勾兑搞定。化学添加的味道虽美，但黄庭会有一点点的缩紧，这是自我保护的本能反应在告诉我们，此醋不养生！其实酸味的来源不止是醋，还有如柠檬蕃茄等天然蔬果，蕃茄略带甜味，还可省却加糖哦', nav_item_id=6,created_at=1432024787;

INSERT INTO articles SET id=3, title='盐水煮毛豆',content='酸味的主要来源是醋。醋由粮食等含糖原料，经过微生物发酵，慢慢酿造熟成。中国人从西周就开始酿醋，以谷物为原料，外国则多用葡萄等水果。但现代人急功近利，人工快速合成醋大行其道，以醋酸、色素等多种化学添加物一下就勾兑搞定。化学添加的味道虽美，但黄庭会有一点点的缩紧，这是自我保护的本能反应在告诉我们，此醋不养生！其实酸味的来源不止是醋，还有如柠檬蕃茄等天然蔬果，蕃茄略带甜味，还可省却加糖哦', nav_item_id=6,created_at=1432024787;

INSERT INTO articles SET id=4, title='自制蕃茄酱意大利面',content='酸味的主要来源是醋。醋由粮食等含糖原料，经过微生物发酵，慢慢酿造熟成。中国人从西周就开始酿醋，以谷物为原料，外国则多用葡萄等水果。但现代人急功近利，人工快速合成醋大行其道，以醋酸、色素等多种化学添加物一下就勾兑搞定。化学添加的味道虽美，但黄庭会有一点点的缩紧，这是自我保护的本能反应在告诉我们，此醋不养生！其实酸味的来源不止是醋，还有如柠檬蕃茄等天然蔬果，蕃茄略带甜味，还可省却加糖哦', nav_item_id=6,created_at=1432024787;
