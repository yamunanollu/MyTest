mysql> create table customer ( cust_id int(5) PRIMARY KEY, cust_name varchar(20), order_id int(5), cust_address varchar(20) );
Query OK, 0 rows affected (0.35 sec)

mysql> insert into values(1,'yamuna',10,'vizag');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'values(1,'yamuna',10,'vizag')' at line 1
mysql> insert into customer values(1,'yamuna',10,'vizag');
Query OK, 1 row affected (0.06 sec)

mysql> insert into customer values(2,'ramya',13,'hyd');
Query OK, 1 row affected (0.05 sec)

mysql> insert into customer values(3,'sandy',07,'vzm');
Query OK, 1 row affected (0.08 sec)

mysql> insert into customer values(4,'lakshmi',06,'duv');
Query OK, 1 row affected (0.05 sec)

mysql> insert into customer values(,'ram',04,'vis');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ram',04,'vis')' at line 1
mysql> insert into customer values(5,'ram',04,'vis');
Query OK, 1 row affected (0.05 sec)

mysql> selct * from customer;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'selct * from customer' at line 1
mysql> select * from customer;
+---------+-----------+----------+--------------+
| cust_id | cust_name | order_id | cust_address |
+---------+-----------+----------+--------------+
|       1 | yamuna    |       10 | vizag        |
|       2 | ramya     |       13 | hyd          |
|       3 | sandy     |        7 | vzm          |
|       4 | lakshmi   |        6 | duv          |
|       5 | ram       |        4 | vis          |
+---------+-----------+----------+--------------+
5 rows in set (0.00 sec)
mysql> alter table customer add (product_id int(5));
Query OK, 0 rows affected (0.82 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from customer;
+---------+-----------+----------+--------------+------------+
| cust_id | cust_name | order_id | cust_address | product_id |
+---------+-----------+----------+--------------+------------+
|       1 | yamuna    |       10 | vizag        |       NULL |
|       2 | ramya     |       13 | hyd          |       NULL |
|       3 | sandy     |        7 | vzm          |       NULL |
|       4 | lakshmi   |        6 | duv          |       NULL |
|       5 | ram       |        4 | vis          |       NULL |
+---------+-----------+----------+--------------+------------+
5 rows in set (0.00 sec)
mysql> update customer set product_id=101 where cust_id=1;
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from customer;
+---------+-----------+----------+--------------+------------+
| cust_id | cust_name | order_id | cust_address | product_id |
+---------+-----------+----------+--------------+------------+
|       1 | yamuna    |       10 | vizag        |        101 |
|       2 | ramya     |       13 | hyd          |       NULL |
|       3 | sandy     |        7 | vzm          |       NULL |
|       4 | lakshmi   |        6 | duv          |       NULL |
|       5 | ram       |        4 | vis          |       NULL |
+---------+-----------+----------+--------------+------------+
5 rows in set (0.00 sec)

mysql> update customer set product_id=102 where cust_id=2;
Query OK, 1 row affected (0.07 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update customer set product_id=103 where cust_id=3;
Query OK, 1 row affected (0.08 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update customer set product_id=105 where cust_id=5;
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from customer;
+---------+-----------+----------+--------------+------------+
| cust_id | cust_name | order_id | cust_address | product_id |
+---------+-----------+----------+--------------+------------+
|       1 | yamuna    |       10 | vizag        |        101 |
|       2 | ramya     |       13 | hyd          |        102 |
|       3 | sandy     |        7 | vzm          |        103 |
|       4 | lakshmi   |        6 | duv          |       NULL |
|       5 | ram       |        4 | vis          |        105 |
+---------+-----------+----------+--------------+------------+
5 rows in set (0.00 sec)

mysql> delete from customer where cust_id=5;
Query OK, 1 row affected (0.06 sec)

mysql> select * from customer;
+---------+-----------+----------+--------------+------------+
| cust_id | cust_name | order_id | cust_address | product_id |
+---------+-----------+----------+--------------+------------+
|       1 | yamuna    |       10 | vizag        |        101 |
|       2 | ramya     |       13 | hyd          |        102 |
|       3 | sandy     |        7 | vzm          |        103 |
|       4 | lakshmi   |        6 | duv          |       NULL |
+---------+-----------+----------+--------------+------------+
4 rows in set (0.00 sec)mysql> alter table customer change order_id products_ordered int(5);
Query OK, 0 rows affected (0.11 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from customer;
+---------+-----------+------------------+--------------+------------+
| cust_id | cust_name | products_ordered | cust_address | product_id |
+---------+-----------+------------------+--------------+------------+
|       1 | yamuna    |               10 | vizag        |        101 |
|       2 | ramya     |               13 | hyd          |        102 |
|       3 | sandy     |                7 | vzm          |        103 |
|       4 | lakshmi   |                6 | duv          |       NULL |
+---------+-----------+------------------+--------------+------------+
4 rows in set (0.00 sec)


