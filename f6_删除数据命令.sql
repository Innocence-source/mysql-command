/**
	删除数据 delete 、 truncate 
	
	面试题:
	truncate 和 delete 区别:
	1) truncate 是DDL命令, delete 是DML命令;
	2) truncate 删除表中所有的数据和对应的空间, delete 只删除数据;
	3) truncate 只能删除表中的所有数据, delete 可以删除满足条件的数据;
	4) truncate 不需要事务, delete 可以在事务环境下工作;
	5) truncate 直接销毁重建表，速度快, delete 逐行删除数据，量大性能差。
	
	
	drop 和 truncate 区别？
	DROP TABLE：删除表结构 + 数据，释放所有空间，表直接消失；
	TRUNCATE：只清空数据，表结构保留。
	
*/
use py2607b;

# 删除表中所有数据(企业中慎用)
delete from tb_student;

# 如果要清空表中的所有数据、 推荐使用 truncate
truncate table tb_student;

# 带条件删除 where
# 删除 身份证号为空的所有学生的信息
delete from tb_student where card is null;

