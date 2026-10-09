/**
	修改数据 update 

	带条件进行更新: where 
		a) 关系条件查询: >, >=, <, <=, = (等于), != (不等)、<> (不等)。
		b) 逻辑条件查询: and (逻辑与) 、 or (逻辑或) 。
		c) 区间条件查询: between <min> and <max> 。
		d) 枚举条件查询: in 。
		e) 模糊条件查询: like, % (匹配0到多个任务字符)、 _ (匹配任意1个字符)
		f) 控制条件查询: is null , is not null 。
		
*/

use py2607b;

-- 将所有的同学姓名为张三修改为 奇酷
update tb_student set name = '奇酷';

-- 将所有的学生名字改为 张三
update tb_student set name = '张三', gender = 'm';

-- 将出生日期为 2001-12-11 的学生名字更改为 王五 、 且性别保密
update tb_student set name = '王五', gender = 's' where birth = '2001-12-11';

-- 将出生日期大于 2001-12-11 的学生 性别更改为 女
update tb_student set gender = 'f' where birth > '2001-12-11';

-- 将出生日期大于 2003-12-11 且 名字叫张三的学生 姓名改为李四
update tb_student set name = '李四' where birth > '2003-12-11' and name = '张三';

-- 更新学号 在S0002 ~ s0005 之间的所有学生 , 他们的入学时间设置为当前时间
update tb_student set create_time = now() where sno between 'S0002' and 'S0005';
update tb_student set create_time = now() where sno >= 'S0002' and <= 'S0005';

-- 将学号为S0002、S0004 的学生, 他们的出生日期改为 '2006-01-01'
update tb_student set birth = '2006-01-01' where sno = 'S0002' or sno = 'S0004';
update tb_student set birth = '2009-01-01' where sno in ('S0002', 'S0004');

-- 将名字包含 三 的同学, 性别改为男
update tb_student set gender = 'm' where name like '%三%' ;
-- = 是精确相等；like 是模糊匹配，_ 是通配符。
-- 只有名字原样等于 3 个字符：张 + 下划线 + 下划线才会更新。
update tb_student set gender = 's' where name = '张__';
-- 名字一共 3 个字，第一个是 “张”，后面两个是任意字符
update tb_student set gender = 's' where name like  '张__';

-- 将录入时间为空的学生改为当前时间
update tb_student set create_time = now() where create_time is null;






















