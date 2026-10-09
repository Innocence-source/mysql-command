/*
表与表之间的关系

  一对一
  一对多
  多对多
	
表关系小结

1. 一对一：子表放外键（或共享主键），子表依赖父表
2. 一对多：多方是子表，存放外键，一方是父表（如用户 - 地址）
3. 多对多：中间表是子表，两个业务表都是父表；删表顺序：先删中间表，再删两张父表

一句话记忆口诀: 
	增：先父后子；删：先子后父
*/

# 一对一的关联关系： 本质上是一张表、可以根据数据的热度 将其拆分为 2 张表
# 用户表 和 用户基本信息表

# 用户表 主表 父表
create table tb_user(
 id bigint primary key auto_increment comment '主键',
 username varchar(20) unique not null comment '用户名',
 password varchar(32) not null comment '密码',
 
 create_time datetime comment '用户注册时间',
 last_login_time datetime comment '最近一次登录时间',
 
 state boolean comment '是否启用'
);

-- 用户基本信息表 ，推荐，次表 ，子表，
create table tb_userinfo(
    id bigint primary key auto_increment comment '主键',
    name varchar(10) comment '真实姓名',
    gender enum('f', 'm') comment '性别',
    birthday date comment '出生日期',
    tel varchar(11) comment '手机号',

    -- 定义一个外键、用来维护 2 张表的关系（一对一）
    user_id bigint unique comment '用户ID',
    
		# 添加外键约束
    foreign key(user_id) references tb_user(id)	
		
);

/*
-- 共享主键
create table tb_userinfo2(
    id bigint primary key comment '主键',
    name varchar(10) comment '真实姓名',
    gender enum('f', 'm') comment '性别',
    birthday date comment '出生日期',
    tel varchar(11) comment '手机号',

    # 添加外键约束
    foreign key(id) references tb_user(id)
);
*/

# 删除表 遵循 先删次表、再删主表
-- drop table tb_userinfo2 ;
drop table tb_userinfo ;
drop table tb_user ;



