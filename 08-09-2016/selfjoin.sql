mysql> select a.cust_name,a.cust_address,b.order_name from customer a,orders b where b.cust_id=a.cust_id;
+-----------+--------------+------------+
| cust_name | cust_address | order_name |
+-----------+--------------+------------+
| yamuna    | vizag        | xyz        |
| ramya     | hyd          | ysa        |
| sandy     | vzm          | yus        |
| lakshmi   | duv          | osu        |
| ramya     | hyd          | ysa        |
+-----------+--------------+------------+
5 rows in set (0.00 sec)

