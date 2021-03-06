/*
 Navicat MySQL Data Transfer

 Source Server         : 本机数据库
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 21/12/2021 17:44:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_cart
-- ----------------------------
DROP TABLE IF EXISTS `tb_cart`;
CREATE TABLE `tb_cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cart_userId_foreign_key`(`userId`) USING BTREE,
  INDEX `cart_productId_foreign_key`(`productId`) USING BTREE,
  CONSTRAINT `cart_productId_foreign_key` FOREIGN KEY (`productId`) REFERENCES `tb_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_userId_foreign_key` FOREIGN KEY (`userId`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_cart
-- ----------------------------
INSERT INTO `tb_cart` VALUES (21, 2, 233, '2021-12-18 01:07:37', NULL);
INSERT INTO `tb_cart` VALUES (24, 1, 15, '2021-12-20 16:31:28', NULL);
INSERT INTO `tb_cart` VALUES (31, 10, 233, '2021-12-20 22:18:04', NULL);
INSERT INTO `tb_cart` VALUES (33, 10, 13, '2021-12-20 22:18:08', NULL);
INSERT INTO `tb_cart` VALUES (34, 10, 210, '2021-12-20 22:18:44', NULL);
INSERT INTO `tb_cart` VALUES (35, 10, 171, '2021-12-20 22:18:47', NULL);
INSERT INTO `tb_cart` VALUES (36, 10, 172, '2021-12-20 22:18:48', NULL);
INSERT INTO `tb_cart` VALUES (37, 10, 174, '2021-12-20 22:18:49', NULL);
INSERT INTO `tb_cart` VALUES (38, 10, 174, '2021-12-20 22:18:52', NULL);
INSERT INTO `tb_cart` VALUES (39, 10, 15, '2021-12-20 22:21:43', NULL);

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_productId_foreign_key`(`productId`) USING BTREE,
  INDEX `order_userId_foreign_key`(`userId`) USING BTREE,
  CONSTRAINT `order_productId_foreign_key` FOREIGN KEY (`productId`) REFERENCES `tb_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_userId_foreign_key` FOREIGN KEY (`userId`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES (2, 1, 144, '2021-12-10 16:54:13', '广州市');
INSERT INTO `tb_order` VALUES (3, 1, 20, '2021-12-10 16:54:26', '广州市');
INSERT INTO `tb_order` VALUES (4, 2, 20, '2021-12-13 22:47:52', '北京市');
INSERT INTO `tb_order` VALUES (6, 1, 14, '2021-12-17 21:36:27', '广州市');
INSERT INTO `tb_order` VALUES (13, 1, 258, '2021-12-17 22:40:21', '广州市');
INSERT INTO `tb_order` VALUES (14, 1, 265, '2021-12-17 23:33:28', '广州市');
INSERT INTO `tb_order` VALUES (15, 1, 210, '2021-12-17 23:48:19', '哈哈哈');
INSERT INTO `tb_order` VALUES (16, 2, 231, '2021-12-18 01:07:48', '北京市');
INSERT INTO `tb_order` VALUES (17, 2, 229, '2021-12-18 01:07:56', '北京市hhh');
INSERT INTO `tb_order` VALUES (18, 1, 171, '2021-12-20 16:38:10', '广州市');
INSERT INTO `tb_order` VALUES (19, 1, 263, '2021-12-20 21:19:29', '广州市');
INSERT INTO `tb_order` VALUES (20, 1, 170, '2021-12-20 21:21:40', '广州市');
INSERT INTO `tb_order` VALUES (21, 10, 209, '2021-12-20 22:18:27', '四川省成都市');
INSERT INTO `tb_order` VALUES (22, 10, 10, '2021-12-20 22:18:30', '四川省成都市');
INSERT INTO `tb_order` VALUES (23, 10, 231, '2021-12-20 22:18:33', '四川省成都市');
INSERT INTO `tb_order` VALUES (24, 10, 212, '2021-12-20 22:18:35', '四川省成都市');
INSERT INTO `tb_order` VALUES (25, 10, 210, '2021-12-20 22:18:39', '四川省成都市');
INSERT INTO `tb_order` VALUES (26, 1, 262, '2021-12-21 17:26:06', '广州');

-- ----------------------------
-- Table structure for tb_product
-- ----------------------------
DROP TABLE IF EXISTS `tb_product`;
CREATE TABLE `tb_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double(10, 2) NULL DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 287 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_product
-- ----------------------------
INSERT INTO `tb_product` VALUES (10, '见笑集', 88.00, '文学类，\r\n这是一部殿堂级的诗集。作者为九八老人黄永玉，保持了一生的干净和有趣。本书为其诗歌全编，收录其1947-2021年间创作的150余首诗作，时间跨度70余年，其中……', 1);
INSERT INTO `tb_product` VALUES (11, '我身体里的人造星星', 58.00, '文学类，\r\n【编辑推荐】 ★我们的身体当然是神圣的，但它们往往不只属于我们 人可以患病，但不能成为疾病：一个超越病痛抵达艺术永恒的生命故事，一场重新定义自我、救赎自我的疗……', 1);
INSERT INTO `tb_product` VALUES (12, '小说现代中国', 68.00, '文学类，\r\n许知远、史航、张立宪推荐 知名文史学者×中学名校语文教师 从40篇小说读懂现代中国 ☆ 编辑推荐 ☾ 重读现代经典小说，穿越民国三十年，在小说里读懂中国 小说……', 1);
INSERT INTO `tb_product` VALUES (13, '部分诗学与普通读者', 69.00, '文学类，\r\n《部分诗学与普通读者》收入学者许志强近年所写的23篇外国文学评论。就像为旧相框拭去灰尘，在许志强笔下，卡佛、库切、奥威尔、布罗茨基、托卡尔丘克等已为我们所熟知……', 1);
INSERT INTO `tb_product` VALUES (14, '不要温顺地走进那个良宵', 68.00, '文学类，\r\n“不要温顺地走进那个良宵， 老年在日暮之时应当燃烧与咆哮； 怒斥，怒斥光明的消亡。” ★颠覆传统的英诗奇才，用词和韵制造癫狂和迷醉 ★诺兰电影《星际穿越》中反……', 1);
INSERT INTO `tb_product` VALUES (15, '说不尽的废名', 65.00, '文学类，\r\n陈子善、陈国恩、吴晓东教授联袂推荐 纪念诗人、作家、学者废名诞辰120周年 集著名学者、废名研究专家陈建军 数十年废名研究之大成 --------------……', 0);
INSERT INTO `tb_product` VALUES (16, '八旗心象', 89.00, '文学类，\r\n本书以晚清民国的旗人及其文学为研究对象，将其置入政治、经济、社会、军事乃至国际关系的关联性语境中，展开跨文学、历史与区域研究的对话；体察旗人在时代语境中经历的……', 1);
INSERT INTO `tb_product` VALUES (17, '一切境', 66.00, '文学类，\r\n庆山（安妮宝贝）2021年全新散文集。《一切境》留下了庆山近几年生命活动的痕迹与标记。伴随作者数年的日常观察、旅行、阅读和思考，作三言两语的灵光一现的直觉式表……', 0);
INSERT INTO `tb_product` VALUES (18, '明亮的时刻', 65.00, '文学类，\r\n本辑《单读》继续关注当代青年创作者，与山一国际女性电影展合作，发表5位当代青年女导演的电影剧本和创作谈。这是单读首次用电影剧本的形式，呈现变化中的当代生活——……', 1);
INSERT INTO `tb_product` VALUES (19, '真看', 88.00, '文学类，\r\n自詹姆斯•伍德出版第一本批评文集《破格》（1999）开始，他就被认为是英语文学批评界的领军者。他既评判那些殿堂级经典作家（福楼拜、陀思妥耶夫斯基），臧否晚近的……', 1);
INSERT INTO `tb_product` VALUES (20, '岛上花园', 69.00, '文学类，\r\n《岛上花园》是自然文学经典之作，是“岛屿诗人”西莉亚·莱顿·撒克斯特生前出版的最后一部作品。她耐心地讲述自己从春天到秋天如何种植花草、打理花园，如何将珍贵的花……', 0);
INSERT INTO `tb_product` VALUES (21, '“灵光”的消逝', 65.00, '文学类，\r\n本书是学者梁鸿关于中国当代文学的论文集。本雅明在论及传统艺术的价值时，使用了一个理论术语——“灵光”（aura），梁鸿敏感地把握到“灵光”在中国当代文学语境中……', 1);
INSERT INTO `tb_product` VALUES (22, 'DK传记：伟大的作家', 238.00, '文学类，\r\n★囊括100余位具有世界影响力的作家，平均5分钟读懂一位大师。用最精练的语言为大师建档立案，读者只需5分钟就能掌握一位大师的核心线索。 ★既是作家百科，又是一……', 1);
INSERT INTO `tb_product` VALUES (23, '身体·宇宙', 48.00, '文学类，\r\n在这本引人入胜的小书中，米歇尔•高罗探讨了法国现当代诗歌中的身体主题。他将身体视为一种重要的文化特征，这种特征引起了思想家和作家的多元反应。 ——《法国研究》……', 1);
INSERT INTO `tb_product` VALUES (24, '寻踪索姆河', 59.00, '文学类，\r\n⭐村上春树推崇备至，毛姆文学奖、E.M.福斯特奖得主 ⭐英国国民作家杰夫·戴尔 独一无二的战争书写 ⭐一部经典的大战沉思录 战争若不是由墓园、战壕、迷雾、仪式……', 1);
INSERT INTO `tb_product` VALUES (25, '入眠之力', 69.00, '文学类，\r\n编辑推荐 ※ 睡眠而非梦境与文学创作有何关系？睡眠这一最私密的行为，如何成了公众表达的元素？ ※ 一本精美的睡前读物，一份文学爱好者的礼物，从睡眠角度重新进入……', 1);
INSERT INTO `tb_product` VALUES (26, '波德莱尔传', 198.00, '文学类，\r\n还原现代派大师夏尔·波德莱尔反叛、落魄、动荡的一生 通过大量书信和一手资料追寻伟大诗人传奇生活的真相 梳理现代主义、象征主义诗歌发展脉络 为时代造像，再现西方……', 1);
INSERT INTO `tb_product` VALUES (27, '吠月', 55.00, '文学类，\r\n日本近代诗之父萩原朔太郎 一生杰作精编结集 简体中文版首次出版 ———— 【编辑推荐】 ※萩原朔太郎，被誉为“日本近代诗之父”。在大正时代，他以前所未有的口语……', 1);
INSERT INTO `tb_product` VALUES (28, '思想与文学', 98.00, '文学类，\r\n本书从中国文学史上的若干重要问题出发，以专题研究的形式，力图从中国传统思想文化的大背景上探索和挖掘文学发展的真正动因和创作主旨，希望能从多种角度和更高层面，揭……', 0);
INSERT INTO `tb_product` VALUES (29, '文学社会学批评', 52.00, '文学类，\r\n◎内容简介 本书曾作为巴黎高等社会科学研究院的教材使用，它由浅入深地阐明了文学社会学批评的基本概念，它的各种方法和模式，词汇和句法的社会功能，以及从精神分析批……', 1);
INSERT INTO `tb_product` VALUES (30, '孤儿的新年礼物', 46.00, '文学类，\r\n◎内容简介 《孤儿的新年礼物》是兰波创作的第一首诗，当时他不到15岁。之后的五年里他创作了大量传世佳作，却在19岁宣布封笔。兰波谜一般的人生只有短短37个春秋……', 1);
INSERT INTO `tb_product` VALUES (31, '故事法则', 69.00, '文学类，\r\n民间故事是一种结构稳定的功能组合、一个自组织系统，一棵生命树。故事一旦开始其生命进程，就会自己生长、自己嫁接、自己开花、自己结果，也会随时空的改变而变异，随生……', 1);
INSERT INTO `tb_product` VALUES (32, '再见那闪耀的群星', 88.00, '文学类，\r\n本书不是一部研究专著，而是一部诗歌随笔，是作者在唐诗中的一次游历。在谈及这二十位诗人时，尽量展示其最重要的作品，但并不做全面评价，而是对每位诗人采取不同的阐释……', 1);
INSERT INTO `tb_product` VALUES (136, '皮拉内西', 58.00, '小说类，“这座大宅壮美无限，仁慈无边。……皮拉内西住在大宅里。也许他一直都在那里。他日复一日地在笔记本上详细记录大宅里的奇迹：无数大厅组成的迷宫，形态各异的雕……', 1);
INSERT INTO `tb_product` VALUES (137, '死梦者之歌与阴郁的抄写员', 60.00, '小说类，恐怖小说大师托马斯里戈蒂成名作爱伦坡、洛夫克拉夫特之后，惊人黑暗想象力之重现编辑推荐托马斯里戈蒂，布拉姆斯托克终身成就奖、奇幻奖、国际恐……', 1);
INSERT INTO `tb_product` VALUES (138, '82年生的金智英(2021读者互动版）', 48.00, '小说类，2019年出版的《82年生的金智英》曾在书中留下一个邮寄地址，两年来，编辑部收到500多封来自全国各地的读者来信，有电子邮件，也有手写信。读者涵盖各个年龄段、……', 1);
INSERT INTO `tb_product` VALUES (139, '被弃养的女孩', 56.00, '小说类，“名奖作品互文系列，全新装帧，优质译文意大利文坛黑马，好评不断，圈粉无数，仅在10个月内就售出近20万册，翻译版权售出多国一举斩获意大利久负盛名……', 1);
INSERT INTO `tb_product` VALUES (140, '最后来的是乌鸦', 59.00, '小说类，海边开心玩耍的英雄裹着香喷喷皮衣的乞丐牵骡子穿越炮火的失聪者路遇黑纱寡妇的回乡步兵动荡世界里，卡尔维诺站在那最柔软明亮的地方……', 1);
INSERT INTO `tb_product` VALUES (141, '山魈考残编', 60.00, '小说类，-你从未阅读想象中的事物，你的阅读本身即是想象-当代实力派隐流作家首部长篇力作问世一个神秘的部族、一部散轶的典籍牵引出一段追源溯真的曲折故事探文字、……', 1);
INSERT INTO `tb_product` VALUES (142, '夜莺', 68.00, '小说类，要经历多少次崩溃，才能成为真正的自己克莉丝汀汉娜享誉世界之作，霸占《纽约时报》畅销榜超52周与石黑一雄《被掩埋的巨人》一同提名国际都柏林文学奖……', 1);
INSERT INTO `tb_product` VALUES (143, '米拉的猜想', 56.00, '小说类，人是社会的动物，那么社会又是什么呢？资本、劳动、性别、媒体如何塑造我们？社会学版《苏菲的世界》，看小说读懂社会学30位社会学巨擘，80个社会学大观念透射……', 1);
INSERT INTO `tb_product` VALUES (144, '啊朋友再见', 49.00, '小说类，“大时代烟花结束，罗曼史只不过是娱乐，各有新去路。《啊朋友再见》是作家宋阿曼的最新小说集，收录近三年来创作的五部中短篇小说。小说集延续了宋阿曼鲜明的美学……', 1);
INSERT INTO `tb_product` VALUES (145, '白兔', 59.00, '小说类，一部致敬《悲惨世界》的高能娱乐小说，四小时“沉浸式舞台剧一般的阅读体验儿子杀了人，持枪男子闯入家中，还冒出一个厚脸皮的小偷？！是的，我经历了许多。究……', 1);
INSERT INTO `tb_product` VALUES (146, '世界开始的地方', 49.00, '小说类，“或许有人天生孤独，就好像一些人天生失明或失聪《冷血》《蒂凡尼的早餐》作者杜鲁门卡波特少年锋芒之作十四个短篇故事犹如万花筒，折射出离群索居之人的隐秘……', 1);
INSERT INTO `tb_product` VALUES (147, '潮汐图', 58.00, '小说类，这真是一部让人期待已久的南方叙事，一座早该由广东人吐露成型的海市蜃楼。我需要再三重读，好看清林棹如何放荡她那肆无忌惮的想象力，从珠江江底泥层疍艇的尸身，打捞出……', 0);
INSERT INTO `tb_product` VALUES (148, '被毁损和被染病的', 38.00, '小说类，恐怖小说大师托马斯里戈蒂再一次超越定义追步爱伦坡、洛夫克拉夫特、斯蒂芬金改变类型小说写作的短篇集编辑推荐托马斯里戈蒂，布拉姆斯托克终身……', 1);
INSERT INTO `tb_product` VALUES (149, '族长的秋天', 59.00, '小说类，诺贝尔文学奖得主、《百年孤独》作者加西亚马尔克斯的文学大冒险！全新内外双封设计，书口定制喷绘，心动典藏！比《百年孤独》更孤独，比《霍乱时期的爱情》……', 1);
INSERT INTO `tb_product` VALUES (150, '爱伦·坡暗黑故事集', 58.00, '小说类，文学鬼才的暗黑系杰作，篇篇动魄，字字惊心八场光怪陆离的暗夜残梦，一段欲罢不能的致幻之旅2000年西班牙国家插画奖获奖作品爱伦坡研究专家……', 1);
INSERT INTO `tb_product` VALUES (151, '第一人称单数', 56.00, '小说类，睽违六年！村上春树2021全新短篇小说集《第一人称单数》。11.18全网现货发售！当世界不断变迁，唯有故事留住刹那光景。8篇第一人称叙事小说，重现村上式奇……', 0);
INSERT INTO `tb_product` VALUES (152, '蚁群', 42.00, '小说类，2137年，501城。在女性主导的高度智能化社会，人类被无数设备监控和服务着，“社会管理系统通过打分来评判人的价值。一个宣称要解放男性的组织SFH却反对这种……', 1);
INSERT INTO `tb_product` VALUES (153, '很久很久以前，在某一个地方……', 45.00, '小说类，一寸法师的不在场证据：一寸法师打败恶鬼保护了公主。他靠打出小锤变大，心里却藏着一个计划……花开死者的留言：老爷爷撒灰让樱花盛开。好心的他把城主的奖赏捐给了村……', 1);
INSERT INTO `tb_product` VALUES (154, '今夜通宵杀敌', 58.00, '小说类，《驻马店伤心故事集》之后，驻马店青年郑在欢强势回归！驻马店的故事仍在继续《驻马店伤心故事集》之后，时隔四年，上海文艺再度推出郑在欢短篇小说集《今夜通宵杀敌……', 1);
INSERT INTO `tb_product` VALUES (155, '不对称', 65.00, '小说类，1988年，一个大学刚毕业的男孩站在祖母家的屋顶上抽着烟，望着远处的底格里斯河，对身旁第一次回老家的十二岁弟弟讲起了自己的十二岁，讲起七十年代里那些酷热的夏夜……', 1);
INSERT INTO `tb_product` VALUES (156, '逆光之夏', 82.00, '小说类，每个人都渴望回到那个夏天，回到那带着恐惧和希望的少年时代。*致敬卡尔维诺《树上的男爵》*乔尔达诺版《我的天才女友》《请以你的名字呼唤我》*“一部……', 1);
INSERT INTO `tb_product` VALUES (157, '华丽人生', 49.00, '小说类，一本值得读很多次的书，一本有些费神的书一次仿佛行走于莫比乌斯环的阅读体验改编电影由堺雅人扮演黑泽-是一团乱麻，但请抓住藏于乱序叙事中的线索啊！内含2……', 1);
INSERT INTO `tb_product` VALUES (158, '病鹤', 56.00, '小说类，【编辑推荐】“大正浪漫女性书写系列，名作精选，译笔细腻，装帧雅致，珍藏佳品冈本加乃子，才情惊艳的日本女诗人、小说家，大正文坛耀目而永恒的流星川……', 1);
INSERT INTO `tb_product` VALUES (159, '俄罗斯套娃', 52.00, '小说类，【编辑推荐】十二个好故事，十二次对生活的沉潜，直指生命的孤独本质《俄罗斯套娃》是一本短篇小说集，却以一种巧妙的时间顺序将整本书连缀起来，构成了一年首尾相……', 1);
INSERT INTO `tb_product` VALUES (160, '木乃伊的口红', 58.00, '小说类，【编辑推荐】大正浪漫女性书写系列，装帧纤巧精美，内文使用优良纯质纸，阅读舒适，便于携带。日本大正时代惊才绝艳的女作家，日本著名作家幸田露伴的入室弟子……', 1);
INSERT INTO `tb_product` VALUES (161, '我们自夜暗的酒馆离开', 45.00, '小说类，为华丽而荒芜的世纪末认真悲伤华语文学领军人物骆以军短篇代表作《红字团》+《降生十二星座》合集编辑推荐《我们自夜暗的酒馆离开》是台湾“小说一哥骆以……', 1);
INSERT INTO `tb_product` VALUES (162, '无星之海', 88.00, '小说类，现象级全球畅销书《夜晚马戏团》作者新作，用唯美的文字书写浪漫的传奇，铺陈诡谲的情节，描摹梦幻的世界《时代周刊》2019年必读书，美国亚马逊2019年醉……', 1);
INSERT INTO `tb_product` VALUES (163, '大地双心', 48.00, '小说类，1911年，辛亥革命爆发，翌年清帝逊位。1917年，一位守墓少年受托来到皇帝身边，以秘法护其十年。此时皇室犹在，紫禁城内仍有大戏开场伶人亮嗓，似是一派太平景象……', 1);
INSERT INTO `tb_product` VALUES (164, '英伦魔法师', 128.00, '小说类，“两位魔法师，现身英格兰。前者畏惧我出现，后者久把我期盼。……公元一八六年，英格兰在抗击拿破仑的持久战中八面受敌，实践派魔法师早在几百年前就已销声匿……', 1);
INSERT INTO `tb_product` VALUES (165, '奥德萨', 59.00, '小说类，《奥德萨》是西班牙当代自传体小说的代表作之一，这部作品详实地记载了数十年以来西班牙国家、社会和家庭流变的历史。故事出自一名年逾半百的作家之口，他同时也是作者曼……', 1);
INSERT INTO `tb_product` VALUES (166, '吹口哨的女人', 88.00, '小说类，“女人吹哨，母鸡打鸣，亵渎上帝，祸害男人。英国谚语本书灵感来源20世纪经典文学，“拜厄特女性成长四部曲收官之作，中文版初次面世。诺……', 0);
INSERT INTO `tb_product` VALUES (167, '待宰的羔羊', 45.00, '小说类，这是一本关于“欺骗的短篇故事集，是英国传奇作家罗尔德达尔为成人而写的童话。在这里，你会读到：被警察吞下的凶器，开孤儿院的赌徒，偷伞换钱的酒鬼，专门帮人复……', 1);
INSERT INTO `tb_product` VALUES (168, '浴紫而生', 74.00, '小说类，《浴紫而生》一共收录了九篇K.J.帕克的故事，它们之间相互独立，同时又共享一个世界设定，如果仔细看，就能发现千丝万缕的联系。这是作家才能提供的阅读体验：一边享……', 1);
INSERT INTO `tb_product` VALUES (169, '人子', 59.00, '小说类，老者马卡里奥的回忆，牵扯出一段段错综复杂的往事。雕刻基督像的麻风病琴师，萨普开的神秘外国医生和掘墓人之女，不堪压榨逃离茶园的新婚夫妇，命运相互纠缠的犯人和叛徒……', 1);
INSERT INTO `tb_product` VALUES (170, '建筑的故事', 298.00, '历史文化类，极全面的建筑通史，囊括全球各时期建筑畅销数十年的经典，建筑艺术的重磅之作编辑推荐畅销数十年，内容不断修订，渐臻完善《建筑的故事》自1983年费顿……', 1);
INSERT INTO `tb_product` VALUES (171, '以书会友', 72.00, '历史文化类，在十八世纪的英国，由于印刷业的蓬勃发展，书籍成为自我提升、家庭娱乐和邻里社交的重要工具。《以书会友：十八世纪的书籍社交》聚焦十八世纪英国中产阶层的阅读生活，关……', 1);
INSERT INTO `tb_product` VALUES (172, '观看绘画', 75.00, '历史文化类，纯粹的愉悦！艺术史大师肯尼斯克拉克爵士回归艺术鉴赏的原点观看绘画。怎样观看一幅艺术杰作？在那些杰作的画布里，隐藏着艺术家怎样的巧思妙想？这是一部以丰富……', 1);
INSERT INTO `tb_product` VALUES (173, '身体、空间与后现代性', 65.00, '历史文化类，知名学者、清华大学教授汪民安，广受读者喜爱的经典作品。和《现代性》一样优美、晓畅，让人如痴如醉的学术著作。汪民安教授对于理论的阐述深入浅出，阅读体……', 1);
INSERT INTO `tb_product` VALUES (174, '劫后“天堂”', 69.00, '历史文化类，茶馆、菜馆、烟馆、旅馆，为何会在沦陷后的苏州愈加兴盛？这些繁荣表象的背后隐藏了什么？沦陷区的百姓又是如何度过那动荡的八年？对伪政权统治沦陷区又该如何进行评价……', 1);
INSERT INTO `tb_product` VALUES (175, '全民基本收入', 88.00, '历史文化类，诺奖得主阿玛蒂亚森推荐，法国经济协会2020最佳经济著作奖，“基本收入理论之父帕里斯重磅之作，一本适合大众阅读的经济学著作，一场不可多得的跨学科全范围大讨……', 1);
INSERT INTO `tb_product` VALUES (176, '茶叶与鸦片', 100.00, '历史文化类，19世纪的茶叶与鸦片贸易如何见证了中国在全球化进程中的命运？茶叶如何成为一种全球性商品，获得英国人的青睐？鸦片为什么突然在中国泛滥成灾？中国为什么没能抓住茶叶……', 1);
INSERT INTO `tb_product` VALUES (177, '魔都镜像', 49.00, '历史文化类，本书作者活用多年来在日本搜集的有关近代日本人记录、描述上海的文献资料，用简练清晰的笔调，为读者勾勒出了自1860年代初至1940年代初这八十年来东邻日本人对上……', 1);
INSERT INTO `tb_product` VALUES (178, '策展哲学', 98.00, '历史文化类，《策展哲学》是英国伦敦金史密斯学院视觉文化系“策展知识项目近五年的研究成果合集，创造性地提出“策展性概念，书中的六个主题展现了思考“策展性的方式，启发……', 1);
INSERT INTO `tb_product` VALUES (179, '独醒之累', 88.00, '历史文化类，一段走向世界的挫折之路，一个独醒先驱的悲剧人生。透过一个“失败者的执着与挣扎，读懂内外矛盾交织的晚清政局。本书以郭嵩焘跌宕起伏的人生经历为主线，串联起曾……', 1);
INSERT INTO `tb_product` VALUES (180, '法治的细节', 49.80, '历史文化类，编辑推荐：2020年度法治人物、中国政法大学罗翔教授全新法律随笔，解读热点案件，思辨法治要义。集结罗翔近两年对法治与社会的观察，论法理、聊读书、谈爱……', 1);
INSERT INTO `tb_product` VALUES (181, '帝国的技艺', 99.00, '历史文化类，大众政治兴起，统治压力剧增帝国，作为一种主要的人类政治构造，航行在民族主义时代的风暴中。帝国的掌舵者们，并没有温柔地走进那个良夜。有些船搁浅了，有些船则……', 0);
INSERT INTO `tb_product` VALUES (182, '理由与权威', 68.00, '历史文化类，约瑟夫拉兹是当代西方世界最著名的法哲学家之一，其论著在伦理学和政治哲学领域也有着深远的影响。本书结合多个学科的理论资源，全方位、系统性研究拉兹的法律规范性理……', 1);
INSERT INTO `tb_product` VALUES (183, '达·芬奇传', 116.00, '历史文化类，还原了达芬奇真实而复杂的人生经历，剥去天才光环，为读者呈现一个平凡而伟大的达芬奇编辑推荐完整中文版首次出版，补齐了前一版的删节。作者查尔斯……', 1);
INSERT INTO `tb_product` VALUES (184, '我身体里的人造星星', 58.00, '历史文化类，【编辑推荐】我们的身体当然是神圣的，但它们往往不只属于我们人可以患病，但不能成为疾病：一个超越病痛抵达艺术永恒的生命故事，一场重新定义自我、救赎自我的疗……', 1);
INSERT INTO `tb_product` VALUES (185, '苏联解体亲历记', 158.00, '历史文化类，关于苏联的崩溃，除了苏共政治局委员，或许没有人能够给出比马特洛克更为权威的叙述。《科克斯评论》一部记录与剖析世纪剧变的重磅启示录：一个超级大国如何……', 1);
INSERT INTO `tb_product` VALUES (186, '资治通鉴熊逸版第1辑', 399.00, '历史文化类，对于《资治通鉴》这样一部影响深远的史学经典，我们该以何种方式读懂它？《资治通鉴熊逸版》给出了答案。这是一项跨越数年的“读史大工程，作者熊逸为读者逐字逐句解……', 1);
INSERT INTO `tb_product` VALUES (187, '法西斯谎言简史', 54.00, '历史文化类，只有理解了法西斯与谎言的关系，才真正知道法西斯是怎么回事撒谎和政治一样古老。以更大的善为名掩盖真相，是大多数政治史的标志。君主、自由党和保守党也说谎，但谎……', 1);
INSERT INTO `tb_product` VALUES (188, '如何阅读福柯', 42.00, '历史文化类，“灵魂是身体的监狱哲学史的反叛者与颠覆者西方文化的考古学家福柯十堂课读懂大师思想让哲学不再令人生畏英国格兰塔出版社王牌书系【编辑推……', 1);
INSERT INTO `tb_product` VALUES (189, '废墟上的未来', 88.00, '历史文化类，2019年美国考古学会图书奖获奖作品作者林恩梅斯克尔为宾夕法尼亚大学教授、宾夕法尼亚大学博物馆策展人，康奈尔大学A.D.怀特特聘教授，澳大利亚人文学院……', 1);
INSERT INTO `tb_product` VALUES (190, '如何阅读德里达', 45.00, '历史文化类，“文本之外别无他物拆解“解构之父重估德里达思想遗产十堂课读懂大师思想让哲学不再令人生畏英国格兰塔出版社王牌书系【编辑推荐】德里达……', 0);
INSERT INTO `tb_product` VALUES (191, '现代性及其不满', 88.00, '历史文化类，耶鲁大学政治哲学公开课姊妹篇，施特劳斯派经典之作一本书囊括现代哲学大师名著从文艺复兴的马基雅维利到20世纪诺贝尔文学奖作家索尔贝娄，从小说与人生故事中……', 1);
INSERT INTO `tb_product` VALUES (192, '故宫国宝100件', 138.00, '历史文化类，《故宫国宝100件》是“故宫三书中的一本。该书从故宫博物院馆珍藏的90多万件文物中精选出来的100件，在这些国之瑰宝中万里挑一，分为青铜器、书画、陶瓷、工艺……', 1);
INSERT INTO `tb_product` VALUES (193, '业', 58.00, '历史文化类，-编辑推荐-如何将主体从意愿和行动的枷锁中解放出来？如何让人类的行动从目的手段的循环中挣脱出来？“神圣人系列之外，意大利当代具有世界影响力的思……', 1);
INSERT INTO `tb_product` VALUES (194, '罗马史研究入门（第二版）', 89.00, '历史文化类，本书是一本全面、系统的罗马史研究指南，包含历史概述、史料介绍、研究史概述、重点问题解析，以及对相关学术资源和工具书的介绍。第二版在首版的基础之上，吸收了国内外……', 1);
INSERT INTO `tb_product` VALUES (195, '社会学（第八版）', 249.00, '历史文化类，《社会学》如今出至第八版，对于理解我们塑造的世界、我们所过的生活，依然是不可或缺的导引。本书行文流畅，布局清晰，努力做到既智识严谨，又深入浅出，尤其强调互动……', 1);
INSERT INTO `tb_product` VALUES (196, '当经济遇上法律', 78.00, '历史文化类，明清中国的一些商业城镇曾经发生经济组织、经济法令乃至文化意识形态方面的变动，进而促成当时的制度变迁。针对苏州商人团体、苏州与松江棉布加工业、云南铜矿业与重庆航……', 1);
INSERT INTO `tb_product` VALUES (197, '诸神的黄昏', 158.00, '历史文化类，1944年6月的菲律宾海战役后，盟军在太平洋战争中占据了绝对主动。为了减少伤亡和速战速决，美国人绞尽脑汁，而日军考虑的却只是如何“光荣赴死。在“七生报国……', 1);
INSERT INTO `tb_product` VALUES (198, '齐梁皇室的佛教信仰与撰述', 68.00, '历史文化类，兰陵萧氏作为齐梁皇室，在南朝的政治史、佛教史以及文学史上都有独特的位置，历来都是南北朝文学、史学乃至哲学研究的热点话题。《齐梁皇室的佛教信仰与撰述》一书不拘于……', 1);
INSERT INTO `tb_product` VALUES (199, '八旗心象', 89.00, '历史文化类，本书以晚清民国的旗人及其文学为研究对象，将其置入政治、经济、社会、军事乃至国际关系的关联性语境中，展开跨文学、历史与区域研究的对话；体察旗人在时代语境中经历的……', 1);
INSERT INTO `tb_product` VALUES (200, '医学人类学十二论', 48.00, '历史文化类，医学人类学根植于我们每个人的日常生活，贯穿生命历程生、老、病、死各个阶段，与每个人对自我、身体、生命、社会的认知息息相关。同时，它对医疗健康领域的知识生产同样……', 1);
INSERT INTO `tb_product` VALUES (201, '穿过一条街道的方法', 78.00, '历史文化类，【编辑推荐】美国天才作家大卫福斯特华莱士罕见历史作品；睿智、深刻，充满娱乐性和可读性的无穷大概念史；一段挑战抽象之抽象，挑战想象力极限的……', 1);
INSERT INTO `tb_product` VALUES (202, '山水天地间', 68.00, '历史文化类，《山水天地间》聚焦于北宋著名画家郭熙的代表作《早春图》，通过大量的图像细读，结合经典画史画论中的描述与品评，对宋代山水画中所蕴含的文化特质，分“物象与心观“……', 1);
INSERT INTO `tb_product` VALUES (203, '巴黎传', 128.00, '历史文化类，从罗马时代的“卢特提亚到21世纪的“大巴黎，作为首都城市，巴黎的历史与法国的历史息息相关。在漫长的中世纪里，巴黎见证了一个个王朝的兴亡盛衰；在波澜壮阔的大……', 1);
INSERT INTO `tb_product` VALUES (204, '穿越亚洲腹地（上卷）', 110.00, '历史文化类，中国社会科学院考古研究所陈星灿、《失落的卫星》作者刘子超推荐！国内首次完整引进，“西域探险之父斯文赫定第四次亚洲探险全记录。完整展现18991901……', 0);
INSERT INTO `tb_product` VALUES (205, '萨尔珀冬陶瓶', 78.00, '历史文化类，【编辑推荐】文博热当下，看一只公元前6世纪末的古希腊陶瓶如何C位出道。近年来，逛博物馆、品鉴文物已成为人们喜闻乐见的消闲方式，本书围绕一只身世传奇的古希……', 1);
INSERT INTO `tb_product` VALUES (206, '做什么都能做好', 49.80, '历史文化类，360行共通的高效能习惯，让提升成为日常，让成功可以持续；保罗科埃略喜爱的励志作家、受《福布斯》《奥普拉》杂志盛赞的高效能教练、《华尔街日报》《纽约时报》《……', 1);
INSERT INTO `tb_product` VALUES (207, '反战之战', 168.00, '历史文化类，【内容简介】1928年盛夏的一个炎热下午，全世界的国家领导人为了消除战争而齐聚巴黎。当天签署的《非战公约》几乎被世界上所有国家批准。于是，历史上第一次，战争……', 1);
INSERT INTO `tb_product` VALUES (208, '为什么人们轻信奇谈怪论', 59.00, '科学新知类，作者是一位怀疑论者，被称为“头号科学打假人。该书共分五个部分，从怀疑论的角度来探讨科学与怀疑论、伪科学与迷信、进化论与创世论、历史与伪历史等问题。全书从怀疑……', 1);
INSERT INTO `tb_product` VALUES (209, '流行病的故事', 68.00, '科学新知类，流行病在人类的DNA中一次次留下印记它改变了人类的行为模式，塑造着人类的文明进程流行病，让我们成为人类入选《洛杉矶时报》图书奖、全美科学作家协会奖、……', 1);
INSERT INTO `tb_product` VALUES (210, '大卫·爱登堡自然行记（第一辑）', 168.00, '科学新知类，“自然纪录片之父大卫爱登堡亲笔作品史诗般的博物之旅，开启尘封在时光中的荒野之美95幅珍贵历史照片，揭示博物变革时期的点点滴滴国家动物……', 1);
INSERT INTO `tb_product` VALUES (211, '森林之花', 128.00, '科学新知类，玛格丽特米不仅是一位享誉全球的植物学画家，更是一位勇敢的亚马孙雨林探险者、一位传奇的女性。1956年至1988年，玛格丽特米一直对神秘、瑰丽的亚马孙森……', 0);
INSERT INTO `tb_product` VALUES (212, '社会生物学', 168.00, '科学新知类，编辑推荐爱德华O.威尔逊以本书为契机，开创了“社会生物学这一学科，高度综合了众多学科，横跨自然科学和社会科学两大领域。作者通过本书不余遗……', 1);
INSERT INTO `tb_product` VALUES (213, '不可思议的人体', 39.80, '科学新知类，临床医生手绘搞笑漫画轻松入门人体解剖生理你本身就是40亿年进化的奇迹编辑推荐媲美《工作细胞》的漫画人体百科，从零开始的解剖生理学日本临床医……', 1);
INSERT INTO `tb_product` VALUES (214, '身体由我', 69.00, '科学新知类，这是一部女性健康科普著作，图书出版后在德国医学界和科普界收获了一致盛赞，长踞《明镜》周刊畅销榜，领衔了各大健康百科及女性健康图书榜单。这是一部温情的女性身体……', 1);
INSERT INTO `tb_product` VALUES (215, '穿过一条街道的方法', 78.00, '科学新知类，【编辑推荐】美国天才作家大卫福斯特华莱士罕见历史作品；睿智、深刻，充满娱乐性和可读性的无穷大概念史；一段挑战抽象之抽象，挑战想象力极限的……', 0);
INSERT INTO `tb_product` VALUES (216, '如何离开地球表面', 69.00, '科学新知类，人类从什么时候开始渴望飞行？1000年来的科学家和冒险者都做过哪些飞行的尝试？飞机和火箭的历史上有哪些里程碑式的技术突破？莱特兄弟之前的几百年，飞机设计……', 1);
INSERT INTO `tb_product` VALUES (217, '理解愤怒', 68.00, '科学新知类，知名心理咨询师丛非从最新力作以《愤怒分析表》带你理解愤怒的背后，原来是一个未被觉知的自己愿你拥有，愤怒的自由！*内容简介一个人愤怒，是因为他有恐……', 1);
INSERT INTO `tb_product` VALUES (229, '张医生与王医生', 68.00, '社会纪实类，两个原生家庭，跨越三十年的奋斗，调动的能量，堪比战争。李海鹏作序，陈嘉映梁文道罗新严飞班宇诚挚推荐《好奇心日报》《小鸟文学》创始人，知……', 1);
INSERT INTO `tb_product` VALUES (230, '彼得2.0', 58.00, '社会纪实类，【编辑推荐】这是一个真实故事：人类第一个赛博格Cyborg诞生记一段非凡的生命经历，一个关于爱、希望与勇气的人类故事本书也是彼得和彼得2.0共……', 1);
INSERT INTO `tb_product` VALUES (231, '日本流行美食文化史', 58.00, '社会纪实类，《FashionFood！日本流行美食文化史》新的就是好的？吃肉才是文明开化的象征？日本人的“牛肉信仰又是从何而来？网红美食的寿……', 1);
INSERT INTO `tb_product` VALUES (232, '消失的图书馆', 59.00, '社会纪实类，每座图书馆背后都有一群书籍守护者。在动荡不安的年代，这些守书人与图书馆之间的故事尤为鲜活、动人。作者以守书人、藏书人的身份，走访世界各地的图书馆，将这些图书馆……', 0);
INSERT INTO `tb_product` VALUES (233, '留守者', 58.00, '社会纪实类，内容简介是什么引燃了美国乡村人对联邦政府的怒火？为什么绝大多数美国乡村人会把选票投给共和党？是否能对日益加深的城乡分裂给出某种较为具体的解释？罗伯……', 1);
INSERT INTO `tb_product` VALUES (234, '独居老人', 128.00, '社会纪实类，内容介绍独居老人=悲惨的晚年？！《独居老人》中作者采访呈现的16位老前辈，会用悠然自得的生活状态打破世人的这种偏见。他们中有的独身已久，有的经历人生的起……', 1);
INSERT INTO `tb_product` VALUES (235, '我的生平', 72.00, '社会纪实类，本书是卡尔达诺的自传，作者是文艺复兴时期百科全书式的学者。他是第一个对斑疹伤寒做出临床描述的人，死后出版的《论赌博游戏》是第一部概率论著作，被认为对现代概率论……', 1);
INSERT INTO `tb_product` VALUES (236, '仙那度', 72.00, '社会纪实类，“仙那度Xanadu是西方文化中对元上都的称呼。英国著名“湖畔派诗人柯尔律治在一个夏天梦到马可波罗描述的忽必烈的宫殿，于梦醒后写下抒情诗《忽必烈汗》……', 0);
INSERT INTO `tb_product` VALUES (237, '日本核殇七十年', 69.00, '社会纪实类，一部反思从广岛核弹爆炸到福岛核泄漏的核灾难启示录回顾日本“核文化和社会事件，揭示日本“核观念嬗变的真相与内幕从所谓核爆受害国变成核泄漏危害国，再……', 1);
INSERT INTO `tb_product` VALUES (238, '梦瘾', 66.00, '社会纪实类，医生开的处方，怎么会跟海洛因和死人扯上关系呢？接受了最好的戒毒治疗怎么还戒不掉呢？止痛药依赖怎么会让海洛因趁机进入主流社会？橄榄球运动怎么成了通往阿片类……', 1);
INSERT INTO `tb_product` VALUES (239, '苗德岁讲达尔文', 58.00, '社会纪实类，一如哥白尼大大地扩展了我们的空间概念，达尔文大大地扩展了我们的时间概念；哥白尼让我们认识到地球在宇宙中的位置，而达尔文让我们认识到人类在自然界中的位置……一百……', 1);
INSERT INTO `tb_product` VALUES (240, '水彩慢行记', 72.00, '艺术设计类，水彩艺术家柳毅、池振明、黄华兆，漫画家口袋巧克力，摄影达人席子，联合推荐。收录微博、豆瓣、B站等平台上高人气青年画师小布老虎有点忙的风物水彩精华。1……', 1);
INSERT INTO `tb_product` VALUES (241, '西行影纪', 398.00, '艺术设计类，劫后遗存的文字与影像是西陲民族在逝去时代里的光影史诗也是庄学本的传奇一生编辑推荐劫后遗存的文字与影像，全面呈现一代纪实摄影大师庄学本的摄影艺术……', 1);
INSERT INTO `tb_product` VALUES (242, '皮娜·鲍什', 58.00, '艺术设计类，内容简介皮娜鲍什PinaBausch，19402009，德国著名舞蹈家、现代舞编导家，“舞蹈剧场的创立者。对2021世纪的舞蹈、舞台艺术乃至……', 1);
INSERT INTO `tb_product` VALUES (243, '设计人类学', 88.00, '艺术设计类，是什么让一件产品具有文化标签性？来自瑞典的宜家家居是怎样做到征服中国市场的？为何具有创新意识的设计师常常花费更多的时间去观察不同人的行为而不是埋头设计？……', 1);
INSERT INTO `tb_product` VALUES (244, '策展哲学', 98.00, '艺术设计类，《策展哲学》是英国伦敦金史密斯学院视觉文化系“策展知识项目近五年的研究成果合集，创造性地提出“策展性概念，书中的六个主题展现了思考“策展性的方式，启发……', 1);
INSERT INTO `tb_product` VALUES (245, '达·芬奇传', 116.00, '艺术设计类，还原了达芬奇真实而复杂的人生经历，剥去天才光环，为读者呈现一个平凡而伟大的达芬奇编辑推荐完整中文版首次出版，补齐了前一版的删节。作者查尔斯……', 1);
INSERT INTO `tb_product` VALUES (246, '故宫国宝100件', 138.00, '艺术设计类，《故宫国宝100件》是“故宫三书中的一本。该书从故宫博物院馆珍藏的90多万件文物中精选出来的100件，在这些国之瑰宝中万里挑一，分为青铜器、书画、陶瓷、工艺……', 1);
INSERT INTO `tb_product` VALUES (247, '山水天地间', 68.00, '艺术设计类，《山水天地间》聚焦于北宋著名画家郭熙的代表作《早春图》，通过大量的图像细读，结合经典画史画论中的描述与品评，对宋代山水画中所蕴含的文化特质，分“物象与心观“……', 1);
INSERT INTO `tb_product` VALUES (248, '童年美术馆', 108.00, '艺术设计类，儿童艺术展的入口高度应以多少为宜？一米！学校的美术馆应该建在哪儿？厕所呀！在美术馆“建立一个新的“国家，为什么还要创造一种新的语言？因为在一个国家上建……', 1);
INSERT INTO `tb_product` VALUES (249, '古典乐的慰藉', 68.00, '艺术设计类，音乐是关乎心灵的艺术，有自己独特的语言表达方式。当面对一部作品时，很多人感觉到的只是扑面而来的“声音，却不知如何聆听“音乐。本书以音乐的节奏、旋律、情感为……', 1);
INSERT INTO `tb_product` VALUES (250, '稍息', 298.00, '艺术设计类，意大利摄影家老安在华40年首部摄影集。190张照片，记录在改革开放之初的“稍息年代，普通中国人如何小心翼翼走向真正意义上的生活。在这些照片中，我们将目……', 0);
INSERT INTO `tb_product` VALUES (251, '观看绘画', 75.00, '艺术设计类，纯粹的愉悦！艺术史大师肯尼斯克拉克爵士回归艺术鉴赏的原点观看绘画。怎样观看一幅艺术杰作？在那些杰作的画布里，隐藏着艺术家怎样的巧思妙想？这是一部以丰富……', 1);
INSERT INTO `tb_product` VALUES (252, '上海：一座世界城市的肖像', 398.00, '艺术设计类，著名摄影家刘香成精选影集；精美摄影作品记录浦东开发开放以来上海巨变，展现上海“世界城市气质。本书是一部以上海为主题的摄影作品集，收录珍贵的历史照片以及当代……', 1);
INSERT INTO `tb_product` VALUES (253, '二十世纪艺术之书', 380.00, '艺术设计类，现当代艺术是一面现实之镜，镜子里是每一个“你全景式现当代艺术图鉴，尽览莫奈、毕加索、弗里达、霍克尼等500位国际知名艺术家的代表作品45种风格流派，来自……', 1);
INSERT INTO `tb_product` VALUES (254, '希区柯克传', 74.00, '艺术设计类，英国国宝级传记作家，《伦敦传》《莎士比亚传》《狄更斯传》作者，曾获毛姆文学奖、《卫报》小说奖的“伦敦代言人深刻书写，一位伦敦郊区贩夫走卒出身的传奇导演处……', 1);
INSERT INTO `tb_product` VALUES (255, '建筑的故事', 298.00, '艺术设计类，极全面的建筑通史，囊括全球各时期建筑畅销数十年的经典，建筑艺术的重磅之作编辑推荐畅销数十年，内容不断修订，渐臻完善《建筑的故事》自1983年费顿……', 1);
INSERT INTO `tb_product` VALUES (256, '罗密欧与朱丽叶', 68.00, '艺术设计类，“人类醉伟大的戏剧天才马克思语歌咏爱情的典范之作俄罗斯新生代插画家谢苗诺娃以爱之名，深情演绎装帧典雅大方，封面覆进口触感膜，内文采用高档特……', 0);
INSERT INTO `tb_product` VALUES (257, '旅行箱里的四季', 128.00, '艺术设计类，“我想和你们分享我的这份记忆，和我一起在画里感受四季的旅程。《旅行箱里的四季》是插画艺术家卤猫以“四季为主题的图文作品集，按四季之序，分为春、夏、秋、冬……', 1);
INSERT INTO `tb_product` VALUES (258, '价格革命', 128.00, '商业经管类，普利策奖得主&《阿尔比恩的种子》作者大卫哈克特费舍尔的集大成之作呈现人类社会的四次价格革命浪潮，重塑800年来的世界史“改变的历史。世界史，因此……', 1);
INSERT INTO `tb_product` VALUES (259, '双重转型', 69.80, '商业经管类，跟随本书的指引，对如何进行转型将有更加清晰的思路。奈飞、亚马逊从一家DVD租赁公司、一家零售商转型为全球知名的企业，你也一样可以。这本书为企业管理者提供了明……', 0);
INSERT INTO `tb_product` VALUES (260, '华为数字化转型', 88.00, '商业经管类，企业的数字化转型，面临诸多的难题，但真正卡转型“脖子的，不是技术，而是思维和方法。如果能够站上先行者的肩膀上，学习吸收业界优秀实践的势能，那必然会是最稳健最……', 1);
INSERT INTO `tb_product` VALUES (261, '全民基本收入', 88.00, '商业经管类，诺奖得主阿玛蒂亚森推荐，法国经济协会2020最佳经济著作奖，“基本收入理论之父帕里斯重磅之作，一本适合大众阅读的经济学著作，一场不可多得的跨学科全范围大讨……', 1);
INSERT INTO `tb_product` VALUES (262, '数字劳动', 58.00, '商业经管类，本书告诉你，为什么我们在互联网上的每一次浏览、发布、转发、点赞、评论，都是在为资本“劳动。在传播新科技的突飞猛进将劳动数字化、数字技术使用者“劳工化的趋……', 1);
INSERT INTO `tb_product` VALUES (263, '影响力', 99.90, '商业经管类，内容简介自出版以来，《影响力》就一直是畅销佳作。由于它的影响，说服得以成为一门科学。无论你是普通人还是为某一产品或事业观点游说的人，这都是一本基本的必读……', 1);
INSERT INTO `tb_product` VALUES (264, '抱住棒棒的自己', 59.80, '绘本漫画类，徐慢慢是一位36岁的心理咨询师，她有一个佛系的程序员老公老赵，活泼的9岁儿子小航。从2019年起，有上百万的读者在观看徐慢慢的故事，跟她一起接纳自己，松绑情绪……', 0);
INSERT INTO `tb_product` VALUES (265, '长崎：看不见的寄居者', 88.00, '绘本漫画类，莫名其妙消失的食物，摄像头前的神秘身影从社会新闻到文学作品到图像小说再创作原著小说荣获法兰西学院小说大奖法国圣马洛漫画节“新人大奖得主的一场满分艺术实……', 1);
INSERT INTO `tb_product` VALUES (266, '人鱼姬', 118.00, '绘本漫画类，2015年，86岁的日本艺术家草间弥生在丹麦路易斯安那现代艺术博物馆举办个人展览，其LoveForever系列作品一经展出即引起巨大反响。现代艺术博物馆将这……', 1);
INSERT INTO `tb_product` VALUES (267, '森林之花', 128.00, '绘本漫画类，玛格丽特米不仅是一位享誉全球的植物学画家，更是一位勇敢的亚马孙雨林探险者、一位传奇的女性。1956年至1988年，玛格丽特米一直对神秘、瑰丽的亚马孙森……', 1);
INSERT INTO `tb_product` VALUES (268, '不可思议的人体', 39.80, '绘本漫画类，临床医生手绘搞笑漫画轻松入门人体解剖生理你本身就是40亿年进化的奇迹编辑推荐媲美《工作细胞》的漫画人体百科，从零开始的解剖生理学日本临床医……', 1);
INSERT INTO `tb_product` VALUES (269, '关于独角兽的几乎全部真相', 99.80, '绘本漫画类，一份脑洞大开的趣味研究报告，为你揭秘独角兽的全部真相充满幻想的插画，将神秘的独角兽世界带到大家眼前，满足读者对独角兽的所有好奇编辑推荐一份脑……', 1);
INSERT INTO `tb_product` VALUES (270, '秒速五千公里', 55.00, '绘本漫画类，致那些无法消退的爱情与乡愁安古兰、卢卡漫画节获奖作品跨越三个国家、贯穿三个人生阶段的情感纠葛爱情如此让人欲罢不能，却不料自始至终都是三人游戏几何图形化……', 1);
INSERT INTO `tb_product` VALUES (271, '时间遇难者', 96.00, '绘本漫画类，墨比斯、恩基比拉极力推荐的科幻大师法漫先驱突破想象边界的经典力作突如其来的异族入侵，扣人心弦的星际追击敌人与同伴真伪莫辨，阴谋与陷阱环环相扣失散的“……', 0);
INSERT INTO `tb_product` VALUES (272, '哈利·波特与魔法石', 19.00, '小说类，一岁的哈利・波特失去父母后，神秘地出现在姨父姨妈家的门前。哈利在姨父家饱受欺凌，度过十年极其痛苦的日子。姨父和姨妈好似凶神恶煞，他们那混世魔王儿子达力。。。', 1);
INSERT INTO `tb_product` VALUES (273, '哈利·波特与密室', 22.00, '小说类，《哈利·波特与密室》是“哈利·波特”系列的第二部。  哈利·波特在霍格沃茨魔法学校学习一年之后，暑假开始了。他在姨父姨妈家熬过痛苦的假期。正当他准备打点行装去学校时，小精灵多比。。。', 1);
INSERT INTO `tb_product` VALUES (286, '哈哈哈2', 23.00, '小说类，第部的红红火火恍恍惚惚或哈哈哈或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或', 1);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, '张三', '123', '1640963236@qq.com');
INSERT INTO `tb_user` VALUES (2, '李四', '123', '1640963236@qq.com');
INSERT INTO `tb_user` VALUES (3, '王五', '123', '1640963236@qq.com');
INSERT INTO `tb_user` VALUES (10, '赵六', '123', '1640963236@qq.com');

SET FOREIGN_KEY_CHECKS = 1;
