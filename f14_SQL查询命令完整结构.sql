# SQL 查询命令完整结构

# 书写顺序：
# select 列... from 表 where 条件 group by 分组 having 筛选 order by 排序 limit 分页

# SELECT 执行流程，底层执行顺序：
# from -> where -> group by -> having -> select -> order by -> limit

# 统计 同年出生的学生 各有多少人
select year(birth) as birth_year, count(1) from tb_student group by birth_year ;
