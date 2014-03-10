# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.12)
# Database: fbapp
# Generation Time: 2014-01-09 06:33:14 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table answers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `answers`;

CREATE TABLE `answers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `contents` text NOT NULL,
  `question_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_answer` (`question_id`),
  CONSTRAINT `fk_answer` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table apps
# ------------------------------------------------------------

DROP TABLE IF EXISTS `apps`;

CREATE TABLE `apps` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `fb_app_id` varchar(255) NOT NULL DEFAULT '',
  `fb_app_key` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `apps` WRITE;
/*!40000 ALTER TABLE `apps` DISABLE KEYS */;

INSERT INTO `apps` (`id`, `name`, `fb_app_id`, `fb_app_key`)
VALUES
	(6,'TestingAppDemo','374315049381597','dd2286e9c6aa6f72c0f66cc6ba6a0d39'),
	(7,'AppF­o­r­P­a­g­e­Demo','757943577550258','2d888dd820f2535fa36cad8002ae1a4a');

/*!40000 ALTER TABLE `apps` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table facebook_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `facebook_users`;

CREATE TABLE `facebook_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `facebook_id` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(45) DEFAULT '',
  `gender` varchar(10) DEFAULT NULL,
  `relationship` varchar(45) DEFAULT NULL,
  `age` varchar(5) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `hometown` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `finished` datetime DEFAULT NULL,
  `app_id` varchar(255) NOT NULL DEFAULT '',
  `question_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `facebook_users_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `facebook_users` WRITE;
/*!40000 ALTER TABLE `facebook_users` DISABLE KEYS */;

INSERT INTO `facebook_users` (`id`, `facebook_id`, `name`, `email`, `gender`, `relationship`, `age`, `birthday`, `hometown`, `location`, `created`, `finished`, `app_id`, `question_id`)
VALUES
	(1,'100000162725176','Bánh Bao','a12pct@gmail.com','male',NULL,'26','1988-05-20 00:00:00','Da Nang, Vietnam','Da Nang, Vietnam','2013-12-27 09:08:52',NULL,'374315049381597',21),
	(2,'100000162725176','Bánh Bao','a12pct@gmail.com','male',NULL,'25','0000-00-00 00:00:00','Da Nang, Vietnam','Da Nang, Vietnam','2013-12-27 09:17:10',NULL,'374315049381597',6),
	(3,'100005667732866','Nguyen Rin-Kute','testertcx@gmail.com','female',NULL,'26','0000-00-00 00:00:00','Hue, Vietnam','Da Nang, Vietnam','2013-12-27 10:50:55',NULL,'374315049381597',7),
	(4,'100000162725176','Bánh Bao','a12pct@gmail.com','male',NULL,'25','0000-00-00 00:00:00','Da Nang, Vietnam','Da Nang, Vietnam','2013-12-27 11:11:07',NULL,'374315049381597',7),
	(5,'100000162725176','Bánh Bao','a12pct@gmail.com','male',NULL,'26','0000-00-00 00:00:00','Da Nang, Vietnam','Da Nang, Vietnam','2014-01-06 02:35:57',NULL,'374315049381597',5),
	(6,'100000162725176','Bánh Bao','a12pct@gmail.com','male',NULL,'44',NULL,'Da Nang, Vietnam','Da Nang, Vietnam','2014-01-06 03:29:57',NULL,'757943577550258',8),
	(7,'100000162725176','Bánh Bao','a12pct@gmail.com','male',NULL,'26','0000-00-00 00:00:00','Da Nang, Vietnam','Da Nang, Vietnam','2014-01-06 06:41:35',NULL,'374315049381597',10),
	(8,'100000162725176','Bánh Bao','a12pct@gmail.com','male',NULL,'26','1988-05-20 00:00:00','Da Nang, Vietnam','Da Nang, Vietnam','2014-01-09 03:36:44',NULL,'374315049381597',21);

