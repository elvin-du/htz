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

INSERT INTO nav_items SET id=1, nav_id=1,uri='/about', name='创办人介绍';
INSERT INTO nav_items SET id=2, nav_id=1,uri='/', name='初衷与愿景';
INSERT INTO nav_items SET id=3, nav_id=1,uri='/', name='开山点滴故事';
INSERT INTO nav_items SET id=4, nav_id=1,uri='/', name='中岭山风光';

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

INSERT INTO nav_items SET id=16, nav_id=4,uri='/', name='参加方法';
INSERT INTO nav_items SET id=17, nav_id=4,uri='/', name='往期录音';

INSERT INTO nav_items SET id=18, nav_id=5,uri='/', name='最新电子报';
INSERT INTO nav_items SET id=19, nav_id=5,uri='/', name='各期电子报查询';
INSERT INTO nav_items SET id=20, nav_id=5,uri='/', name='订阅电子报';
INSERT INTO nav_items SET id=21, nav_id=5,uri='/', name='投稿邮箱';

INSERT INTO nav_items SET id=22, nav_id=6,uri='/articles/22', name='分享文章';
INSERT INTO nav_items SET id=23, nav_id=6,uri='/articles/23', name='素食料理';
INSERT INTO nav_items SET id=24, nav_id=6,uri='/articles/24', name='百草园';

INSERT INTO nav_items SET id=25, nav_id=7,uri='/', name='精品课程';
INSERT INTO nav_items SET id=26, nav_id=7,uri='/', name='新闻与动态';
INSERT INTO nav_items SET id=27, nav_id=7,uri='/', name='着陆引言-直指方向';
INSERT INTO nav_items SET id=28, nav_id=7,uri='/', name='着陆结语-讲师的提醒（三分钟）';
INSERT INTO nav_items SET id=29, nav_id=7,uri='/', name='着陆-晚两秒';
INSERT INTO nav_items SET id=30, nav_id=7,uri='/', name='着陆-成人成己';
INSERT INTO nav_items SET id=31, nav_id=7,uri='/', name='着陆-大小先后';
INSERT INTO nav_items SET id=32, nav_id=7,uri='/', name='近期内陆课程';
INSERT INTO nav_items SET id=33, nav_id=7,uri='/', name='近期中岭山课程';

INSERT INTO articles SET id=1, title='酸辣海带豆干丝',content_abstract='酸味的主要来源是醋。醋由粮食等含糖原料，经过微生物发酵，慢慢酿造熟成。中国人从西周就开始酿醋，以谷物为原料，外国则多用葡萄等水果。但现代人急功近利，人工快速合成醋大行其道', content='酸味的主要来源是醋。醋由粮食等含糖原料，经过微生物发酵，慢慢酿造熟成。中国人从西周就开始酿醋，以谷物为原料，外国则多用葡萄等水果。但现代人急功近利，人工快速合成醋大行其道，以醋酸、色素等多种化学添加物一下就勾兑搞定。化学添加的味道虽美，但黄庭会有一点点的缩紧，这是自我保护的本能反应在告诉我们，此醋不养生！其实酸味的来源不止是醋，还有如柠檬蕃茄等天然蔬果，蕃茄略带甜味，还可省却加糖哦',read_count=3, nav_item_id=23,created_at='2015-05-20 20:08:09';

INSERT INTO articles SET id=2, title='姜麻油拌茄丝',content_abstract='通常来讲，我们会觉得令自己感到舒适、愉悦的就是“好情绪”；令自己不适的就是“坏情绪”。但情绪真的有好坏之分吗，我们能说愤怒是不好的，悲伤是不好的，恐惧是不好的吗', content='通常来讲，我们会觉得令自己感到舒适、愉悦的就是“好情绪”；令自己不适的就是“坏情绪”。但情绪真的有好坏之分吗，我们能说愤怒是不好的，悲伤是不好的，恐惧是不好的吗？想象一下，当你在野外遭遇某种动物的攻击，正是你的愤怒给你带来反击的力量；当我们失去心爱的人与事物，正是那股悲伤让我们感受到内心深处的爱；当我们置身生命的黑夜，正是恐惧的洗礼让我们重获勇气……当我们接纳某一种情绪，它便可得到释放和流动，当我们排拒某一种情绪，它便会堆积、压抑从而变得具有破坏性。情绪无有好坏，关键是我们如何看待它，以及是用建设性的方式表达它，还是用破坏性的方式表达它。',read_count=2, nav_item_id=23,created_at='2015-05-20 20:08:09';

INSERT INTO articles SET id=3, title='盐水煮毛豆',content_abstract='在我们的教育中，流露情绪往往被认为是不好的。在古代，“喜怒不形于色”会被认为是有涵养的表现。而直到现在，人们也会认为：生气会伤害到别人，哭泣会麻烦到别人、会被人看不起等等',content='在我们的教育中，流露情绪往往被认为是不好的。在古代，“喜怒不形于色”会被认为是有涵养的表现。而直到现在，人们也会认为：生气会伤害到别人，哭泣会麻烦到别人、会被人看不起等等。发现了吗？这里面的关键词是“别人”。因此，这种信念其实是由于我们太注重他人的看法造成的。当我们在他人的目光中迷失了自己，可能就会只去表现出令他人觉得满意的情绪，而包裹住其他那些可能会“令人不悦”的情绪。其实，情绪是不可能真的完全被“埋藏”起来的，对方总会或多或少地感受到。与其维持表面的和平，真实地表达可能反而是更勇敢，也更容易解决问题的方式。', read_count=8,nav_item_id=23,created_at='2015-05-20 20:08:09';

INSERT INTO articles SET id=4, title='自制蕃茄酱意大利面',content_abstract='有人认为情绪是必须被控制的，有人则感觉情绪完全不由自主，能把人淹没。或许你我都经历过一个突如其来的情绪，然后长时间陷入其中无法自拔。但仔细想想，我们真的无法自拔',content='有人认为情绪是必须被控制的，有人则感觉情绪完全不由自主，能把人淹没。或许你我都经历过一个突如其来的情绪，然后长时间陷入其中无法自拔。但仔细想想，我们真的无法自拔了吗？其实身处再强烈的情绪中，我们还是有一线清明的意识存在的。而只要觉察到这一线意识的存在，我们就暂时与那强烈的情绪分开了一些。这并不是说，我们要从情绪中逃开，而是去学着有意识地“知道”我们身处什么样的情绪中。学会有意识地经验情绪，你会发现情绪原来并不是不可控制的怪物，在它背后，往往还埋藏着珍贵的秘密呢。',read_count=4, nav_item_id=23,created_at='2015-05-20 20:08:09';
