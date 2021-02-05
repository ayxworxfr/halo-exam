/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : nacos

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 05/02/2021 10:30:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (3, 'halo-user-provider-dev.yaml', 'USER_PROVIDER_GROUP', 'config:\n    info: from nacos center, nacos-config-client-dev.yaml version=3', '003f2333843d314024c60ecf9f10ace5', '2021-01-28 22:10:12', '2021-01-30 05:54:31', NULL, '0:0:0:0:0:0:0:1', '', '', 'null', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (11, 'halo-user-provider-test.yaml', 'USER_PROVIDER_GROUP', 'config:\r\n    info: from nacos center, nacos-config-client-test.yaml version=2', 'b4a00a84ad00882973aa3a83ff5018be', '2021-01-30 05:57:40', '2021-01-30 05:57:40', NULL, '0:0:0:0:0:0:0:1', '', '', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (12, 'halo-user-provider-test.yaml', 'DEFAULT_GROUP', 'config:\r\n    info: from nacos center, nacos-config-client-test.yaml version=2', 'b4a00a84ad00882973aa3a83ff5018be', '2021-01-30 05:58:00', '2021-01-30 05:58:00', NULL, '0:0:0:0:0:0:0:1', '', '', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (13, 'halo-user-provider-dev.yaml', 'DEFAULT_GROUP', 'config:\r\n    info: from nacos center, nacos-config-client-dev.yaml version=2', '0e33126925cc574d5020450ad8959645', '2021-01-30 05:58:12', '2021-01-30 05:58:12', NULL, '0:0:0:0:0:0:0:1', '', '', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (14, 'halo-user-provider-dev.yaml', 'USER_PROVIDER_GROUP', 'config:\r\n    info: halo-user-provider-dev.yaml 3117a4f6-81ea-4af9-814f-fa0cb2e2305a USER_PROVIDER_GROUP halo-user-provider-dev.yaml version=1', '1d7e4e09f9be405828831850526a5edd', '2021-01-30 06:04:12', '2021-01-30 06:04:12', NULL, '0:0:0:0:0:0:0:1', '', '3117a4f6-81ea-4af9-814f-fa0cb2e2305a', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (15, 'halo-user-provider-dev.yaml', 'DEFAULT_GROUP', 'config:\r\n    info: halo-user-provider-dev.yaml 3117a4f6-81ea-4af9-814f-fa0cb2e2305a USER_PROVIDER_GROUP halo-user-provider-dev.yaml version=1', '1d7e4e09f9be405828831850526a5edd', '2021-01-30 06:06:21', '2021-01-30 06:06:21', NULL, '0:0:0:0:0:0:0:1', '', '3117a4f6-81ea-4af9-814f-fa0cb2e2305a', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (16, 'halo-user-feign-consumer', 'DEFAULT_GROUP', '[\n    {\n        \"resource\": \"/consumer/fallback\",\n        \"limitApp\": \"default\",\n        \"grade\": 1,\n        \"count\": 1,\n        \"strategy\": 0,\n        \"controlBehavior\": 0,\n        \"clusterMode\": false\n    }\n]', 'c814c37f607e0e0ab9a50e5c1d956172', '2021-02-02 11:13:47', '2021-02-02 11:18:45', NULL, '0:0:0:0:0:0:0:1', '', '', '', '', '', 'json', '');
INSERT INTO `config_info` VALUES (17, 'halo-user-provider', 'DEFAULT_GROUP', '[\r\n{\r\n  \"resource\": \"/rateLimit/byUrl\",\r\n  \"limitApp\": \"default\",\r\n  \"grade\": 1,\r\n  \"count\": 1,\r\n  \"strategy\": 0,\r\n  \"controlBehavior\": 0,\r\n  \"clusterMode\": false\r\n}\r\n]', '293515dccc410fa1ec5d8df027fd9289', '2021-02-02 11:17:15', '2021-02-02 11:17:15', NULL, '0:0:0:0:0:0:0:1', '', '', NULL, NULL, NULL, 'json', NULL);

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '增加租户字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_beta' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_tag' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id`, `tag_name`, `tag_type`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_tag_relation' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint(64) UNSIGNED NOT NULL,
  `nid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create`) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified`) USING BTREE,
  INDEX `idx_did`(`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (0, 1, 'halo-user-provider-dev.yml', 'USER_PROVIDER_GROUP', '', 'server:\r\n  port: 9001\r\n\r\nspring:\r\n  application:\r\n    name: halo-user-provider\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: localhost:8849 #??Nacos??\r\n    stream:\r\n      binders: #?????????rabbitmq?????\r\n        defaultRabbit: #??????????binding??\r\n          type: rabbit #??????\r\n          environment: #??rabbitmq???????\r\n            spring:\r\n              rabbitmq:\r\n                host: localhost\r\n                port: 5672\r\n                username: guest\r\n                password: guest\r\n      bindings: #???????\r\n        output: #????????????\r\n          destination: studyExchange #??????Exchange????\r\n          content-type: application/json #??????????json???????“text/plain”\r\n          binder: defaultRabbit #???????????????\r\n  datasource:\r\n    username: root\r\n    password: 123456\r\n    url: jdbc:mysql://localhost:3306/exam-auth?characterEncoding=utf-8&serverTimezone=GMT%2b8\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    type: com.alibaba.druid.pool.DruidDataSource\r\n    druid:\r\n      max-wait: 60000\r\n      initial-size: 5\r\n      min-idle: 5\r\n      max-active: 20\r\n\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n\r\n\r\n#pagehelper??????\r\npagehelper:\r\n  helperDialect: mysql\r\n  reasonable: true\r\n  supportMethodsArguments: true\r\n  params: count=countSql\r\n\r\nmybatis-plus:\r\n  configuration:\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\r\n  global-config:\r\n    banner: false\r\n    db-config:\r\n      id-type: auto', '3641f13dc0560111b70984ccc5d1b6d2', '2010-05-05 00:00:00', '2021-01-28 21:44:24', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (1, 2, 'halo-user-provider-dev.yml', 'USER_PROVIDER_GROUP', '', 'server:\r\n  port: 9001\r\n\r\nspring:\r\n  application:\r\n    name: halo-user-provider\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: localhost:8849 #??Nacos??\r\n    stream:\r\n      binders: #?????????rabbitmq?????\r\n        defaultRabbit: #??????????binding??\r\n          type: rabbit #??????\r\n          environment: #??rabbitmq???????\r\n            spring:\r\n              rabbitmq:\r\n                host: localhost\r\n                port: 5672\r\n                username: guest\r\n                password: guest\r\n      bindings: #???????\r\n        output: #????????????\r\n          destination: studyExchange #??????Exchange????\r\n          content-type: application/json #??????????json???????“text/plain”\r\n          binder: defaultRabbit #???????????????\r\n  datasource:\r\n    username: root\r\n    password: 123456\r\n    url: jdbc:mysql://localhost:3306/exam-auth?characterEncoding=utf-8&serverTimezone=GMT%2b8\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    type: com.alibaba.druid.pool.DruidDataSource\r\n    druid:\r\n      max-wait: 60000\r\n      initial-size: 5\r\n      min-idle: 5\r\n      max-active: 20\r\n\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n\r\n\r\n#pagehelper??????\r\npagehelper:\r\n  helperDialect: mysql\r\n  reasonable: true\r\n  supportMethodsArguments: true\r\n  params: count=countSql\r\n\r\nmybatis-plus:\r\n  configuration:\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\r\n  global-config:\r\n    banner: false\r\n    db-config:\r\n      id-type: auto', 'd5938908797b3a6ffa07c23e1f4aeba4', '2010-05-05 00:00:00', '2021-01-28 21:47:56', NULL, '0:0:0:0:0:0:0:1', 'D', '');
INSERT INTO `his_config_info` VALUES (0, 3, 'halo-user-provider-dev.yaml', 'USER_PROVIDER_GROUP', '', 'server:\r\n  port: 9001\r\n\r\nspring:\r\n  application:\r\n    name: halo-user-provider\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: localhost:8849 #??Nacos??\r\n    stream:\r\n      binders: #?????????rabbitmq?????\r\n        defaultRabbit: #??????????binding??\r\n          type: rabbit #??????\r\n          environment: #??rabbitmq???????\r\n            spring:\r\n              rabbitmq:\r\n                host: localhost\r\n                port: 5672\r\n                username: guest\r\n                password: guest\r\n      bindings: #???????\r\n        output: #????????????\r\n          destination: studyExchange #??????Exchange????\r\n          content-type: application/json #??????????json???????“text/plain”\r\n          binder: defaultRabbit #???????????????\r\n  datasource:\r\n    username: root\r\n    password: 123456\r\n    url: jdbc:mysql://localhost:3306/exam-auth?characterEncoding=utf-8&serverTimezone=GMT%2b8\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    type: com.alibaba.druid.pool.DruidDataSource\r\n    druid:\r\n      max-wait: 60000\r\n      initial-size: 5\r\n      min-idle: 5\r\n      max-active: 20\r\n\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n\r\n\r\n#pagehelper??????\r\npagehelper:\r\n  helperDialect: mysql\r\n  reasonable: true\r\n  supportMethodsArguments: true\r\n  params: count=countSql\r\n\r\nmybatis-plus:\r\n  configuration:\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\r\n  global-config:\r\n    banner: false\r\n    db-config:\r\n      id-type: auto', '3641f13dc0560111b70984ccc5d1b6d2', '2010-05-05 00:00:00', '2021-01-28 21:49:29', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (2, 4, 'halo-user-provider-dev.yaml', 'USER_PROVIDER_GROUP', '', 'server:\r\n  port: 9001\r\n\r\nspring:\r\n  application:\r\n    name: halo-user-provider\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: localhost:8849 #??Nacos??\r\n    stream:\r\n      binders: #?????????rabbitmq?????\r\n        defaultRabbit: #??????????binding??\r\n          type: rabbit #??????\r\n          environment: #??rabbitmq???????\r\n            spring:\r\n              rabbitmq:\r\n                host: localhost\r\n                port: 5672\r\n                username: guest\r\n                password: guest\r\n      bindings: #???????\r\n        output: #????????????\r\n          destination: studyExchange #??????Exchange????\r\n          content-type: application/json #??????????json???????“text/plain”\r\n          binder: defaultRabbit #???????????????\r\n  datasource:\r\n    username: root\r\n    password: 123456\r\n    url: jdbc:mysql://localhost:3306/exam-auth?characterEncoding=utf-8&serverTimezone=GMT%2b8\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    type: com.alibaba.druid.pool.DruidDataSource\r\n    druid:\r\n      max-wait: 60000\r\n      initial-size: 5\r\n      min-idle: 5\r\n      max-active: 20\r\n\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n\r\n\r\n#pagehelper??????\r\npagehelper:\r\n  helperDialect: mysql\r\n  reasonable: true\r\n  supportMethodsArguments: true\r\n  params: count=countSql\r\n\r\nmybatis-plus:\r\n  configuration:\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\r\n  global-config:\r\n    banner: false\r\n    db-config:\r\n      id-type: auto', 'd5938908797b3a6ffa07c23e1f4aeba4', '2010-05-05 00:00:00', '2021-01-28 22:08:13', NULL, '0:0:0:0:0:0:0:1', 'D', '');
INSERT INTO `his_config_info` VALUES (0, 5, 'halo-user-provider-dev.yaml', 'USER_PROVIDER_GROUP', '', 'config:\r\n    info from nacos center, nacos-config-client-dev.yaml version1', 'd3e6008de48bf9327cb4ff1418bae6c8', '2010-05-05 00:00:00', '2021-01-28 22:10:12', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (3, 6, 'halo-user-provider-dev.yaml', 'USER_PROVIDER_GROUP', '', 'config:\r\n    info from nacos center, nacos-config-client-dev.yaml version1', 'd3e6008de48bf9327cb4ff1418bae6c8', '2010-05-05 00:00:00', '2021-01-28 22:10:46', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (3, 7, 'halo-user-provider-dev.yaml', 'USER_PROVIDER_GROUP', '', 'config:\r\n    info: from nacos center, nacos-config-client-dev.yaml version1', 'a432bf2f730d38361aee58201aec22b1', '2010-05-05 00:00:00', '2021-01-29 14:43:23', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (3, 8, 'halo-user-provider-dev.yaml', 'USER_PROVIDER_GROUP', '', 'config:\r\n    info: from nacos center, nacos-config-client-dev.yaml version2', '7fd4252fd61b21c7463b9f580a8ea38d', '2010-05-05 00:00:00', '2021-01-29 14:47:49', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (3, 9, 'halo-user-provider-dev.yaml', 'USER_PROVIDER_GROUP', '', 'config:\r\n    info: from nacos center, nacos-config-client-dev.yaml version=2', '0e33126925cc574d5020450ad8959645', '2010-05-05 00:00:00', '2021-01-30 08:57:43', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (3, 10, 'halo-user-provider-dev.yaml', 'USER_PROVIDER_GROUP', '', 'config:\r\n    info: from nacos center, nacos-config-client-dev.yaml version=3', '09cb7d59f847c79e68d27f2539335575', '2010-05-05 00:00:00', '2021-01-30 03:33:47', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (3, 11, 'halo-user-provider-dev.yaml', 'USER_PROVIDER_GROUP', '', 'config:\n    info: from nacos center, nacos-config-client-dev.yaml version=4', '4a1d529fbc7c18fd1c9c56d041af2ef4', '2010-05-05 00:00:00', '2021-01-30 03:34:00', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (3, 12, 'halo-user-provider-dev.yaml', 'USER_PROVIDER_GROUP', '', 'config:\n    info: from nacos center, nacos-config-client-dev.yaml version=1', '7b193918885073ecdee63b2c53276a2c', '2010-05-05 00:00:00', '2021-01-30 03:36:05', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (0, 13, 'halo-user-provider-test.yml', 'USER_PROVIDER_GROUP', '', 'config:\r\n    info: from nacos center, nacos-config-client-test.yaml version=2', 'b4a00a84ad00882973aa3a83ff5018be', '2010-05-05 00:00:00', '2021-01-30 05:52:49', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 14, 'halo-user-provider-dev.yml', 'DEFAULT_GROUP', '', 'config:\r\n    info: from nacos center, nacos-config-client-dev.yaml version=2', '0e33126925cc574d5020450ad8959645', '2010-05-05 00:00:00', '2021-01-30 05:53:26', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 15, 'halo-user-provider-test.yml', 'DEFAULT_GROUP', '', 'config:\r\n    info: from nacos center, nacos-config-client-test.yaml version=2', 'b4a00a84ad00882973aa3a83ff5018be', '2010-05-05 00:00:00', '2021-01-30 05:53:38', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (6, 16, 'halo-user-provider-test.yml', 'DEFAULT_GROUP', '', 'config:\r\n    info: from nacos center, nacos-config-client-test.yaml version=2', 'b4a00a84ad00882973aa3a83ff5018be', '2010-05-05 00:00:00', '2021-01-30 05:53:50', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (5, 17, 'halo-user-provider-dev.yml', 'DEFAULT_GROUP', '', 'config:\r\n    info: from nacos center, nacos-config-client-dev.yaml version=2', '0e33126925cc574d5020450ad8959645', '2010-05-05 00:00:00', '2021-01-30 05:53:59', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (4, 18, 'halo-user-provider-test.yml', 'USER_PROVIDER_GROUP', '', 'config:\r\n    info: from nacos center, nacos-config-client-test.yaml version=2', 'b4a00a84ad00882973aa3a83ff5018be', '2010-05-05 00:00:00', '2021-01-30 05:54:11', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (3, 19, 'halo-user-provider-dev.yaml', 'USER_PROVIDER_GROUP', '', 'config:\n    info: from nacos center, nacos-config-client-dev.yaml version=2', 'bf1b74f6bb8f6121c1911011e027e02d', '2010-05-05 00:00:00', '2021-01-30 05:54:31', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (4, 20, 'halo-user-provider-test.yml', 'USER_PROVIDER_GROUP', '', 'config:\n    info: from nacos center, nacos-config-client-test.yaml version=2', '337dcbf2c66a2fc8ecf43569d8e4de0a', '2010-05-05 00:00:00', '2021-01-30 05:57:18', NULL, '0:0:0:0:0:0:0:1', 'D', '');
INSERT INTO `his_config_info` VALUES (0, 21, 'halo-user-provider-test.yaml', 'USER_PROVIDER_GROUP', '', 'config:\r\n    info: from nacos center, nacos-config-client-test.yaml version=2', 'b4a00a84ad00882973aa3a83ff5018be', '2010-05-05 00:00:00', '2021-01-30 05:57:40', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 22, 'halo-user-provider-test.yaml', 'DEFAULT_GROUP', '', 'config:\r\n    info: from nacos center, nacos-config-client-test.yaml version=2', 'b4a00a84ad00882973aa3a83ff5018be', '2010-05-05 00:00:00', '2021-01-30 05:58:00', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 23, 'halo-user-provider-dev.yaml', 'DEFAULT_GROUP', '', 'config:\r\n    info: from nacos center, nacos-config-client-dev.yaml version=2', '0e33126925cc574d5020450ad8959645', '2010-05-05 00:00:00', '2021-01-30 05:58:12', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (5, 24, 'halo-user-provider-dev.yml', 'DEFAULT_GROUP', '', 'config:\n    info: from nacos center, nacos-config-client-dev.yaml version=2', 'bf1b74f6bb8f6121c1911011e027e02d', '2010-05-05 00:00:00', '2021-01-30 05:59:25', NULL, '0:0:0:0:0:0:0:1', 'D', '');
INSERT INTO `his_config_info` VALUES (6, 25, 'halo-user-provider-test.yml', 'DEFAULT_GROUP', '', 'config:\n    info: from nacos center, nacos-config-client-test.yaml version=2', '337dcbf2c66a2fc8ecf43569d8e4de0a', '2010-05-05 00:00:00', '2021-01-30 05:59:29', NULL, '0:0:0:0:0:0:0:1', 'D', '');
INSERT INTO `his_config_info` VALUES (0, 26, 'halo-user-provider-dev.yaml', 'USER_PROVIDER_GROUP', '', 'config:\r\n    info: halo-user-provider-dev.yaml 3117a4f6-81ea-4af9-814f-fa0cb2e2305a USER_PROVIDER_GROUP halo-user-provider-dev.yaml version=1', '1d7e4e09f9be405828831850526a5edd', '2010-05-05 00:00:00', '2021-01-30 06:04:12', NULL, '0:0:0:0:0:0:0:1', 'I', '3117a4f6-81ea-4af9-814f-fa0cb2e2305a');
INSERT INTO `his_config_info` VALUES (0, 27, 'halo-user-provider-dev.yaml', 'DEFAULT_GROUP', '', 'config:\r\n    info: halo-user-provider-dev.yaml 3117a4f6-81ea-4af9-814f-fa0cb2e2305a USER_PROVIDER_GROUP halo-user-provider-dev.yaml version=1', '1d7e4e09f9be405828831850526a5edd', '2010-05-05 00:00:00', '2021-01-30 06:06:21', NULL, '0:0:0:0:0:0:0:1', 'I', '3117a4f6-81ea-4af9-814f-fa0cb2e2305a');
INSERT INTO `his_config_info` VALUES (0, 28, 'halo-user-feign-consumer', 'DEFAULT_GROUP', '', '[\r\n    {\r\n        \"resource\": \"/rateLimit/byUrl\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 1,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]', '981929e63f6ef8995eec392d77ce0d5a', '2010-05-05 00:00:00', '2021-02-02 11:13:47', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 29, 'halo-user-provider', 'DEFAULT_GROUP', '', '[\r\n{\r\n  \"resource\": \"/rateLimit/byUrl\",\r\n  \"limitApp\": \"default\",\r\n  \"grade\": 1,\r\n  \"count\": 1,\r\n  \"strategy\": 0,\r\n  \"controlBehavior\": 0,\r\n  \"clusterMode\": false\r\n}\r\n]', '293515dccc410fa1ec5d8df027fd9289', '2010-05-05 00:00:00', '2021-02-02 11:17:15', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (16, 30, 'halo-user-feign-consumer', 'DEFAULT_GROUP', '', '[\r\n    {\r\n        \"resource\": \"/rateLimit/byUrl\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 1,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]', '981929e63f6ef8995eec392d77ce0d5a', '2010-05-05 00:00:00', '2021-02-02 11:18:45', NULL, '0:0:0:0:0:0:0:1', 'U', '');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');
INSERT INTO `roles` VALUES ('admin', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '租户容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp`, `tenant_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'tenant_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
INSERT INTO `tenant_info` VALUES (1, '1', '3117a4f6-81ea-4af9-814f-fa0cb2e2305a', 'dev', 'dev命名空间', 'nacos', 1611986335826, 1611986335826);
INSERT INTO `tenant_info` VALUES (2, '1', '73e0b7a1-be8c-4943-8508-3150976dfc23', 'test', 'test命名空间', 'nacos', 1611986346073, 1611986346073);
INSERT INTO `tenant_info` VALUES (3, '1', 'seata_namespace_id', 'seata', 'seata配置', 'nacos', 1612319483259, 1612319483259);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('admin', '$2a$10$4/i3hmJMqWrZAShT1M4gI.DS7se/GsFeYEjFYn9nl5REmwWBa8eOa', 1);
INSERT INTO `users` VALUES ('nacos', '$2a$10$WPHXUTUwWdQElFXAccVZeeSpgjXXE8oS.7Izx..D8D7cPp4tZuQO2', 1);
INSERT INTO `users` VALUES ('nacos2', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;