/*!40000 ALTER TABLE `facebook_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table profiles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `profiles`;

CREATE TABLE `profiles` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_profile_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;

INSERT INTO `profiles` (`user_id`, `lastname`, `firstname`)
VALUES
	(1,'Admin','Administrator'),
	(2,'Demo','Demo');

/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table profiles_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `profiles_fields`;

CREATE TABLE `profiles_fields` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `varname` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `field_type` varchar(50) NOT NULL,
  `field_size` varchar(15) NOT NULL DEFAULT '0',
  `field_size_min` varchar(15) NOT NULL DEFAULT '0',
  `required` int(1) NOT NULL DEFAULT '0',
  `match` varchar(255) NOT NULL DEFAULT '',
  `range` varchar(255) NOT NULL DEFAULT '',
  `error_message` varchar(255) NOT NULL DEFAULT '',
  `other_validator` varchar(5000) NOT NULL DEFAULT '',
  `default` varchar(255) NOT NULL DEFAULT '',
  `widget` varchar(255) NOT NULL DEFAULT '',
  `widgetparams` varchar(5000) NOT NULL DEFAULT '',
  `position` int(3) NOT NULL DEFAULT '0',
  `visible` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `varname` (`varname`,`widget`,`visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `profiles_fields` WRITE;
/*!40000 ALTER TABLE `profiles_fields` DISABLE KEYS */;

INSERT INTO `profiles_fields` (`id`, `varname`, `title`, `field_type`, `field_size`, `field_size_min`, `required`, `match`, `range`, `error_message`, `other_validator`, `default`, `widget`, `widgetparams`, `position`, `visible`)
VALUES
	(1,'lastname','Last Name','VARCHAR','50','3',1,'','','Incorrect Last Name (length between 3 and 50 characters).','','','','',1,3),
	(2,'firstname','First Name','VARCHAR','50','3',1,'','','Incorrect First Name (length between 3 and 50 characters).','','','','',0,3);

