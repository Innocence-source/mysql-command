/*
limit 分页查询
		offset :  偏移量 、默认 从 0 开始。
		rows : 代表 每页显示 的条数 。
		语法：limit <rows> offset <offset>
		
offset = (页码 - 1) * 每页条数
语法：limit 偏移量, 条数  等价于 limit 条数 offset 偏移量
*/
use py2607b;

select * from tb_student;

# 每页显示20条数据、 查询第一页的数据
select * from tb_student limit 20 offset 0;

# 每页显示20条数据、 查询第二页的数据
select * from tb_student limit 20 offset 20;

# 每页显示20条数据、 查询第三页的数据
# 分页查询的两种写法
select * from tb_student limit 20 offset 40;
select * from tb_student limit 40, 20;

# 查询第一页的数据
select *from tb_student limit 20;


