/**
表 是用来真正存储数据的容器.
表 必须在定义的时候 设置表中有哪些字段(属性)、 字段类型、 长度等.
*/

use py2607b;

-- 建表
create table if not exists tb_student(
	sno varchar(20) comment '学号',
	name varchar(4) comment '名字',
	birth date comment '出生日期',
	tel varchar(11) comment '手机号码',
	gender enum('m' ,'f', 's') comment '性别 m 代表男, f 代表女, s 代表未知',
	create_time datetime comment '入学时间'
);

-- 查看当前 db 下有哪些表
show tables;
show tables like '%stu%';

-- 查看表结构
describe tb_student;
desc tb_student;

-- 查看建表命令
show create table tb_student;

-- 删除表
drop table if exists tb_student;
