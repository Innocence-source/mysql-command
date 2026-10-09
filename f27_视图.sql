/*
视图 view: 是表的映射、是一个虚表，本质上是一个查询命令

视图的作用：
    a) 简化查询、让 SQL 命令变得更加简洁
		b) 提高表中数据安全性
		
		
	视图 支持 修改数据操作、但 聚合的数据 、计算的属性 不能修改

	视图 支持 删除数据操作、但 聚合的数据 的不能修改。

*/
create view v_student as
select t.sno, t.name, t.birth, t.gender, t.create_time, t.card , t.score,
    case t.gender
        when 'm' then '男'
				when 'f' then '女'
				else '未知'
		end as sex,
		
		case 
				


select * from v_student;
drop view v_student;

show create view v_student;