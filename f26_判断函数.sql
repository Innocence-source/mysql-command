-- if(condition, exp1, exp2)

-- 行列转换
use py2607b;

drop table student_scores;

create table student_scores(
	id bigint primary key auto_increment comment '主键ID',
	student_name varchar(20) not null comment '学生姓名',
	subject varchar(50) not null comment '科目',
	score decimal(5, 2) not null comment '成绩'
);

insert into student_scores(student_name, subject, score) values
	('张三', '语文', '90'),
	('张三', '数学', '89'),
	('张三', '英语', '65'),
	('李四', '语文', '80'),
	('李四', '数学', '60'),
	('李四', '英语', '100');
	
select student_name,
	max(case subject when '语文' then score end) as '语文',
	max(case subject when '数学' then score end) as '数学',
	max(case subject when '英语' then score end) as '英语'
	
from student_scores group by student_name;
	
	