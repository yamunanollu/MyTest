mysql> select * from customer;
+---------+-----------+------------------+--------------+------------+
| cust_id | cust_name | products_ordered | cust_address | product_id |
+---------+-----------+------------------+--------------+------------+
|       1 | yamuna    |               10 | vizag        |        101 |
|       2 | ramya     |               13 | hyd          |        102 |
|       3 | sandy     |                7 | vzm          |        103 |
|       4 | lakshmi   |                6 | duv          |       NULL |
+---------+-----------+------------------+--------------+------------+
4 rows in set (0.01 sec)

mysql> select * from orders;
+--------+---------+------------+
| ord_id | cust_id | order_name |
+--------+---------+------------+
|    101 |       1 | xyz        |
|    102 |       2 | ysa        |
|    103 |       3 | yus        |
|    104 |       4 | osu        |
|    105 |       2 | ysa        |
+--------+---------+------------+
5 rows in set (0.00 sec)

mysql> select * from customer right outer join orders on customer.cust_id=orders.cust_id;
+---------+-----------+------------------+--------------+------------+--------+---------+------------+
| cust_id | cust_name | products_ordered | cust_address | product_id | ord_id | cust_id | order_name |
+---------+-----------+------------------+--------------+------------+--------+---------+------------+
|       1 | yamuna    |               10 | vizag        |        101 |    101 |       1 | xyz        |
|       2 | ramya     |               13 | hyd          |        102 |    102 |       2 | ysa        |
|       3 | sandy     |                7 | vzm          |        103 |    103 |       3 | yus        |
|       4 | lakshmi   |                6 | duv          |       NULL |    104 |       4 | osu        |
|       2 | ramya     |               13 | hyd          |        102 |    105 |       2 | ysa        |
+---------+-----------+------------------+--------------+------------+--------+---------+------------+

