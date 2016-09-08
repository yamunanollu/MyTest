mysql> select * from customer left outer join orders on customer.cust_id=orders.cust_id;
+---------+-----------+------------------+--------------+------------+--------+---------+------------+
| cust_id | cust_name | products_ordered | cust_address | product_id | ord_id | cust_id | order_name |
+---------+-----------+------------------+--------------+------------+--------+---------+------------+
|       1 | yamuna    |               10 | vizag        |        101 |    101 |       1 | xyz        |
|       2 | ramya     |               13 | hyd          |        102 |    102 |       2 | ysa        |
|       3 | sandy     |                7 | vzm          |        103 |    103 |       3 | yus        |
|       4 | lakshmi   |                6 | duv          |       NULL |    104 |       4 | osu        |
|       2 | ramya     |               13 | hyd          |        102 |    105 |       2 | ysa        |
+---------+-----------+------------------+--------------+------------+--------+---------+------------+
5 rows in set (0.01 sec)
mysql> select * from customer left outer join orders on customer.cust_name=orders.cust_id;
+---------+-----------+------------------+--------------+------------+--------+---------+------------+
| cust_id | cust_name | products_ordered | cust_address | product_id | ord_id | cust_id | order_name |
+---------+-----------+------------------+--------------+------------+--------+---------+------------+
|       1 | yamuna    |               10 | vizag        |        101 |   NULL |    NULL | NULL       |
|       2 | ramya     |               13 | hyd          |        102 |   NULL |    NULL | NULL       |
|       3 | sandy     |                7 | vzm          |        103 |   NULL |    NULL | NULL       |
|       4 | lakshmi   |                6 | duv          |       NULL |   NULL |    NULL | NULL       |
+---------+-----------+------------------+--------------+------------+--------+---------+------------+
4 rows in set, 20 warnings (0.01 sec)

