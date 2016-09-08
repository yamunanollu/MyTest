mysql> select * from customer inner join orders;
+---------+-----------+------------------+--------------+------------+--------+---------+------------+
| cust_id | cust_name | products_ordered | cust_address | product_id | ord_id | cust_id | order_name |
+---------+-----------+------------------+--------------+------------+--------+---------+------------+
|       1 | yamuna    |               10 | vizag        |        101 |    101 |       1 | xyz        |
|       1 | yamuna    |               10 | vizag        |        101 |    102 |       2 | ysa        |
|       1 | yamuna    |               10 | vizag        |        101 |    103 |       3 | yus        |
|       1 | yamuna    |               10 | vizag        |        101 |    104 |       4 | osu        |
|       2 | ramya     |               13 | hyd          |        102 |    101 |       1 | xyz        |
|       2 | ramya     |               13 | hyd          |        102 |    102 |       2 | ysa        |
|       2 | ramya     |               13 | hyd          |        102 |    103 |       3 | yus        |
|       2 | ramya     |               13 | hyd          |        102 |    104 |       4 | osu        |
|       3 | sandy     |                7 | vzm          |        103 |    101 |       1 | xyz        |
|       3 | sandy     |                7 | vzm          |        103 |    102 |       2 | ysa        |
|       3 | sandy     |                7 | vzm          |        103 |    103 |       3 | yus        |
|       3 | sandy     |                7 | vzm          |        103 |    104 |       4 | osu        |
|       4 | lakshmi   |                6 | duv          |       NULL |    101 |       1 | xyz        |
|       4 | lakshmi   |                6 | duv          |       NULL |    102 |       2 | ysa        |
|       4 | lakshmi   |                6 | duv          |       NULL |    103 |       3 | yus        |
|       4 | lakshmi   |                6 | duv          |       NULL |    104 |       4 | osu        |
+---------+-----------+------------------+--------------+------------+--------+---------+------------+
16 rows in set (0.00 sec)

mysql> select * from customer inner join orders where customer.cust_id=orders.cust_id;
+---------+-----------+------------------+--------------+------------+--------+---------+------------+
| cust_id | cust_name | products_ordered | cust_address | product_id | ord_id | cust_id | order_name |
+---------+-----------+------------------+--------------+------------+--------+---------+------------+
|       1 | yamuna    |               10 | vizag        |        101 |    101 |       1 | xyz        |
|       2 | ramya     |               13 | hyd          |        102 |    102 |       2 | ysa        |
|       3 | sandy     |                7 | vzm          |        103 |    103 |       3 | yus        |
|       4 | lakshmi   |                6 | duv          |       NULL |    104 |       4 | osu        |
+---------+-----------+------------------+--------------+------------+--------+---------+------------+
4 rows in set (0.00 sec)