/*!40000 ALTER TABLE `profiles_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table questions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `app_type` tinyint(2) DEFAULT '0',
  `app_id` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `scenario` varchar(255) DEFAULT NULL,
  `contents` text NOT NULL,
  `anwser_result` text NOT NULL,
  `permissions` varchar(255) NOT NULL DEFAULT '',
  `fb_page_id` varchar(255) DEFAULT NULL,
  `fb_page_url` varchar(255) DEFAULT NULL,
  `fb_page_title` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT '0',
  `intro` text,
  `count_today` int(11) DEFAULT '0',
  `count_month` int(11) DEFAULT '0',
  `count_day` date DEFAULT NULL,
  `is_publish` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `app_id` (`app_id`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;

INSERT INTO `questions` (`id`, `app_type`, `app_id`, `title`, `description`, `image`, `scenario`, `contents`, `anwser_result`, `permissions`, `fb_page_id`, `fb_page_url`, `fb_page_title`, `count`, `intro`, `count_today`, `count_month`, `count_day`, `is_publish`)
VALUES
	(5,0,6,'あなたのことが好きで好きで仕方ない人の誕生日占い','あなたの事がすごく好きな人の誕生日を表示します。',NULL,'USER,RESULT1,RESULT2,RESULT3','[USER]のことが好きで好きで仕方ない人の誕生日\r\n\r\n   [RESULT1]\r\n   [RESULT2]\r\n   [RESULT3]','[@RESULT1@]\r\n直近3か月の\r\nの自分のFacebookのすべての投稿に一番いいねをしてくれた\r\n性の\r\n生日を表示\r\n[/@RESULT1@]\r\n\r\n[@RESULT2@]\r\n直近3か月の\r\nの自分のFacebookのすべての投稿に二番目にいいねをしてくれた\r\n性の\r\n生日を表示\r\n[/@RESULT2@]\r\n\r\n[@RESULT3@]\r\n直近3か月の\r\nの自分のFacebookのすべての投稿に三番目にいいねをしてくれた\r\n性の\r\n生日を表示\r\n[/@RESULT3@]','email,user_birthday,user_hometown,user_location,publish_actions,user_likes,user_relationships,friends_birthday','552597804756871','https://www.facebook.com/likeorhate.net','',15,'<h1 class=\"image\"><img src=\"/uploads/medium-d033960405984053acd3ef196814dc92-650.jpg\" alt=\"\" width=\"100%\" /></h1>',3,3,NULL,1),
	(6,0,6,'あなたのピュア度を表してみました！診断','実はあなた…ピュアなんですね。',NULL,'USER,RESULT1','[USER]のピュア度は[RESULT1]','[@RESULT1@]\r\n【 130％ 】　心が完璧に磨かれている。ホントにとても性格が良いし、他人の失敗を笑うなんて良心が許さない。清廉潔白な聖人ですね。\r\n【 0.00000000000002％ 】　心が汚れ切っている。めっちゃいやらしいし、仲間を裏切ることなら日常茶飯事。腹黒いヤツですね。\r\n【 100％ 】　心に一点の曇りもない。めちゃめちゃ献身的だし、仲間を裏切るなんて絶対にできない。根っからの善人ですね。\r\n【 99.99999999999992％ 】　心は驚きの白さ。めっちゃ性格が良いし、他人の不幸を喜ぶなんてできない。善意の塊みたいな人ですね。\r\n【 90.6％ 】　心がキレイに磨かれている。とても親切だし、公共の場で騒ぐことなど絶対ない。健全な心の持ち主ですね。\r\n【 －500％ 】　心が完全に壊れている。マジで呆れるほど態度が悪いし、人を差別することは無意識のうちにやってる。もはや手遅れですね。\r\n【 99.6％ 】　心がキレイに磨かれている。とても親切だし、ウソをつくことなど絶対ない。健全な心の持ち主ですね。\r\n【 100％ 】　心に一点の曇りもない。めちゃめちゃさわやかだし、他人を挑発するなんて絶対にできない。根っからの善人ですね。\r\n【 －95600％ 】　心は絶望と暗黒の中。マジで徹底して傲慢だし、悪意を持ってルールを無視するようなことを仕掛けてくる。恐ろしい悪魔ですね。\r\n【 100％ 】　心に一点の曇りもない。めちゃめちゃ友達思いだし、悪事を企むなんて絶対にできない。根っからの善人ですね。\r\n【 7660％ 】　心が澄み切っている。マジで驚くほど友達思いだし、自己保身に走るなんて考えたこともない。純真無垢な天使ちゃんですね。\r\n【 －100％ 】　もう心が壊れている。呆れるほどいやらしいし、仲間を裏切ることも自分さえ良ければそれでいい。まさに人間のクズですね。\r\n【 0％ 】　心が汚れでドロドロ。めちゃめちゃ傲慢だし、公共の場で騒ぐのは仕様です。マジで腹黒いヤツですね。\r\n【 80.8％ 】　心が清らか。かなり親切だし、他人の不幸を喜ぶのは大嫌い。クリーンで清潔な人ですね。\r\n 0.000000000000000000009％ 】　心が汚れ切っている。めっちゃ節操がないし、他人を挑発することなら日常茶飯事。腹黒いヤツですね。\r\n【 91.5％ 】　心がキレイに磨かれている。とても思いやりがあるし、八つ当たりすることなど絶対ない。健全な心の持ち主ですね。\r\n【 1550％ 】　心が澄み切っている。マジで驚くほどまじめだし、公共の場で騒ぐなんて考えたこともない。純真無垢な天使ちゃんですね。\r\n[/@RESULT1@]','email,user_birthday,user_location,publish_actions,user_likes','552597804756871','https://www.facebook.com/likeorhate.net',NULL,1,NULL,NULL,NULL,NULL,1),
	(7,0,6,'《2014年》あなたの目標占い！','あなたの2014年の目標を勝手に占います。','1424446_758392344176635_547069300_n.jpg','RESULT1,USER','2014年の目標！\r\n\r\n[RESULT1]\r\n\r\n　　[USER]','[@RESULT1@]\r\n【来世まで力を温存する！】\r\n【少し頑張る！】\r\n【無駄な努力はしない！】\r\n【精一杯、怠ける！】\r\n【大胆に攻める！】\r\n【本能のままに生きる！】\r\n【100人切りをやり遂げる！】\r\n【あまり調子に乗らない！】\r\n【衣服なんて軟弱ものは着ない！】\r\n【汚名を返上する！】\r\n【脱！ぼっち！】\r\n【真面目にふざける！】\r\n【スタイリッシュに生きる！】\r\n【高望みしない！】\r\n【何をされても、怒らない！】\r\n【我が道を突き進む！】\r\n【そろそろ自立する！】\r\n【あいつの唇を奪う！】\r\n【少し落ち着く！】\r\n【空気を読む！】\r\n【言い訳をしない！】\r\n【2015年に本気出す！】\r\n【もっと己を晒け出す！】\r\n【世界の頂点に立つ！】\r\n【主に守備力を強化する！】\r\n【主に攻撃力を強化する！】\r\n【主にMPを温存する！】\r\n【常に回復に徹する！】\r\n【友達の度肝を抜く！】\r\n【そろそろ成仏する！】\r\n【その前に【目標】←この漢字の読み方を調べる！】\r\n【拾い食いをやめる！】\r\n【脱！中二病！】\r\n【チョットだけ素直になってみる！】\r\n【もう泣かない！】\r\n【このまま快進撃を続ける！】\r\n【知らない人について行かない！】\r\n【現　状　維　持！】\r\n【欲しい物は全て手に入れる！】\r\n【最後まで諦めない！】\r\n【そろそろ現実と向き合う！】\r\n【極力頑張らない！】\r\n【少し頑張る！】\r\n【あいつらを見返す！】\r\n【本能のままに生きる！】\r\n【ヤリまくる！】\r\n【身を固める！】\r\n【脱！下ネタ！】\r\n【チョット性欲を抑える！】\r\n[/@RESULT1@]','email,user_birthday,user_location,publish_actions,user_likes,user_relationships','580376788688663','https://www.facebook.com/pages/%E3%81%8B%E3%82%8F%E3%81%84%E3%81%84%E3%81%B2%E3%81%A8%E7%BE%8E%E4%BA%BA%E5%A4%A7%E5%A5%BD%E3%81%8D/580376788688663',NULL,21,NULL,NULL,NULL,NULL,1),
	(8,1,7,'test image','<img src=\"http://www.freefever.com/stock/2013-background-one-piece-wallpaper.jpg\" >\r\n',NULL,'[User]','[USER] play\r\n[title]','<img src=\"http://sites.psu.edu/aray17/files/2013/11/One-Piece-Wallpaper.jpg\" />\r\n','','401261999931002','https://www.facebook.com/kawaiibi.socoless','',9,'<p>&lt;img src=\"http://www.freefever.com/stock/2013-background-one-piece-wallpaper.jpg\" &gt;</p>',3,3,NULL,1),
	(10,0,6,'あなたを飲み物に例えると？診断','あなたの性格を飲み物に例えます。相性の良い飲み物もわかります！',NULL,'USER,RESULT1,RESULT2','[USER]を飲み物に例えると[RESULT1][RESULT2]の人と相性が良い。','[@RESULT1@]\r\n「ウォッカ」です。気が強く凛々しい人。いつも勝気に振舞っているが、実はこっそり泣いている。気難しい面も。\r\n「栄養ドリンク」です。いつも元気で行動力溢れる人。個性的でユニークだが、そのせいで人に避けられることも。\r\n「サイダー」です。生真面目な頑張り屋さん。バランスをとるのが上手。でもどこか地味で影が薄く、むっつりスケベ。\r\n「コーヒー」です。冷静沈着。時に厳しいが、好きな人の前では甘えん坊になる。ツンデレ。\r\n「レモネード」です。マイペースで少し天然。人とズレている事が多く、個性的だがある意味ちょっとアホ。でも気にしない。\r\n「カルピス」です。真面目な顔して不真面目。自己管理が苦手。実は凄く寂しがりやでベタベタするのが好き。\r\n「ビール」です。一見普通の人だが、実は変わってる。色んな考えを受け入れられる、柔らかい人でもある。\r\n「泥水」です。汚れ役。心が黒い。自分がすべてで他人はどうでもいい。お金が大好き。人がゴミのようだ。\r\n「ミルク」です。優しく純粋。人の笑顔で幸せになる暖かい人。でも実はちょっとエロい。\r\n「白ワイン」です。繊細で感受性豊か。自分の好きな事はとことん追求する。ちょっと自惚れやすい面もある。\r\n「野菜ジュース」です。健全で純粋。悪いことが大嫌いな正義感のある人。一方で心が狭く、他人を受け入れられなかったり。\r\n「コーラ」です。元気でお調子者。人には好かれやすいが、少し腹黒い一面も。ユーモラスな人。\r\n「日本酒」です。シャイ。控えめな性格だが器が広く、深みもある人。礼儀正しく基本的に真面目。\r\n「メロンソーダ」です。子どもの心を忘れない人。嫌なことはしない。わがまま。でも好きな人には何でもしたくなる。\r\n「緑茶」です。渋くて大人。ちょっと凝り性でオタク的なところがある。自分の意見を持っていて他人に振り回されない。\r\n「むぎ茶」です。活発でサバサバしている。細かいことは気にしない。ある意味適当。楽しいことが好き。\r\n「紅茶」です。ロマンチストで控えめ。色んな事を空想するが行動には起こせない。人見知りで自分の時間を大切にする。\r\n「水」です。嘘が嫌いな正直な人。ブレずにしっかりしている。ただちょっと印象が薄く、空気と化すことも。\r\n「オレンジジュース」です。爽やかな性格。滅多に怒らないが、怒ると怖い。色んな人に好かれる人気者。\r\n「カフェオレ」です。気分屋。気持ちがころころ入れ替わる。素直になれずに損をすることもしばしば。\r\n「赤ワイン」です。情熱的で積極的。新しいことが大好きだが、一方で飽き性でもある。甘やかされるとすぐふにゃふにゃになったり。\r\n[/@RESULT1@]\r\n[@RESULT2@]\r\n「ウォッカ」\r\n「栄養ドリンク」\r\n「サイダー」\r\n「コーヒー」\r\n「レモネード」\r\n「カルピス」\r\n「ビール」\r\n「泥水」\r\n「ミルク」\r\n「白ワイン」\r\n「野菜ジュース」\r\n「コーラ」\r\n「日本酒」\r\n「メロンソーダ」\r\n「緑茶」\r\n「むぎ茶」\r\n「紅茶」\r\n「水」\r\n「オレンジジュース」\r\n「カフェオレ」\r\n「赤ワイン」\r\n[/@RESULT2@]','email,user_birthday,user_hometown,user_location,publish_actions,user_likes,user_relationships,friends_birthday','401261999931002','https://www.facebook.com/kawaiibi.socoless','tét',7,NULL,NULL,NULL,NULL,1),
	(11,0,6,'1','',NULL,'','','1','','','','',0,'<p>test</p>',NULL,NULL,NULL,0),
	(12,0,6,'2','',NULL,'','','2','','','','',0,NULL,NULL,NULL,NULL,1),
	(13,0,6,'3','',NULL,'','','3','','','','',0,NULL,NULL,NULL,NULL,1),
	(14,0,6,'4','',NULL,'','','4','','','','4',0,NULL,NULL,NULL,NULL,1),
	(15,0,6,'5','',NULL,'','','5','','','','',0,NULL,NULL,NULL,NULL,1),
	(16,0,6,'6','',NULL,'','','6','','','','',0,NULL,NULL,NULL,NULL,1),
	(17,0,6,'7','',NULL,'','','7','','','','',0,NULL,NULL,NULL,NULL,1),
	(18,0,6,'8','',NULL,'','','8','','','','',0,NULL,NULL,NULL,NULL,1),
	(19,0,6,'9','',NULL,'','','9','','','','',0,NULL,NULL,NULL,NULL,1),
	(20,0,6,'10','',NULL,'','','10','','','','',0,NULL,NULL,NULL,NULL,1),
	(21,1,6,'demo 1','568831523181480',NULL,'','','568831523181480','email,user_birthday,user_hometown,user_location,publish_actions,user_likes,user_relationships,friends_birthday','568831523181480','https://www.facebook.com/NguoiGiauMatVN','NGM',4,'<p>568831523181480</p>',4,4,NULL,1);

/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `activkey` varchar(128) NOT NULL DEFAULT '',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastvisit_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `superuser` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`),
  KEY `superuser` (`superuser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `username`, `password`, `email`, `activkey`, `create_at`, `lastvisit_at`, `superuser`, `status`)
VALUES
	(1,'admin','21232f297a57a5a743894a0e4a801fc3','webmaster@example.com','9a24eff8c15a6a141ece27eb6947da0f','2013-12-24 12:53:09','2013-12-24 06:07:17',1,1),
	(2,'demo','fe01ce2a7fbac8fafaed7c982a04e229','demo@example.com','099f825543f7850cc038b90aaff39fac','2013-12-24 12:53:09','0000-00-00 00:00:00',0,1);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
