/**
关联查询: 查询具有关联关系的表

左外连接: left outer join
右外连接: right outer join
内连接 : inner join

outer 和 inner 关键字均可以省略 不写
*/

select * from tb_user u
  left outer join tb_address d on u.id = d.user_id;

select * from tb_user u
  right outer join tb_address d on u.id = d.user_id;

select * from tb_user u
  inner join tb_address d on u.id = d.user_id;
