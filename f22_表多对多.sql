/**
多对多的关联关系

	用户 和 角色
	
	关系维护者 : 中间表
*/
use py2607b;

-- 创建一个 角色表， 父表
create table tb_role(
    id bigint primary key auto_increment ,
    name varchar(20) comment '角色名',
    descript text comment '角色描述信息'
);

-- 中间表（维护关系），推荐， 中间表
create table tb_role_user(
    id bigint primary key auto_increment ,
    # 定义外键维护和用户表的关系
    user_id bigint comment '用户ID',
    # 定义外键维护和角色表的关系
    role_id bigint comment '角色ID',
    # 添加外键约束
    foreign key(user_id) references tb_user(id),
    foreign key(role_id) references tb_role(id)
);

/*
-- 中间表
create table tb_role_user(
    # 定义外键维护和用户表的关系
    user_id bigint comment '用户ID',
    # 定义外键维护和角色表的关系
    role_id bigint comment '角色ID',
    # 添加外键约束
    foreign key(user_id) references tb_user(id),
    foreign key(role_id) references tb_role(id),

    # 联合主键
    primary key(user_id, role_id)
);
*/

