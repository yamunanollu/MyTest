mysql> select * from suppliers;
+-----+--------+----------+---------------+
| sid | sname  | status   | city          |
+-----+--------+----------+---------------+
| s1  | sri    | active   | london        |
| s2  | asha   | inactive | visakhapatnam |
| s3  | yamuna | active   | banglore      |
| s4  | ram    | inactive | london        |
| s5  | siri   | inactive | visakhapatnam |
| s6  | tom    | active   | amaravathi    |
+-----+--------+----------+---------------+
6 rows in set (0.00 sec)
mysql> select * from parts;
+-----+-------+-------+--------+---------------+
| pid | pname | color | weight | city          |
+-----+-------+-------+--------+---------------+
| p1  | part1 | pink  | 70kgs  | visakhapatnam |
| p2  | part2 | black | 45kgs  | london        |
| p3  | part1 | white | 55kgs  | london        |
| p4  | part2 | black | 60kgs  | visakhapatnam |
| p5  | part1 | pink  | 70kgs  | amaravathi    |
| p6  | part2 | white | 55kgs  | hyderabad     |
+-----+-------+-------+--------+---------------+
6 rows in set (0.00 sec)

mysql> select * from projects;
+-----+----------+---------------+
| jid | jname    | city          |
+-----+----------+---------------+
| j1  | project1 | london        |
| j2  | project2 | london        |
| j3  | project3 | amaravathi    |
| j4  | project4 | visakhapatnam |
| j5  | project5 | hyderabad     |
| j6  | project6 | banglore      |
+-----+----------+---------------+
6 rows in set (0.00 sec)
mysql> select * from spj;
+-----+-----+-----+----------+
| sid | pid | jid | quantity |
+-----+-----+-----+----------+
| s1  | p1  | j1  |      800 |
| s2  | p3  | j2  |      500 |
| s3  | p1  | j1  |      600 |
| s4  | p3  | j2  |      300 |
| s5  | p4  | j3  |      450 |
+-----+-----+-----+----------+
5 rows in set (0.00 sec)




