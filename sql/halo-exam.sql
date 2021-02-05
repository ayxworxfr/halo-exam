/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : halo-exam

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 04/02/2021 15:43:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for answer_question
-- ----------------------------
DROP TABLE IF EXISTS `answer_question`;
CREATE TABLE `answer_question`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `answer` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `mark_score` decimal(20, 8) NULL DEFAULT NULL COMMENT '得分',
  `question_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题id',
  `answer_time` datetime(0) NULL DEFAULT NULL COMMENT '答题时间点',
  `exam_user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考试用户表id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answer_question
-- ----------------------------
INSERT INTO `answer_question` VALUES ('1f620725b6ce4bcdbe8b2f87800b5a96', '弗罗伦斯·南丁格尔( 1820 - 1910)，出生于英国上流社会家庭。19世纪40、50 年代，伦敦郊区贫民窟频繁发生霍乱等瘟疫，人们对于“医院”“护理”这样的字眼一 向避而不谈，因为都是一些很可怕、很丢脸的事情。医院几乎就是不幸、堕落，混乱的 代名词。由于缺少必要的管理，它有时就像疯人院。 根据材料并结合所学知识，指出南丁格尔投身护理事业的时代背景。', 8.00000000, NULL, NULL, NULL);
INSERT INTO `answer_question` VALUES ('4f944b5aa3c14fcca4f5c5a946324ae8', '工业革命期间，疾病流行；医疗卫生事业和人们观念落后；战争频繁。', 8.00000000, NULL, NULL, NULL);
INSERT INTO `answer_question` VALUES ('568ba3eecded45ad8272474815955b2a', '辽统治者耶律德光灭后晋后，入晋宫召集百官时，他“改服中国衣冠，百官起居皆 如旧制”，对群臣宣布“自今不修甲兵，不市战马，轻赋省役，天下太平矣”。并任命了 一批汉官主持汉地事务。 根据材料概括耶律德光统治的特点。', 6.00000000, NULL, NULL, NULL);
INSERT INTO `answer_question` VALUES ('884b68a1ae0e4255ad11ed4a7c352d1d', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `answer_question` VALUES ('a78dcbdb24414de6bc5ca700b455964f', 'B', 4.00000000, NULL, NULL, NULL);
INSERT INTO `answer_question` VALUES ('c97ea3fd9c574b69b0ff3b73abcea43a', 'B', 4.00000000, NULL, NULL, NULL);
INSERT INTO `answer_question` VALUES ('cd5423f293a4455cb9525cc53fe12659', 'B', 4.00000000, NULL, NULL, NULL);
INSERT INTO `answer_question` VALUES ('d4283721446c482fb4c6d04f8ae853c5', '19世纪末20世纪初，中国也有人从历史延 续的角度、民众与英雄辩证关系的角度来解读华盛顿。清末民初，华盛顿已是中文世界 出现频率相当高的名字。在人们心目中，至少有九个不同的华盛顿形象，如开国总统、 国父形象；打了天下但不做皇帝的尧舜形象；敢于认错、不讲谎话、见义勇为、孝顺母 亲的诚实、行善、孝顺形象；也有缺点错误、也会发脾气的凡人形象。 根据材料并结合所学知识，指出南北战争前后美国人心目中华盛顿形象的变化及原因。', 10.00000000, NULL, NULL, NULL);
INSERT INTO `answer_question` VALUES ('de4c192aee694d5fb16ed34791e11215', 'B', 4.00000000, NULL, NULL, NULL);
INSERT INTO `answer_question` VALUES ('e5719e64646043d18a8527e51ee71620', 'B', 4.00000000, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考试名称',
  `class_id` bigint(20) NULL DEFAULT NULL COMMENT '班级内部测试(大型考试可以设为空)',
  `subject_id` bigint(255) NULL DEFAULT NULL COMMENT '课程id',
  `paper_id` varchar(0) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试卷id',
  `publish` int(255) NULL DEFAULT NULL COMMENT '是否发布@1是，0否',
  `start_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结束时间',
  `type` int(20) NULL DEFAULT NULL COMMENT '1-模考 2-正考',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试卷标签(多个标签用&分隔)',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES ('115bd22d1bf3411697c634507d0a27a7', '测试正式考试1', NULL, 3, NULL, 1, '2017-04-24 08:00', '2017-04-24 12:00', 2, '2017年广东高考适应性测试文综(历史)试题', 'http://localhost:8765/static/img/paper/5ffd8499063c4bcabc0bdf34c08fa208.png', NULL, '2017-04-17 13:49:10', NULL);
INSERT INTO `exam` VALUES ('6b734c017c2f4f80ad3eac1fdf00b2d8', '测试模拟考试1', NULL, 3, NULL, 0, '2017-04-24 14:00', '2017-04-24 17:00', 1, '2016年广东高考适应性测试文综(历史)试题', 'http://localhost:8765/static/img/paper/e7f9d3117483440d84735bd7ed58d370.png', NULL, '2017-04-17 13:50:09', NULL);
INSERT INTO `exam` VALUES ('a2d9984ca80240698d2b87a5ef036662', '测试正式考试2', NULL, 3, NULL, 1, '2017-04-24 14:00', '2017-04-24 17:00', 2, '2016届广东省高考历史模拟试卷', 'http://localhost:8765/static/img/paper/aa1aeafc76164ed3b002973cce56b04f.png', NULL, '2017-04-17 14:31:20', NULL);
INSERT INTO `exam` VALUES ('d494206f90394f03902eb5e51e7b9991', '测试练习1', NULL, 3, NULL, 0, '2017-04-24 19:00', '2017-04-24 21:00', 1, '2016年广东高考适应性测试文综(历史)试题', 'http://localhost:8765/static/img/paper/8573b21197ad477f9094074bc8927901.png', NULL, '2017-04-17 13:50:46', NULL);

-- ----------------------------
-- Table structure for exam_user
-- ----------------------------
DROP TABLE IF EXISTS `exam_user`;
CREATE TABLE `exam_user`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '报考用户id',
  `exam_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '考试id',
  `sign_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '报考时间',
  `finish_time` datetime(0) NULL DEFAULT NULL COMMENT '提交答卷时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_user
-- ----------------------------
INSERT INTO `exam_user` VALUES ('1', 1, '115bd22d1bf3411697c634507d0a27a7', NULL, NULL);
INSERT INTO `exam_user` VALUES ('2', 2, '115bd22d1bf3411697c634507d0a27a7', '2021-01-28 17:21:32', NULL);
INSERT INTO `exam_user` VALUES ('3', 1, '6b734c017c2f4f80ad3eac1fdf00b2d8', NULL, NULL);
INSERT INTO `exam_user` VALUES ('4', 2, '6b734c017c2f4f80ad3eac1fdf00b2d8', NULL, NULL);
INSERT INTO `exam_user` VALUES ('5', 3, '6b734c017c2f4f80ad3eac1fdf00b2d8', NULL, NULL);

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试卷名称',
  `start_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结束时间',
  `subject_id` bigint(255) NULL DEFAULT NULL COMMENT '学科id',
  `publish` int(255) NULL DEFAULT NULL COMMENT '是否发布@1是，0否',
  `type` int(20) NULL DEFAULT NULL COMMENT '1-模考 2-正考',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `peoples` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参与人数',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试卷标签(多个标签用&分隔)',
  `heat` bigint(255) NULL DEFAULT NULL COMMENT '试卷热度',
  `status` int(255) NULL DEFAULT NULL COMMENT '试卷状态 1-公开(默认) 2私有',
  `gmt_create` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint(20) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name_type_heat`(`name`, `type`, `heat`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES ('115bd22d1bf3411697c634507d0a27a7', '测试正式考试1', '2017-04-24 08:00', '2017-04-24 12:00', 3, 1, 2, '2017年广东高考适应性测试文综(历史)试题', 'http://localhost:8765/static/img/paper/5ffd8499063c4bcabc0bdf34c08fa208.png', '1', NULL, NULL, NULL, '2017-4-17 13:49:10', NULL, NULL, NULL);
INSERT INTO `paper` VALUES ('6b734c017c2f4f80ad3eac1fdf00b2d8', '测试模拟考试1', '2017-04-24 14:00', '2017-04-24 17:00', 3, 0, 1, '2016年广东高考适应性测试文综(历史)试题', 'http://localhost:8765/static/img/paper/e7f9d3117483440d84735bd7ed58d370.png', '1', NULL, NULL, NULL, '2017-4-17 13:50:9', NULL, NULL, NULL);
INSERT INTO `paper` VALUES ('a2d9984ca80240698d2b87a5ef036662', '测试正式考试2', '2017-04-24 14:00', '2017-04-24 17:00', 3, 1, 2, '2016届广东省高考历史模拟试卷', 'http://localhost:8765/static/img/paper/aa1aeafc76164ed3b002973cce56b04f.png', '1', NULL, NULL, NULL, '2017-4-17 14:31:20', NULL, NULL, NULL);
INSERT INTO `paper` VALUES ('d494206f90394f03902eb5e51e7b9991', '测试练习1', '2017-04-24 19:00', '2017-04-24 21:00', 3, 0, 1, '2016年广东高考适应性测试文综(历史)试题', 'http://localhost:8765/static/img/paper/8573b21197ad477f9094074bc8927901.png', '0', NULL, NULL, NULL, '2017-4-17 13:50:46', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for paper_question
-- ----------------------------
DROP TABLE IF EXISTS `paper_question`;
CREATE TABLE `paper_question`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `paper_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试卷id',
  `number` int(11) NULL DEFAULT NULL COMMENT '题目编号',
  `question_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题id',
  `score` decimal(20, 8) NULL DEFAULT NULL COMMENT '出卷人设置的题目分值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paper_question
-- ----------------------------
INSERT INTO `paper_question` VALUES ('46', '115bd22d1bf3411697c634507d0a27a7', NULL, 'fc41c02697004f179933aec14d6efd4c', NULL);
INSERT INTO `paper_question` VALUES ('47', '115bd22d1bf3411697c634507d0a27a7', NULL, 'c45ea2f782ab4ab39d67ef713b6c9264', NULL);
INSERT INTO `paper_question` VALUES ('48', '115bd22d1bf3411697c634507d0a27a7', NULL, 'cc7e7125df994a6ab4fef47c8f969db6', NULL);
INSERT INTO `paper_question` VALUES ('49', '115bd22d1bf3411697c634507d0a27a7', NULL, 'a2548c08191c4ffba862302121b00626', NULL);
INSERT INTO `paper_question` VALUES ('50', '115bd22d1bf3411697c634507d0a27a7', NULL, '7fb8a8ac6f16451ab416dcd2358da233', NULL);
INSERT INTO `paper_question` VALUES ('51', '115bd22d1bf3411697c634507d0a27a7', NULL, '0eee5088a03d4501ab507e20d10daff4', NULL);
INSERT INTO `paper_question` VALUES ('52', '115bd22d1bf3411697c634507d0a27a7', NULL, 'b0c6dfe2ad6b4774baad60232f1158db', NULL);
INSERT INTO `paper_question` VALUES ('53', '115bd22d1bf3411697c634507d0a27a7', NULL, 'd476c46e0e574253a95d44c53eacde73', NULL);
INSERT INTO `paper_question` VALUES ('54', '115bd22d1bf3411697c634507d0a27a7', NULL, 'e029b3872404418bb8e3ebaf7939b58b', NULL);
INSERT INTO `paper_question` VALUES ('55', '115bd22d1bf3411697c634507d0a27a7', NULL, 'be9b4fccc2fa4144a3da23fd53faa250', NULL);
INSERT INTO `paper_question` VALUES ('57', 'a2d9984ca80240698d2b87a5ef036662', NULL, '95c62e38f8ea434ab69d009231d1ae99', NULL);

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` int(20) NULL DEFAULT NULL COMMENT '题目类型 1-选择题 2-多选题 3-填空题 4-简答题',
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '题目标题',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '题目描述',
  `weight` decimal(20, 8) NULL DEFAULT NULL COMMENT '题目难度权重0~1',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '题目内容(扩展用)',
  `option_a` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `option_b` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `option_c` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `option_d` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '题目标签(多个标签用&分隔)',
  `heat` bigint(255) NULL DEFAULT NULL COMMENT '题目热度',
  `status` int(255) NULL DEFAULT NULL COMMENT '问题状态 1-公开(默认) 2私有',
  `gmt_create` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  `create_by` bigint(255) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_heat`(`type`, `heat`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('0eee5088a03d4501ab507e20d10daff4', 3, '阅读材料，完成下列要求。 \n19世纪末20世纪初，中国也有人从历史延 续的角度、民众与英雄辩证关系的角度来解读华盛顿。清末民初，华盛顿已是中文世界 出现频率相当高的名字。在人们心目中，至少有九个不同的华盛顿形象，如开国总统、 国父形象；打了天下但不做皇帝的尧舜形象；敢于认错、不讲谎话、见义勇为、孝顺母 亲的诚实、行善、孝顺形象；也有缺点错误、也会发脾气的凡人形象。\n 根据材料并结合所学知识，指出南北战争前后美国人心目中华盛顿形象的变化及原因。', '阅读材料，完成下列要求。 \n1...', 5.00000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 16:56:35', NULL, NULL, NULL);
INSERT INTO `question` VALUES ('7fb8a8ac6f16451ab416dcd2358da233', 1, '李鸿章凭淮军实力日渐强盛。一次，他在游孔林时说道：“孔子不会打洋枪，今不     足贵也。”李鸿章这样评价孔子，其背景最可能是', '李鸿章凭淮军实力日渐强盛。一次...', 5.00000000, NULL, '“师夷长技”思想萌发', '“中体西用”思潮兴起', '“托古改制”思想产生', '“尊孔复古”思潮泛滥', NULL, NULL, NULL, '2021-01-20 19:38:47', NULL, NULL, NULL);
INSERT INTO `question` VALUES ('95c62e38f8ea434ab69d009231d1ae99', 3, '中外历史人物评说 \n材料     \n弗罗伦斯·南丁格尔( 1820 - 1910)，出生于英国上流社会家庭。19世纪40、50 年代，伦敦郊区贫民窟频繁发生霍乱等瘟疫，人们对于“医院”“护理”这样的字眼一 向避而不谈，因为都是一些很可怕、很丢脸的事情。医院几乎就是不幸、堕落，混乱的 代名词。由于缺少必要的管理，它有时就像疯人院。      南丁格尔不顾家人反对毅然投身护理事业。1854年她到克里米亚野战医院工作，被 战地士兵称为“克里米亚的天使”和“提灯天使”。1860年，她创建了世界上第一所正 规护士学校，她的办学思想传到欧美及亚洲各国，护理学也成为了一门科学。1863年时， 疾病命名与分类混淆不清，各地医院各自为政。南丁格尔制定了医疗统计标准模式，被 英国各医院相继采用。1912年国际红十字大会设立国际护理界的最高荣誉奖一一南丁格 尔奖章，以表彰为护理事业中做出卓越贡献的医护人员。                              \n 一据安妮·马修森《佛罗伦萨·南丁格尔传》\n 根据材料并结合所学知识，指出南丁格尔投身护理事业的时代背景。', '中外历史人物评说 \n材料   ...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 16:28:32', NULL, NULL, NULL);
INSERT INTO `question` VALUES ('a2548c08191c4ffba862302121b00626', 1, '《荆楚岁时记>云：。社日，四邻并结宗会社，宰牲牢，为屋于树下，先祭神，然后     食其胙。”据此可知，社日的民俗功能主要是', '《荆楚岁时记>云：。社日，四邻...', NULL, NULL, '联谊乡邻', '颂扬盛世', '缅怀先祖', '助危济困', NULL, NULL, NULL, '2021-01-20 19:38:50', NULL, NULL, NULL);
INSERT INTO `question` VALUES ('b0c6dfe2ad6b4774baad60232f1158db', 3, '材料      \n辽统治者耶律德光灭后晋后，入晋宫召集百官时，他“改服中国衣冠，百官起居皆 如旧制”，对群臣宣布“自今不修甲兵，不市战马，轻赋省役，天下太平矣”。并任命了 一批汉官主持汉地事务。\n根据材料概括耶律德光统治的特点。（6分）', '材料      \n辽统治者耶律...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 16:28:32', NULL, NULL, NULL);
INSERT INTO `question` VALUES ('be9b4fccc2fa4144a3da23fd53faa250', 3, '中外历史人物评说  材料      弗罗伦斯·南丁格尔( 1820 - 1910)，出生于英国上流社会家庭。19世纪40、50 年代，伦敦郊区贫民窟频繁发生霍乱等瘟疫，人们对于“医院”“护理”这样的字眼一 向避而不谈，因为都是一些很可怕、很丢脸的事情。医院几乎就是不幸、堕落，混乱的 代名词。由于缺少必要的管理，它有时就像疯人院。\n根据材料并结合所学知识，概括南丁格尔对现代医学的贡献。（7分）', '中外历史人物评说  材料   ...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 16:28:32', NULL, NULL, NULL);
INSERT INTO `question` VALUES ('c45ea2f782ab4ab39d67ef713b6c9264', 1, '公元前212年，秦始皇坑杀“术士”，长子扶苏劝谏说：“远方黔首未集，诸生皆诵     法孔子，今上皆重法绳之，臣恐天下不安，唯上察之”。这反映当时', '公元前212年，秦始皇坑杀“术...', NULL, NULL, '统一进程曲折', '地方治理不畅', '始皇灭儒崇法', '儒学影响较大', NULL, NULL, NULL, '2021-01-20 19:38:53', NULL, NULL, NULL);
INSERT INTO `question` VALUES ('cc7e7125df994a6ab4fef47c8f969db6', 1, '唐前期的政治人物多为北方人，北宋时政治人物多出生于江西、福建、苏南等地。     这一变化主要反映了', '唐前期的政治人物多为北方人，北...', NULL, NULL, '官僚集团重视本地域人才', '南北方士人志向差异', '科举制改变人才地域分布', '政治中心转移到南方', NULL, NULL, NULL, '2021-01-20 19:38:56', NULL, NULL, NULL);
INSERT INTO `question` VALUES ('d476c46e0e574253a95d44c53eacde73', 3, '中外历史人物评说  材料      弗罗伦斯·南丁格尔( 1820 - 1910)，出生于英国上流社会家庭。19世纪40、50 年代，伦敦郊区贫民窟频繁发生霍乱等瘟疫，人们对于“医院”“护理”这样的字眼一 向避而不谈，因为都是一些很可怕、很丢脸的事情。医院几乎就是不幸、堕落，混乱的 代名词。由于缺少必要的管理，它有时就像疯人院。\n根据材料并结合所学知识，指出南丁格尔投身护理事业的时代背景。（8分）', '中外历史人物评说  材料   ...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 16:28:32', NULL, NULL, NULL);
INSERT INTO `question` VALUES ('e029b3872404418bb8e3ebaf7939b58b', 3, '中外历史人物评说  材料      弗罗伦斯·南丁格尔( 1820 - 1910)，出生于英国上流社会家庭。19世纪40、50 年代，伦敦郊区贫民窟频繁发生霍乱等瘟疫，人们对于“医院”“护理”这样的字眼一 向避而不谈，因为都是一些很可怕、很丢脸的事情。医院几乎就是不幸、堕落，混乱的 代名词。由于缺少必要的管理，它有时就像疯人院。\n根据材料并结合所学知识，概括南丁格尔对现代医学的贡献。（7分）', '中外历史人物评说  材料   ...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 16:28:32', NULL, NULL, NULL);
INSERT INTO `question` VALUES ('fc41c02697004f179933aec14d6efd4c', 1, '《小雅·鹿鸣>本是西周贵族宣扬宴飨之仪的乐歌，后扩散到民间，在乡人宴会上     也可传唱。这表明西周时期', '《小雅·鹿鸣>本是西周贵族宣扬...', NULL, NULL, '周人生活较为富足', '礼乐文明得到广泛认同', '乡人社会地位提高', '贵族奢靡之风波及民间', NULL, NULL, NULL, '2021-01-20 19:39:01', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for question_answer
-- ----------------------------
DROP TABLE IF EXISTS `question_answer`;
CREATE TABLE `question_answer`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `question_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '问题id',
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '问题正确答案(如果是多选题包含分值分配方式)',
  `analysis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '问题解析',
  `score` decimal(20, 8) NULL DEFAULT NULL COMMENT '出题人设置的题目分值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_answer
-- ----------------------------
INSERT INTO `question_answer` VALUES ('1', '0eee5088a03d4501ab507e20d10daff4', '变化：圣人到凡人。（4分）    \n原因：林肯的出现促使人们以平常心来看待领袖人物；十九世纪中后期，美国民     主政治进一步发展，人们思想进一步解放。  （6分）', '变化：圣人到凡人。（4分）    \n原因：林肯的出现促使人们以平常心来看待领袖人物；十九世纪中后期，美国民     主政治进一步发展，人们思想进一步解放。  （6分）', 10.00000000);
INSERT INTO `question_answer` VALUES ('10', 'e029b3872404418bb8e3ebaf7939b58b', '开创了现代护理事业；提高了护理事业和护士的社会地位；改善了医院的管理。(7     分，答出两点给4分，答出三点给7分)', '开创了现代护理事业；提高了护理事业和护士的社会地位；改善了医院的管理。(7     分，答出两点给4分，答出三点给7分)', 7.00000000);
INSERT INTO `question_answer` VALUES ('11', 'fc41c02697004f179933aec14d6efd4c', 'B', NULL, 4.00000000);
INSERT INTO `question_answer` VALUES ('2', '7fb8a8ac6f16451ab416dcd2358da233', 'C', NULL, 4.00000000);
INSERT INTO `question_answer` VALUES ('3', '95c62e38f8ea434ab69d009231d1ae99', '工业革命期间，疾病流行；医疗卫生事业和人们观念落后；战争频繁。（8分，答     出两点给6分，答出三点给8分）', '工业革命期间，疾病流行；医疗卫生事业和人们观念落后；战争频繁。（8分，答     出两点给6分，答出三点给8分）', 8.00000000);
INSERT INTO `question_answer` VALUES ('4', 'a2548c08191c4ffba862302121b00626', 'C', NULL, 4.00000000);
INSERT INTO `question_answer` VALUES ('5', 'b0c6dfe2ad6b4774baad60232f1158db', '学习汉文化，重用汉官；轻徭薄赋；抑制地方割据。（6分）', '学习汉文化，重用汉官；轻徭薄赋；抑制地方割据。（6分）', 6.00000000);
INSERT INTO `question_answer` VALUES ('6', 'be9b4fccc2fa4144a3da23fd53faa250', '开创了现代护理事业；提高了护理事业和护士的社会地位；改善了医院的管理。(7     分，答出两点给4分，答出三点给7分)', '开创了现代护理事业；提高了护理事业和护士的社会地位；改善了医院的管理。(7     分，答出两点给4分，答出三点给7分)', 7.00000000);
INSERT INTO `question_answer` VALUES ('7', 'c45ea2f782ab4ab39d67ef713b6c9264', 'A', NULL, 4.00000000);
INSERT INTO `question_answer` VALUES ('8', 'cc7e7125df994a6ab4fef47c8f969db6', 'C', NULL, 4.00000000);
INSERT INTO `question_answer` VALUES ('9', 'd476c46e0e574253a95d44c53eacde73', '工业革命期间，疾病流行；医疗卫生事业和人们观念落后；战争频繁。（8分，答     出两点给6分，答出三点给8分）', '工业革命期间，疾病流行；医疗卫生事业和人们观念落后；战争频繁。（8分，答     出两点给6分，答出三点给8分）', 8.00000000);

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`  (
  `id` bigint(255) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '科目名称',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES (1, '历史', 1);
INSERT INTO `subject` VALUES (2, '地理', 2);
INSERT INTO `subject` VALUES (3, '政治', 3);

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`  (
  `branch_id` bigint(20) NOT NULL COMMENT 'branch transaction id',
  `xid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'global transaction id',
  `context` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'undo_log context,such as serialization',
  `rollback_info` longblob NOT NULL COMMENT 'rollback info',
  `log_status` int(11) NOT NULL COMMENT '0:normal status,1:defense status',
  `log_created` datetime(6) NOT NULL COMMENT 'create datetime',
  `log_modified` datetime(6) NOT NULL COMMENT 'modify datetime',
  UNIQUE INDEX `ux_undo_log`(`xid`, `branch_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'AT transaction mode undo table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of undo_log
-- ----------------------------

-- ----------------------------
-- View structure for exam_detail
-- ----------------------------
DROP VIEW IF EXISTS `exam_detail`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `exam_detail` AS select `uad`.`exam_id` AS `exam_id`,count(0) AS `peoples`,count(`pq`.`score`) AS `score`,(count(`uad`.`mark_score`) / count(0)) AS `mark_score` from ((`user_answer_detail` `uad` join `paper_question` `pq`) join `exam`) where ((`uad`.`exam_id` = convert(`exam`.`id` using utf8mb4)) and (`exam`.`paper_id` = `pq`.`paper_id`)) group by `uad`.`exam_id`;

-- ----------------------------
-- View structure for user_answer_detail
-- ----------------------------
DROP VIEW IF EXISTS `user_answer_detail`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `user_answer_detail` AS select `answer_question`.`exam_user_id` AS `exam_user_id`,`exam_user`.`user_id` AS `user_id`,`exam_user`.`exam_id` AS `exam_id`,`answer_question`.`answer` AS `user_answer`,`answer_question`.`mark_score` AS `mark_score`,`answer_question`.`question_id` AS `question_id`,`question_answer`.`answer` AS `answer`,`question_answer`.`analysis` AS `analysis`,`question_answer`.`score` AS `score`,`answer_question`.`answer_time` AS `answer_time` from ((`answer_question` join `question_answer`) join `exam_user`) where (convert(`answer_question`.`question_id` using utf8mb4) = `question_answer`.`question_id`);

SET FOREIGN_KEY_CHECKS = 1;
