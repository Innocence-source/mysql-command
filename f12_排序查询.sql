/*
排序查询 order by

	默认排序规则 ， 升序排列 asc
	降序排列 desc
	
	order by 支持多个排序规则, 每个排序规则之间使用逗号分隔。
	
	
	多个字段排序：
优先按照第一个字段进行排序、当第一个字段的值相同时，再按照第二个字段的排序规则进行排序、依此类推。
*/

use py2607b;

# 查询所有的学生信息 并按照成绩降序排列
select * from tb_student order by score desc;
# 升序
select * from tb_student order by score asc;

# 查询 男生的所有信息、并按照成绩升序排列 (升序排列 关键字 asc 可以省略)
select * from tb_student where gender = 'm' order by score;
