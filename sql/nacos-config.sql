/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : nacos-config

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 05/02/2021 19:18:39
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
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (14, 'halo-user-provider-dev.yaml', 'USER_PROVIDER_GROUP', 'config:\r\n    info: halo-user-provider-dev.yaml 3117a4f6-81ea-4af9-814f-fa0cb2e2305a USER_PROVIDER_GROUP halo-user-provider-dev.yaml version=1', '1d7e4e09f9be405828831850526a5edd', '2021-01-30 06:04:12', '2021-01-30 06:04:12', NULL, '0:0:0:0:0:0:0:1', '', '3117a4f6-81ea-4af9-814f-fa0cb2e2305a', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (15, 'halo-user-provider-dev.yaml', 'DEFAULT_GROUP', 'config:\r\n    info: halo-user-provider-dev.yaml 3117a4f6-81ea-4af9-814f-fa0cb2e2305a USER_PROVIDER_GROUP halo-user-provider-dev.yaml version=1', '1d7e4e09f9be405828831850526a5edd', '2021-01-30 06:06:21', '2021-01-30 06:06:21', NULL, '0:0:0:0:0:0:0:1', '', '3117a4f6-81ea-4af9-814f-fa0cb2e2305a', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (18, 'halo-admin', 'DEFAULT_GROUP', '# halo-admin\nspring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/halo-exam-auth?zeroDateTimeBehavior=convertToNull&useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai&autoReconnect=true\n    username: root\n    password: 123456\n  redis:\n    database: 0\n    host: localhost\n    port: 6379\n    password: \nmybatis-plus:\n  global-config:\n    banner: false\n  configuration:\n    # 驼峰下划线转换\n    map-underscore-to-camel-case: true\n    # 这个配置会将执行的sql打印出来，在开发或测试的时候可以用\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\nminio:\n  endpoint: http://101.37.69.49:9000/\n  access-key: minioadmin\n  secret-key: minioadmin', 'd758da01f372e77a088c80145c0a3139', '2021-02-05 02:33:09', '2021-02-05 07:31:50', NULL, '0:0:0:0:0:0:0:1', '', '', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (19, 'halo-auth', 'DEFAULT_GROUP', '# halo-auth\nspring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/halo-exam-auth?zeroDateTimeBehavior=convertToNull&useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai&autoReconnect=true\n    username: root\n    password: 123456\n  redis:\n    database: 0\n    host: localhost\n    port: 6379\n    password: \nfeign:\n  httpclient:\n    enabled: false\n  okhttp:\n    enabled: true\nmybatis-plus:\n  global-config:\n    banner: false\n  configuration:\n    # 驼峰下划线转换\n    map-underscore-to-camel-case: true\n    # 这个配置会将执行的sql打印出来，在开发或测试的时候可以用\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl', '25c40e651acf25099e9ee91256734680', '2021-02-05 02:33:57', '2021-02-05 07:32:02', NULL, '0:0:0:0:0:0:0:1', '', '', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (20, 'halo-gateway', 'DEFAULT_GROUP', '# halo-gateway\nspring:\n  security:\n    oauth2:\n      resourceserver:\n        jwt:\n          jwk-set-uri: \'http://localhost:8000/getPublicKey\'\n  redis:\n    database: 0\n    host: localhost\n    port: 6379\n    password: \n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true # 启用服务发现\n          lower-case-service-id: true\n      routes:\n        - id: halo-auth\n          uri: lb://halo-auth\n          predicates:\n            - Path=/halo-auth/**\n          filters:\n            - StripPrefix=1\n        - id: halo-admin\n          uri: lb://halo-admin\n          predicates:\n            - Path=/halo-admin/**\n          filters:\n            - StripPrefix=1\n        - id: halo-question\n          uri: lb://halo-question\n          predicates:\n            - Path=/halo-question/**\n          filters:\n            - StripPrefix=1\n        - id: halo-examination\n          uri: lb://halo-examination\n          predicates:\n            - Path=/halo-examination/**\n          filters:\n            - StripPrefix=1\n\n# 配置白名单路径(无需登录)\nwhitelist:\n  urls:\n      - \"/halo-auth/oauth/token\"\n\n# 是否演示环境\ndemo: false', '65f425a70d95ab84a91e0ff8a5fc7da3', '2021-02-05 02:34:28', '2021-02-05 09:26:54', NULL, '0:0:0:0:0:0:0:1', '', '', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (21, 'halo-examination', 'DEFAULT_GROUP', '# halo-examination\nspring:\n  zipkin:\n    base-url: http://localhost:9411\n  sleuth:\n    sampler:\n      # 采样率值介于0到1之间, 1则表示全部采集\n      probability: 1\n  cloud:\n    stream:\n      binders: #在此处配置要绑定的rabbitmq的服务信息\n        defaultRabbit: #表示定义的名称，用于binding整合\n          type: rabbit #消息组件类型\n          environment: #设置rabbitmq的相关环境配置\n            spring:\n              rabbitmq:\n                host: localhost\n                port: 5672\n                username: guest\n                password: guest\n      bindings: #服务的整合处理\n        output: #这个名字是一个通道的名称\n          destination: examExchange #表示要使用的Exchange名称定义\n          content-type: application/json #设置消息类型，本次为json，本文要设置为“text/plain”\n          binder: defaultRabbit #设置要绑定的消息服务的具体设置\n    sentinel:\n      transport:\n        #配置Sentinel dashboard地址\n        dashboard: localhost:8080\n        # 默认8719端口，假如被占用了会自动从8719端口+1进行扫描，直到找到未被占用的 端口\n        port: 8719\n      datasource:\n        ds1:\n          nacos:\n            server-addr: localhost:8848\n            dataId: halo-user-provider\n            groupId: DEFAULT_GROUP\n            data-type: json\n            rule-type: flow\n    \n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/halo-exam?zeroDateTimeBehavior=convertToNull&useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai&autoReconnect=true\n    username: root\n    password: 123456\n\nmybatis-plus:\n  global-config:\n    banner: false\n  configuration:\n    # 驼峰下划线转换\n    map-underscore-to-camel-case: true\n    # 这个配置会将执行的sql打印出来，在开发或测试的时候可以用\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl', '1f9fcef99886911144b01d201a88131e', '2021-02-05 07:29:12', '2021-02-05 10:41:13', NULL, '0:0:0:0:0:0:0:1', '', '', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (25, 'halo-question', 'DEFAULT_GROUP', '# halo-question\nspring:\n  zipkin:\n    base-url: http://localhost:9411\n  sleuth:\n    sampler:\n      # 采样率值介于0到1之间, 1则表示全部采集\n      probability: 1\n  cloud:\n    stream:\n      binders: #在此处配置要绑定的rabbitmq的服务信息\n        defaultRabbit: #表示定义的名称，用于binding整合\n          type: rabbit #消息组件类型\n          environment: #设置rabbitmq的相关环境配置\n            spring:\n              rabbitmq:\n                host: localhost\n                port: 5672\n                username: guest\n                password: guest\n      bindings: #服务的整合处理\n        input: #这个名字是一个通道的名称\n          destination: examExchange #表示要使用的Exchange名称定义\n          content-type: application/json #设置消息类型，本次为json，本文要设置为“text/plain”\n          binder: defaultRabbit #设置要绑定的消息服务的具体设置\n          group: evildoerA      # 添加分组后自动持久化(让多个消费者处于相同分组竞争关系, 可以解决重复消费问题)\n    sentinel:\n      transport:\n        #配置Sentinel dashboard地址\n        dashboard: localhost:8080\n        # 默认8719端口，假如被占用了会自动从8719端口+1进行扫描，直到找到未被占用的 端口\n        port: 8719\n      datasource:\n        ds1:\n          nacos:\n            server-addr: localhost:8848\n            dataId: halo-user-provider\n            groupId: DEFAULT_GROUP\n            data-type: json\n            rule-type: flow\n\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/halo-exam?zeroDateTimeBehavior=convertToNull&useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai&autoReconnect=true\n    username: root\n    password: 123456\nmybatis-plus:\n  global-config:\n    banner: false\n  configuration:\n    # 驼峰下划线转换\n    map-underscore-to-camel-case: true\n    # 这个配置会将执行的sql打印出来，在开发或测试的时候可以用\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl', '35d843f344dfaa9536812c1c1f11ac74', '2021-02-05 07:47:36', '2021-02-05 11:14:32', NULL, '0:0:0:0:0:0:0:1', '', '', '', '', '', 'yaml', '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

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
INSERT INTO `his_config_info` VALUES (3, 31, 'halo-user-provider-dev.yaml', 'USER_PROVIDER_GROUP', '', 'config:\n    info: from nacos center, nacos-config-client-dev.yaml version=3', '003f2333843d314024c60ecf9f10ace5', '2010-05-05 00:00:00', '2021-02-05 02:31:38', NULL, '127.0.0.1', 'D', '');
INSERT INTO `his_config_info` VALUES (11, 32, 'halo-user-provider-test.yaml', 'USER_PROVIDER_GROUP', '', 'config:\r\n    info: from nacos center, nacos-config-client-test.yaml version=2', 'b4a00a84ad00882973aa3a83ff5018be', '2010-05-05 00:00:00', '2021-02-05 02:31:42', NULL, '127.0.0.1', 'D', '');
INSERT INTO `his_config_info` VALUES (12, 33, 'halo-user-provider-test.yaml', 'DEFAULT_GROUP', '', 'config:\r\n    info: from nacos center, nacos-config-client-test.yaml version=2', 'b4a00a84ad00882973aa3a83ff5018be', '2010-05-05 00:00:00', '2021-02-05 02:31:46', NULL, '127.0.0.1', 'D', '');
INSERT INTO `his_config_info` VALUES (13, 34, 'halo-user-provider-dev.yaml', 'DEFAULT_GROUP', '', 'config:\r\n    info: from nacos center, nacos-config-client-dev.yaml version=2', '0e33126925cc574d5020450ad8959645', '2010-05-05 00:00:00', '2021-02-05 02:31:49', NULL, '127.0.0.1', 'D', '');
INSERT INTO `his_config_info` VALUES (16, 35, 'halo-user-feign-consumer', 'DEFAULT_GROUP', '', '[\n    {\n        \"resource\": \"/consumer/fallback\",\n        \"limitApp\": \"default\",\n        \"grade\": 1,\n        \"count\": 1,\n        \"strategy\": 0,\n        \"controlBehavior\": 0,\n        \"clusterMode\": false\n    }\n]', 'c814c37f607e0e0ab9a50e5c1d956172', '2010-05-05 00:00:00', '2021-02-05 02:31:54', NULL, '127.0.0.1', 'D', '');
INSERT INTO `his_config_info` VALUES (17, 36, 'halo-user-provider', 'DEFAULT_GROUP', '', '[\r\n{\r\n  \"resource\": \"/rateLimit/byUrl\",\r\n  \"limitApp\": \"default\",\r\n  \"grade\": 1,\r\n  \"count\": 1,\r\n  \"strategy\": 0,\r\n  \"controlBehavior\": 0,\r\n  \"clusterMode\": false\r\n}\r\n]', '293515dccc410fa1ec5d8df027fd9289', '2010-05-05 00:00:00', '2021-02-05 02:31:57', NULL, '127.0.0.1', 'D', '');
INSERT INTO `his_config_info` VALUES (0, 37, 'halo-admin', 'DEFAULT_GROUP', '', '# halo-admin\r\nspring:\r\n  datasource:\r\n    type: com.alibaba.druid.pool.DruidDataSource\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3306/halo-exam-auth?zeroDateTimeBehavior=convertToNull&useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai&autoReconnect=true\r\n    username: root\r\n    password: 123456\r\n  redis:\r\n    database: 0\r\n    host: localhost\r\n    port: 6379\r\n    password: \r\nmybatis-plus:\r\n  configuration:\r\n    # 驼峰下划线转换\r\n    map-underscore-to-camel-case: true\r\n    # 这个配置会将执行的sql打印出来，在开发或测试的时候可以用\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\r\nminio:\r\n  endpoint: http://101.37.69.49:9000/\r\n  access-key: minioadmin\r\n  secret-key: minioadmin', '066aa4d9a69cd5e6fb72450f47b5423a', '2010-05-05 00:00:00', '2021-02-05 02:33:09', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 38, 'halo-auth', 'DEFAULT_GROUP', '', '# halo-auth\r\nspring:\r\n  datasource:\r\n    type: com.alibaba.druid.pool.DruidDataSource\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3306/halo-exam-auth?zeroDateTimeBehavior=convertToNull&useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai&autoReconnect=true\r\n    username: root\r\n    password: 123456\r\n  redis:\r\n    database: 0\r\n    host: localhost\r\n    port: 6379\r\n    password: \r\nfeign:\r\n  httpclient:\r\n    enabled: false\r\n  okhttp:\r\n    enabled: true\r\nmybatis-plus:\r\n  configuration:\r\n    # 驼峰下划线转换\r\n    map-underscore-to-camel-case: true\r\n    # 这个配置会将执行的sql打印出来，在开发或测试的时候可以用\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl', '2169cb252175f39f5596978fa27437e4', '2010-05-05 00:00:00', '2021-02-05 02:33:57', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 39, 'halo-gateway', 'DEFAULT_GROUP', '', '# halo-gateway\r\nspring:\r\n  security:\r\n    oauth2:\r\n      resourceserver:\r\n        jwt:\r\n          jwk-set-uri: \'http://localhost:8000/getPublicKey\'\r\n  redis:\r\n    database: 0\r\n    host: localhost\r\n    port: 6379\r\n    password: \r\n  cloud:\r\n    gateway:\r\n      discovery:\r\n        locator:\r\n          enabled: true # 启用服务发现\r\n          lower-case-service-id: true\r\n      routes:\r\n        - id: halo-auth\r\n          uri: lb://halo-auth\r\n          predicates:\r\n            - Path=/halo-auth/**\r\n          filters:\r\n            - StripPrefix=1\r\n        - id: halo-admin\r\n          uri: lb://halo-admin\r\n          predicates:\r\n            - Path=/halo-admin/**\r\n          filters:\r\n            - StripPrefix=1\r\n        - id: mall-oms\r\n          uri: lb://mall-oms\r\n          predicates:\r\n            - Path=/mall-oms/**\r\n          filters:\r\n            - StripPrefix=1\r\n        - id: mall-pms\r\n          uri: lb://mall-pms\r\n          predicates:\r\n            - Path=/mall-pms/**\r\n          filters:\r\n            - StripPrefix=1\r\n        - id: mall-ums\r\n          uri: lb://mall-ums\r\n          predicates:\r\n            - Path=/mall-ums/**\r\n          filters:\r\n            - StripPrefix=1\r\n        - id: mall-sms\r\n          uri: lb://mall-sms\r\n          predicates:\r\n            - Path=/mall-sms/**\r\n          filters:\r\n            - StripPrefix=1\r\n\r\n# 配置白名单路径(无需登录)\r\nwhitelist:\r\n  urls:\r\n      - \"/halo-auth/oauth/token\"\r\n\r\n# 是否演示环境\r\ndemo: false', '66395955850be438ec91bd494f7ad39a', '2010-05-05 00:00:00', '2021-02-05 02:34:28', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 40, 'halo-examination', 'DEFAULT_GROUP', '', '# halo-examination\r\nspring:\r\n  datasource:\r\n    type: com.alibaba.druid.pool.DruidDataSource\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3306/halo-exam?zeroDateTimeBehavior=convertToNull&useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai&autoReconnect=true\r\n    username: root\r\n    password: 123456\r\nmybatis-plus:\r\n  configuration:\r\n    # 驼峰下划线转换\r\n    map-underscore-to-camel-case: true\r\n    # 这个配置会将执行的sql打印出来，在开发或测试的时候可以用\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl', 'c3435825fdd241195a4c62fdd763a8e6', '2010-05-05 00:00:00', '2021-02-05 07:29:12', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (18, 41, 'halo-admin', 'DEFAULT_GROUP', '', '# halo-admin\r\nspring:\r\n  datasource:\r\n    type: com.alibaba.druid.pool.DruidDataSource\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3306/halo-exam-auth?zeroDateTimeBehavior=convertToNull&useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai&autoReconnect=true\r\n    username: root\r\n    password: 123456\r\n  redis:\r\n    database: 0\r\n    host: localhost\r\n    port: 6379\r\n    password: \r\nmybatis-plus:\r\n  configuration:\r\n    # 驼峰下划线转换\r\n    map-underscore-to-camel-case: true\r\n    # 这个配置会将执行的sql打印出来，在开发或测试的时候可以用\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\r\nminio:\r\n  endpoint: http://101.37.69.49:9000/\r\n  access-key: minioadmin\r\n  secret-key: minioadmin', '066aa4d9a69cd5e6fb72450f47b5423a', '2010-05-05 00:00:00', '2021-02-05 07:31:50', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (19, 42, 'halo-auth', 'DEFAULT_GROUP', '', '# halo-auth\r\nspring:\r\n  datasource:\r\n    type: com.alibaba.druid.pool.DruidDataSource\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3306/halo-exam-auth?zeroDateTimeBehavior=convertToNull&useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai&autoReconnect=true\r\n    username: root\r\n    password: 123456\r\n  redis:\r\n    database: 0\r\n    host: localhost\r\n    port: 6379\r\n    password: \r\nfeign:\r\n  httpclient:\r\n    enabled: false\r\n  okhttp:\r\n    enabled: true\r\nmybatis-plus:\r\n  configuration:\r\n    # 驼峰下划线转换\r\n    map-underscore-to-camel-case: true\r\n    # 这个配置会将执行的sql打印出来，在开发或测试的时候可以用\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl', '2169cb252175f39f5596978fa27437e4', '2010-05-05 00:00:00', '2021-02-05 07:32:02', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (21, 43, 'halo-examination', 'DEFAULT_GROUP', '', '# halo-examination\r\nspring:\r\n  datasource:\r\n    type: com.alibaba.druid.pool.DruidDataSource\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3306/halo-exam?zeroDateTimeBehavior=convertToNull&useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai&autoReconnect=true\r\n    username: root\r\n    password: 123456\r\nmybatis-plus:\r\n  configuration:\r\n    # 驼峰下划线转换\r\n    map-underscore-to-camel-case: true\r\n    # 这个配置会将执行的sql打印出来，在开发或测试的时候可以用\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl', 'c3435825fdd241195a4c62fdd763a8e6', '2010-05-05 00:00:00', '2021-02-05 07:32:25', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (0, 44, 'halo-question', 'DEFAULT_GROUP', '', '# halo-question\r\nspring:\r\n  datasource:\r\n    type: com.alibaba.druid.pool.DruidDataSource\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3306/halo-exam?zeroDateTimeBehavior=convertToNull&useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai&autoReconnect=true\r\n    username: root\r\n    password: 123456\r\nmybatis-plus:\r\n  global-config:\r\n    banner: false\r\n  configuration:\r\n    # 驼峰下划线转换\r\n    map-underscore-to-camel-case: true\r\n    # 这个配置会将执行的sql打印出来，在开发或测试的时候可以用\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl', 'e57b370fd010e8a2b03472d359692618', '2010-05-05 00:00:00', '2021-02-05 07:47:36', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (20, 45, 'halo-gateway', 'DEFAULT_GROUP', '', '# halo-gateway\r\nspring:\r\n  security:\r\n    oauth2:\r\n      resourceserver:\r\n        jwt:\r\n          jwk-set-uri: \'http://localhost:8000/getPublicKey\'\r\n  redis:\r\n    database: 0\r\n    host: localhost\r\n    port: 6379\r\n    password: \r\n  cloud:\r\n    gateway:\r\n      discovery:\r\n        locator:\r\n          enabled: true # 启用服务发现\r\n          lower-case-service-id: true\r\n      routes:\r\n        - id: halo-auth\r\n          uri: lb://halo-auth\r\n          predicates:\r\n            - Path=/halo-auth/**\r\n          filters:\r\n            - StripPrefix=1\r\n        - id: halo-admin\r\n          uri: lb://halo-admin\r\n          predicates:\r\n            - Path=/halo-admin/**\r\n          filters:\r\n            - StripPrefix=1\r\n        - id: mall-oms\r\n          uri: lb://mall-oms\r\n          predicates:\r\n            - Path=/mall-oms/**\r\n          filters:\r\n            - StripPrefix=1\r\n        - id: mall-pms\r\n          uri: lb://mall-pms\r\n          predicates:\r\n            - Path=/mall-pms/**\r\n          filters:\r\n            - StripPrefix=1\r\n        - id: mall-ums\r\n          uri: lb://mall-ums\r\n          predicates:\r\n            - Path=/mall-ums/**\r\n          filters:\r\n            - StripPrefix=1\r\n        - id: mall-sms\r\n          uri: lb://mall-sms\r\n          predicates:\r\n            - Path=/mall-sms/**\r\n          filters:\r\n            - StripPrefix=1\r\n\r\n# 配置白名单路径(无需登录)\r\nwhitelist:\r\n  urls:\r\n      - \"/halo-auth/oauth/token\"\r\n\r\n# 是否演示环境\r\ndemo: false', '66395955850be438ec91bd494f7ad39a', '2010-05-05 00:00:00', '2021-02-05 09:26:54', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (21, 46, 'halo-examination', 'DEFAULT_GROUP', '', '# halo-examination\nspring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/halo-exam?zeroDateTimeBehavior=convertToNull&useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai&autoReconnect=true\n    username: root\n    password: 123456\nmybatis-plus:\n  global-config:\n    banner: false\n  configuration:\n    # 驼峰下划线转换\n    map-underscore-to-camel-case: true\n    # 这个配置会将执行的sql打印出来，在开发或测试的时候可以用\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl', '15c1ded6ec1a947090f72bac4dc7bc0e', '2010-05-05 00:00:00', '2021-02-05 10:37:05', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (25, 47, 'halo-question', 'DEFAULT_GROUP', '', '# halo-question\r\nspring:\r\n  datasource:\r\n    type: com.alibaba.druid.pool.DruidDataSource\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3306/halo-exam?zeroDateTimeBehavior=convertToNull&useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai&autoReconnect=true\r\n    username: root\r\n    password: 123456\r\nmybatis-plus:\r\n  global-config:\r\n    banner: false\r\n  configuration:\r\n    # 驼峰下划线转换\r\n    map-underscore-to-camel-case: true\r\n    # 这个配置会将执行的sql打印出来，在开发或测试的时候可以用\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl', 'e57b370fd010e8a2b03472d359692618', '2010-05-05 00:00:00', '2021-02-05 10:40:53', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (21, 48, 'halo-examination', 'DEFAULT_GROUP', '', '# halo-examination\nspring:\n  zipkin:\n    base-url: http://localhost:9411\n  sleuth:\n    sampler:\n      # 采样率值介于0到1之间, 1则表示全部采集\n      probability: 1\n  cloud:\n    stream:\n      binders: #在此处配置要绑定的rabbitmq的服务信息\n        defaultRabbit: #表示定义的名称，用于binding整合\n          type: rabbit #消息组件类型\n          environment: #设置rabbitmq的相关环境配置\n            spring:\n              rabbitmq:\n                host: localhost\n                port: 5672\n                username: guest\n                password: guest\n      bindings: #服务的整合处理\n        output: #这个名字是一个通道的名称\n          destination: studyExchange #表示要使用的Exchange名称定义\n          content-type: application/json #设置消息类型，本次为json，本文要设置为“text/plain”\n          binder: defaultRabbit #设置要绑定的消息服务的具体设置\n    sentinel:\n      transport:\n        #配置Sentinel dashboard地址\n        dashboard: localhost:8080\n        # 默认8719端口，假如被占用了会自动从8719端口+1进行扫描，直到找到未被占用的 端口\n        port: 8719\n      datasource:\n        ds1:\n          nacos:\n            server-addr: localhost:8848\n            dataId: halo-user-provider\n            groupId: DEFAULT_GROUP\n            data-type: json\n            rule-type: flow\n    \n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/halo-exam?zeroDateTimeBehavior=convertToNull&useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai&autoReconnect=true\n    username: root\n    password: 123456\n\nmybatis-plus:\n  global-config:\n    banner: false\n  configuration:\n    # 驼峰下划线转换\n    map-underscore-to-camel-case: true\n    # 这个配置会将执行的sql打印出来，在开发或测试的时候可以用\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl', '1953668415ed46d398ed6c7580f67182', '2010-05-05 00:00:00', '2021-02-05 10:41:13', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (25, 49, 'halo-question', 'DEFAULT_GROUP', '', '# halo-question\nspring:\n  zipkin:\n    base-url: http://localhost:9411\n  sleuth:\n    sampler:\n      # 采样率值介于0到1之间, 1则表示全部采集\n      probability: 1\n  cloud:\n    stream:\n      binders: #在此处配置要绑定的rabbitmq的服务信息\n        defaultRabbit: #表示定义的名称，用于binding整合\n          type: rabbit #消息组件类型\n          environment: #设置rabbitmq的相关环境配置\n            spring:\n              rabbitmq:\n                host: localhost\n                port: 5672\n                username: guest\n                password: guest\n      bindings: #服务的整合处理\n        output: #这个名字是一个通道的名称\n          destination: examExchange #表示要使用的Exchange名称定义\n          content-type: application/json #设置消息类型，本次为json，本文要设置为“text/plain”\n          binder: defaultRabbit #设置要绑定的消息服务的具体设置\n    sentinel:\n      transport:\n        #配置Sentinel dashboard地址\n        dashboard: localhost:8080\n        # 默认8719端口，假如被占用了会自动从8719端口+1进行扫描，直到找到未被占用的 端口\n        port: 8719\n      datasource:\n        ds1:\n          nacos:\n            server-addr: localhost:8848\n            dataId: halo-user-provider\n            groupId: DEFAULT_GROUP\n            data-type: json\n            rule-type: flow\n\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/halo-exam?zeroDateTimeBehavior=convertToNull&useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai&autoReconnect=true\n    username: root\n    password: 123456\nmybatis-plus:\n  global-config:\n    banner: false\n  configuration:\n    # 驼峰下划线转换\n    map-underscore-to-camel-case: true\n    # 这个配置会将执行的sql打印出来，在开发或测试的时候可以用\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl', '013f7d85b290599aa1f9f0c0a7c1f8cf', '2010-05-05 00:00:00', '2021-02-05 11:07:46', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (25, 50, 'halo-question', 'DEFAULT_GROUP', '', '# halo-question\nspring:\n  zipkin:\n    base-url: http://localhost:9411\n  sleuth:\n    sampler:\n      # 采样率值介于0到1之间, 1则表示全部采集\n      probability: 1\n  cloud:\n    stream:\n      binders: #在此处配置要绑定的rabbitmq的服务信息\n        defaultRabbit: #表示定义的名称，用于binding整合\n          type: rabbit #消息组件类型\n          environment: #设置rabbitmq的相关环境配置\n            spring:\n              rabbitmq:\n                host: localhost\n                port: 5672\n                username: guest\n                password: guest\n      bindings: #服务的整合处理\n        input: #这个名字是一个通道的名称\n          destination: examExchange #表示要使用的Exchange名称定义\n          content-type: application/json #设置消息类型，本次为json，本文要设置为“text/plain”\n          binder: defaultRabbit #设置要绑定的消息服务的具体设置\n          group: evildoerA      # 添加分组后自动持久化(让多个消费者处于相同分组竞争关系, 可以解决重复消费问题)\n    sentinel:\n      transport:\n        #配置Sentinel dashboard地址\n        dashboard: localhost:8080\n        # 默认8719端口，假如被占用了会自动从8719端口+1进行扫描，直到找到未被占用的 端口\n        port: 8719\n      datasource:\n        ds1:\n          nacos:\n            server-addr: localhost:8848\n            dataId: halo-user-provider\n            groupId: DEFAULT_GROUP\n            data-type: json\n            rule-type: flow\n\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/halo-exam?zeroDateTimeBehavior=convertToNull&useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai&autoReconnect=true\n    username: root\n    password: 123456\nmybatis-plus:\n  global-config:\n    banner: false\n  configuration:\n    # 驼峰下划线转换\n    map-underscore-to-camel-case: true\n    # 这个配置会将执行的sql打印出来，在开发或测试的时候可以用\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl', '35d843f344dfaa9536812c1c1f11ac74', '2010-05-05 00:00:00', '2021-02-05 11:10:17', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (25, 51, 'halo-question', 'DEFAULT_GROUP', '', '# halo-question\nspring:\n  zipkin:\n    base-url: http://localhost:9411\n  sleuth:\n    sampler:\n      # 采样率值介于0到1之间, 1则表示全部采集\n      probability: 1\n  cloud:\n    stream:\n      binders: #在此处配置要绑定的rabbitmq的服务信息\n        defaultRabbit: #表示定义的名称，用于binding整合\n          type: rabbit #消息组件类型\n          environment: #设置rabbitmq的相关环境配置\n            spring:\n              rabbitmq:\n                host: localhost\n                port: 5672\n                username: guest\n                password: guest\n      bindings: #服务的整合处理\n        input: #这个名字是一个通道的名称\n          destination: eexamExchange #表示要使用的Exchange名称定义\n          content-type: application/json #设置消息类型，本次为json，本文要设置为“text/plain”\n          binder: defaultRabbit #设置要绑定的消息服务的具体设置\n          group: evildoerA      # 添加分组后自动持久化(让多个消费者处于相同分组竞争关系, 可以解决重复消费问题)\n    sentinel:\n      transport:\n        #配置Sentinel dashboard地址\n        dashboard: localhost:8080\n        # 默认8719端口，假如被占用了会自动从8719端口+1进行扫描，直到找到未被占用的 端口\n        port: 8719\n      datasource:\n        ds1:\n          nacos:\n            server-addr: localhost:8848\n            dataId: halo-user-provider\n            groupId: DEFAULT_GROUP\n            data-type: json\n            rule-type: flow\n\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/halo-exam?zeroDateTimeBehavior=convertToNull&useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai&autoReconnect=true\n    username: root\n    password: 123456\nmybatis-plus:\n  global-config:\n    banner: false\n  configuration:\n    # 驼峰下划线转换\n    map-underscore-to-camel-case: true\n    # 这个配置会将执行的sql打印出来，在开发或测试的时候可以用\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl', 'da2c2bfe7394c469c04cfd319277e882', '2010-05-05 00:00:00', '2021-02-05 11:14:32', NULL, '0:0:0:0:0:0:0:1', 'U', '');

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
