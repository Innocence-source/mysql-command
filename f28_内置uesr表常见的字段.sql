/**
内置 User 表 常见的字段

Host :
    允许访问的主机、值如果为 localhost , 则代表 当前账号 只允许 本机链接
    如果 希望 某台计算机 链接你的数据库， 则 可以将 Host 设置为 允许的 IP 地址
    如果 希望 任何计算机 均可以链接、 则可以将 host 值 设置为 %

User : 账号名

****_priv : 相关权限

max_connections : 数据库允许的最大链接数、0 代表 不限制链接

plugin : 设置 密码的加密机制、
    MySQL 8 版本 值为 caching_sha2_password
    MySQL 5 版本 值为 mysql_native_password

authentication_string : 密码、存储的是 密文

password_expired :  密码是否会过期
password_lifetime : 密码的剩余有效时间

account_locked : 账号是否被锁定、被锁定的账号不允许登录
*/

# 修改指定用户的密码
alter user root@'%' identified by '123456';

