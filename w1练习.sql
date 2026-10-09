create database py2607b;

drop database py2607b;

show databases;
show databases like '%m%';

use py2607b;

create table tb_fmh(
	id bigint primary key auto_increment comment '主键',
	name varchar(20) unique not null comment '用户名',
	password varchar(50) not null comment '密码',
	gender enum('m', 'f', 's') comment '性别',
	tel varchar(11) comment '电话',
	dept varchar(20) comment '部门',
	salary decimal(10, 2) comment '薪资'
)

insert into tb_fmh (name, dept, salary) values 
	('李四', '研发', '12000'),
	('李五', '测试', '10000'),
	('李六', '产品', '15000');


select * from tb_fmh;
select id, name, dept, salary from tb_fmh;
select dept, avg(salary) av from tb_fmh group by dept order by av desc;


create table tb_fmh1(
 id bigint primary key auto_increment comment '主键',
 name varchar(20) not null comment '姓名',
 subject varchar(20) not null comment '学科',
 score decimal(5, 2) not null comment '分数'
)

truncate table tb_fmh1;
drop table tb_fmh1;

insert into tb_fmh1 (name, subject, score) values
	('张一', '语文', '68'),
	('张一', '数学', '65'),
	('张一', '英语', '60'),
	('张九', '语文', '98'),
	('张九', '英语', '100');

select 
	name,
	max(case subject when '语文' then score else 0 end) as '语文',
	max(case subject when '数学' then score else 0 end) as '数学',
	max(case subject when '英语' then score else 0 end) as '英语'
from tb_fmh1
group by name;





