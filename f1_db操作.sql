# 查询当前用户下的所有的数据库
show databases;
-- 使用模糊查询当前用户下包含字符 m 的数据库
-- %用来匹配0 ~ n 个字符
--
show databases like '%m%';

# 创建数据库
create database if not exists py2607b;

# 删除数据库
drop database if exists py2607b;

# 切换数据库
use py2607b;