/*
1.简单查询
*/

use py2607b;

# 该命令通常由 第三方连接数据库的软件执行的命令
# 心跳检测：用来检查 MySQL 服务器是否正常
select 1;
select 1 as x;
select 1 x;

# 查询的列是支持运算的
select 1 + 1 as x;

# 查看数据库当前系统时间
select now();

# 查看当前登录的用户信息
select user();

# 查看当前数据库的版本号
select version();

# 支持 查询多列
select 1, now();