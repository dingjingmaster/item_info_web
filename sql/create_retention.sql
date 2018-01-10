alter database item_retention default character set utf8;
CREATE TABLE IF NOT EXISTS `item_retent_status`(
    `irid` VARCHAR(128) NOT NULL COMMENT '主键 状态+分类(付费情况)+时间戳',
    `last` INT(12) DEFAULT 0 NOT NULL COMMENT '上一阶段人数',
    `remain` INT(12) DEFAULT 0 NOT NULL COMMENT '留下人数',
    `feeCate` INT(3) DEFAULT 0 NOT NULL COMMENT '付费类别 1免费 2付费 3包月 4公版 5限免',
    `typeCate` INT(6) DEFAULT 0 NOT NULL COMMENT '统计类型 1天人数 2周人数 3七日人数',
    `timeStamp` INT(10) NOT NULL COMMENT '时间戳20180110',
    PRIMARY KEY (`irid`)
    );
alter table item_retent_status default character set utf8;

CREATE TABLE IF NOT EXISTS `item_retent_viewCount`(
    `irid` VARCHAR(128) NOT NULL COMMENT '主键 订阅+分类(付费情况)+时间戳',
    `last` INT(12) DEFAULT 0 NOT NULL COMMENT '上一阶段人数',
    `remain` INT(12) DEFAULT 0 NOT NULL COMMENT '留下人数',
    `feeCate` INT(3) DEFAULT 0 NOT NULL COMMENT '付费类别: 1免费 2付费 3包月 4公版 5限免',
    `typeCate` INT(6) DEFAULT 0 NOT NULL COMMENT '统计类型: 1天人数 2周人数 3七日人数',
    `viewCate` INT(6) DEFAULT 0 NOT NULL COMMENT '订阅量级别: 1小于100 2是1b-1k 3是1k-1w 4是1w-10w 5是大于10w',
    `timeStamp` INT(10) NOT NULL COMMENT '时间戳20180110',
    PRIMARY KEY (`irid`)
    );
alter table item_retent_viewCount default character set utf8;

CREATE TABLE IF NOT EXISTS `item_retent_intime`(
    `irid` VARCHAR(128) NOT NULL COMMENT '主键 入库时间+分类(付费情况)+时间戳',
    `last` INT(12) DEFAULT 0 NOT NULL COMMENT '上一阶段人数',
    `remain` INT(12) DEFAULT 0 NOT NULL COMMENT '留下人数',
    `feeCate` INT(3) DEFAULT 0 NOT NULL COMMENT '付费类别: 1免费 2付费 3包月 4公版 5限免',
    `typeCate` INT(6) DEFAULT 0 NOT NULL COMMENT '统计类型: 1天人数 2天留下人数 3周人数 4周留下人数 5七日人数 6七日留下人数',
    `intimeCate` INT(6) DEFAULT 0 NOT NULL COMMENT '入库时间级别: 1小于1月 2是1月-3月 3是3月-1年 4是大于1年',
    `timeStamp` INT(10) NOT NULL COMMENT '时间戳20180110',
    PRIMARY KEY (`irid`)
    );

CREATE TABLE IF NOT EXISTS `item_retent_update`(
    `irid` VARCHAR(128) NOT NULL COMMENT '主键 最后更新时间+分类(付费情况)+时间戳',
    `last` INT(12) DEFAULT 0 NOT NULL COMMENT '上一阶段人数',
    `remain` INT(12) DEFAULT 0 NOT NULL COMMENT '留下人数',
    `feeCate` INT(3) DEFAULT 0 NOT NULL COMMENT '付费类别: 1免费 2付费 3包月 4公版 5限免',
    `typeCate` INT(6) DEFAULT 0 NOT NULL COMMENT '统计类型: 1天人数 2天留下人数 3周人数 4周留下人数 5七日人数 6七日留下人数',
    `updateCate` INT(6) DEFAULT 0 NOT NULL COMMENT '入库时间级别: 1小于1月 2是1月-3月 3是3月-1年 4是大于1年',
    `timeStamp` INT(10) NOT NULL COMMENT '时间戳20180110',
    PRIMARY KEY (`irid`)
    );

CREATE TABLE IF NOT EXISTS `item_retent_classify1`(
    `irid` VARCHAR(128) NOT NULL COMMENT '主键 一级分类+分类(付费情况)+时间戳',
    `last` INT(12) DEFAULT 0 NOT NULL COMMENT '上一阶段人数',
    `remain` INT(12) DEFAULT 0 NOT NULL COMMENT '留下人数',
    `feeCate` INT(3) DEFAULT 0 NOT NULL COMMENT '付费类别: 1免费 2付费 3包月 4公版 5限免',
    `typeCate` INT(6) DEFAULT 0 NOT NULL COMMENT '统计类型: 1天人数 2天留下人数 3周人数 4周留下人数 5七日人数 6七日留下人数',
    `updateCate` INT(6) DEFAULT 0 NOT NULL COMMENT '一级分类: 1男频 2女频 3出版 4其它',
    `timeStamp` INT(10) NOT NULL COMMENT '时间戳20180110',
    PRIMARY KEY (`irid`)
    );

alter table item_retent_intime default character set utf8;
alter table item_retent_update default character set utf8;
alter table item_retent_classify1 default character set utf8;
