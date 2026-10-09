/*
用户表 和 收货地址表
关系： 一对多
关系的维护者： 多
*/
use py2607b;

create table tb_address(
    id bigint primary key auto_increment comment '主键',
    pro varchar(10) comment '省份',
    city varchar(20) comment '城市',
    country varchar(20) comment '区县',
    detail varchar(100) comment '详细地址',
    tel varchar(11) comment '联系方式',
    name varchar(10) comment '收获人',
    -- 添加外键 、维护两张表的关系（多对一）
    user_id bigint comment '用户ID',
    -- 添加外键约束
    foreign key(user_id) references tb_user(id)
);

drop table tb_address;


