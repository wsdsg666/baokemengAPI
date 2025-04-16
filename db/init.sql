-- 创建数据库
CREATE DATABASE IF NOT EXISTS pokemon CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE pokemon;

-- 宝可梦主表
CREATE TABLE pokemon (
    id INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    index VARCHAR(10) NOT NULL COMMENT '宝可梦编号',
    name VARCHAR(50) NOT NULL COMMENT '中文名称',
    name_en VARCHAR(50) NOT NULL COMMENT '英文名称',
    name_jp VARCHAR(50) NOT NULL COMMENT '日文名称',
    profile TEXT COMMENT '宝可梦描述',
    height VARCHAR(10) COMMENT '身高',
    weight VARCHAR(10) COMMENT '体重',
    shape VARCHAR(50) COMMENT '体型',
    color VARCHAR(50) COMMENT '颜色',
    catch_rate VARCHAR(10) COMMENT '捕获率',
    gender_rate_male VARCHAR(10) COMMENT '雄性比例',
    gender_rate_female VARCHAR(10) COMMENT '雌性比例',
    experience_number VARCHAR(20) COMMENT '经验值',
    experience_speed VARCHAR(20) COMMENT '经验值增长速度',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    UNIQUE KEY uk_index (index),
    INDEX idx_name (name),
    INDEX idx_name_en (name_en),
    INDEX idx_name_jp (name_jp)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='宝可梦主表';

-- 其他表的创建语句...
