1.get full details of all projects

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

2.get full details of all projects in london

mysql> select * from projects where city='london';
+-----+----------+--------+
| jid | jname    | city   |
+-----+----------+--------+
| j1  | project1 | london |
| j2  | project2 | london |
+-----+----------+--------+
2 rows in set (0.02 sec)

3.get supplier numbers for suppliers who supply project j1

mysql> select sid from spj where jid='j1';
+-----+
| sid |
+-----+
| s1  |
| s3  |
+-----+
2 rows in set (0.03 sec)

4.get all shipments where the quantity is in range 300 to 750 inclusive

mysql> select parts.pid,parts.pname from spj natural join parts where quantity>=300 and quantity<=750;
+-----+-------+
| pid | pname |
+-----+-------+
| p3  | part1 |
| p1  | part1 |
| p3  | part1 |
| p4  | part2 |
+-----+-------+
4 rows in set (0.00 sec)
mysql> select pname,pid from parts where pid in(select pid from spj where quantity>=300 and quantity<=750);
+-------+-----+
| pname | pid |
+-------+-----+
| part1 | p3  |
| part1 | p1  |
| part2 | p4  |
+-------+-----+
3 rows in set (0.00 sec)

5.get all part-color/part-city pairs

mysql> select concat(pname,'-',color),concat(pname,'-',city) from parts;
+-------------------------+------------------------+
| concat(pname,'-',color) | concat(pname,'-',city) |
+-------------------------+------------------------+
| part1-pink              | part1-visakhapatnam    |
| part2-black             | part2-london           |
| part1-white             | part1-london           |
| part2-black             | part2-visakhapatnam    |
| part1-pink              | part1-amaravathi       |
| part2-white             | part2-hyderabad        |
+-------------------------+------------------------+
6 rows in set (0.00 sec)

6.get all supplier numbers/part number/project number all are colocated

mysql> select suppliers.sid,city,parts.pid,city,projects.jid,city from suppliers natural join parts natural join projects;
+-----+---------------+-----+---------------+-----+---------------+
| sid | city          | pid | city          | jid | city          |
+-----+---------------+-----+---------------+-----+---------------+
| s1  | london        | p2  | london        | j1  | london        |
| s4  | london        | p2  | london        | j1  | london        |
| s1  | london        | p3  | london        | j1  | london        |
| s4  | london        | p3  | london        | j1  | london        |
| s1  | london        | p2  | london        | j2  | london        |
| s4  | london        | p2  | london        | j2  | london        |
| s1  | london        | p3  | london        | j2  | london        |
| s4  | london        | p3  | london        | j2  | london        |
| s6  | amaravathi    | p5  | amaravathi    | j3  | amaravathi    |
| s2  | visakhapatnam | p1  | visakhapatnam | j4  | visakhapatnam |
| s5  | visakhapatnam | p1  | visakhapatnam | j4  | visakhapatnam |
| s2  | visakhapatnam | p4  | visakhapatnam | j4  | visakhapatnam |
| s5  | visakhapatnam | p4  | visakhapatnam | j4  | visakhapatnam |
+-----+---------------+-----+---------------+-----+---------------+
13 rows in set (0.00 sec)

7.get all supplier number/part number/project number all are not colocated

mysql> select suppliers.sid,suppliers.city,parts.pid,parts.city,projects.jid,projects.city from suppliers cross join parts cross join projects where suppliers.city!=parts.city and parts.city!=projects.city;
+-----+---------------+-----+---------------+-----+---------------+
| sid | city          | pid | city          | jid | city          |
+-----+---------------+-----+---------------+-----+---------------+
| s1  | london        | p1  | visakhapatnam | j1  | london        |
| s3  | banglore      | p1  | visakhapatnam | j1  | london        |
| s4  | london        | p1  | visakhapatnam | j1  | london        |
| s6  | amaravathi    | p1  | visakhapatnam | j1  | london        |
| s1  | london        | p4  | visakhapatnam | j1  | london        |
| s3  | banglore      | p4  | visakhapatnam | j1  | london        |
| s4  | london        | p4  | visakhapatnam | j1  | london        |
| s6  | amaravathi    | p4  | visakhapatnam | j1  | london        |
| s1  | london        | p5  | amaravathi    | j1  | london        |
| s2  | visakhapatnam | p5  | amaravathi    | j1  | london        |
| s3  | banglore      | p5  | amaravathi    | j1  | london        |
| s4  | london        | p5  | amaravathi    | j1  | london        |
| s5  | visakhapatnam | p5  | amaravathi    | j1  | london        |
| s1  | london        | p6  | hyderabad     | j1  | london        |
| s2  | visakhapatnam | p6  | hyderabad     | j1  | london        |
| s3  | banglore      | p6  | hyderabad     | j1  | london        |
| s4  | london        | p6  | hyderabad     | j1  | london        |
| s5  | visakhapatnam | p6  | hyderabad     | j1  | london        |
| s6  | amaravathi    | p6  | hyderabad     | j1  | london        |
| s1  | london        | p1  | visakhapatnam | j2  | london        |
| s3  | banglore      | p1  | visakhapatnam | j2  | london        |
| s4  | london        | p1  | visakhapatnam | j2  | london        |
| s6  | amaravathi    | p1  | visakhapatnam | j2  | london        |
| s1  | london        | p4  | visakhapatnam | j2  | london        |
| s3  | banglore      | p4  | visakhapatnam | j2  | london        |
| s4  | london        | p4  | visakhapatnam | j2  | london        |
| s6  | amaravathi    | p4  | visakhapatnam | j2  | london        |
| s1  | london        | p5  | amaravathi    | j2  | london        |
| s2  | visakhapatnam | p5  | amaravathi    | j2  | london        |
| s3  | banglore      | p5  | amaravathi    | j2  | london        |
| s4  | london        | p5  | amaravathi    | j2  | london        |
| s5  | visakhapatnam | p5  | amaravathi    | j2  | london        |
| s1  | london        | p6  | hyderabad     | j2  | london        |
| s2  | visakhapatnam | p6  | hyderabad     | j2  | london        |
| s3  | banglore      | p6  | hyderabad     | j2  | london        |
| s4  | london        | p6  | hyderabad     | j2  | london        |
| s5  | visakhapatnam | p6  | hyderabad     | j2  | london        |
| s6  | amaravathi    | p6  | hyderabad     | j2  | london        |
| s1  | london        | p1  | visakhapatnam | j3  | amaravathi    |
| s3  | banglore      | p1  | visakhapatnam | j3  | amaravathi    |
| s4  | london        | p1  | visakhapatnam | j3  | amaravathi    |
| s6  | amaravathi    | p1  | visakhapatnam | j3  | amaravathi    |
| s2  | visakhapatnam | p2  | london        | j3  | amaravathi    |
| s3  | banglore      | p2  | london        | j3  | amaravathi    |
| s5  | visakhapatnam | p2  | london        | j3  | amaravathi    |
| s6  | amaravathi    | p2  | london        | j3  | amaravathi    |
| s2  | visakhapatnam | p3  | london        | j3  | amaravathi    |
| s3  | banglore      | p3  | london        | j3  | amaravathi    |
| s5  | visakhapatnam | p3  | london        | j3  | amaravathi    |
| s6  | amaravathi    | p3  | london        | j3  | amaravathi    |
| s1  | london        | p4  | visakhapatnam | j3  | amaravathi    |
| s3  | banglore      | p4  | visakhapatnam | j3  | amaravathi    |
| s4  | london        | p4  | visakhapatnam | j3  | amaravathi    |
| s6  | amaravathi    | p4  | visakhapatnam | j3  | amaravathi    |
| s1  | london        | p6  | hyderabad     | j3  | amaravathi    |
| s2  | visakhapatnam | p6  | hyderabad     | j3  | amaravathi    |
| s3  | banglore      | p6  | hyderabad     | j3  | amaravathi    |
| s4  | london        | p6  | hyderabad     | j3  | amaravathi    |
| s5  | visakhapatnam | p6  | hyderabad     | j3  | amaravathi    |
| s6  | amaravathi    | p6  | hyderabad     | j3  | amaravathi    |
| s2  | visakhapatnam | p2  | london        | j4  | visakhapatnam |
| s3  | banglore      | p2  | london        | j4  | visakhapatnam |
| s5  | visakhapatnam | p2  | london        | j4  | visakhapatnam |
| s6  | amaravathi    | p2  | london        | j4  | visakhapatnam |
| s2  | visakhapatnam | p3  | london        | j4  | visakhapatnam |
| s3  | banglore      | p3  | london        | j4  | visakhapatnam |
| s5  | visakhapatnam | p3  | london        | j4  | visakhapatnam |
| s6  | amaravathi    | p3  | london        | j4  | visakhapatnam |
| s1  | london        | p5  | amaravathi    | j4  | visakhapatnam |
| s2  | visakhapatnam | p5  | amaravathi    | j4  | visakhapatnam |
| s3  | banglore      | p5  | amaravathi    | j4  | visakhapatnam |
| s4  | london        | p5  | amaravathi    | j4  | visakhapatnam |
| s5  | visakhapatnam | p5  | amaravathi    | j4  | visakhapatnam |
| s1  | london        | p6  | hyderabad     | j4  | visakhapatnam |
| s2  | visakhapatnam | p6  | hyderabad     | j4  | visakhapatnam |
| s3  | banglore      | p6  | hyderabad     | j4  | visakhapatnam |
| s4  | london        | p6  | hyderabad     | j4  | visakhapatnam |
| s5  | visakhapatnam | p6  | hyderabad     | j4  | visakhapatnam |
| s6  | amaravathi    | p6  | hyderabad     | j4  | visakhapatnam |
| s1  | london        | p1  | visakhapatnam | j5  | hyderabad     |
| s3  | banglore      | p1  | visakhapatnam | j5  | hyderabad     |
| s4  | london        | p1  | visakhapatnam | j5  | hyderabad     |
| s6  | amaravathi    | p1  | visakhapatnam | j5  | hyderabad     |
| s2  | visakhapatnam | p2  | london        | j5  | hyderabad     |
| s3  | banglore      | p2  | london        | j5  | hyderabad     |
| s5  | visakhapatnam | p2  | london        | j5  | hyderabad     |
| s6  | amaravathi    | p2  | london        | j5  | hyderabad     |
| s2  | visakhapatnam | p3  | london        | j5  | hyderabad     |
| s3  | banglore      | p3  | london        | j5  | hyderabad     |
| s5  | visakhapatnam | p3  | london        | j5  | hyderabad     |
| s6  | amaravathi    | p3  | london        | j5  | hyderabad     |
| s1  | london        | p4  | visakhapatnam | j5  | hyderabad     |
| s3  | banglore      | p4  | visakhapatnam | j5  | hyderabad     |
| s4  | london        | p4  | visakhapatnam | j5  | hyderabad     |
| s6  | amaravathi    | p4  | visakhapatnam | j5  | hyderabad     |
| s1  | london        | p5  | amaravathi    | j5  | hyderabad     |
| s2  | visakhapatnam | p5  | amaravathi    | j5  | hyderabad     |
| s3  | banglore      | p5  | amaravathi    | j5  | hyderabad     |
| s4  | london        | p5  | amaravathi    | j5  | hyderabad     |
| s5  | visakhapatnam | p5  | amaravathi    | j5  | hyderabad     |
| s1  | london        | p1  | visakhapatnam | j6  | banglore      |
| s3  | banglore      | p1  | visakhapatnam | j6  | banglore      |
| s4  | london        | p1  | visakhapatnam | j6  | banglore      |
| s6  | amaravathi    | p1  | visakhapatnam | j6  | banglore      |
| s2  | visakhapatnam | p2  | london        | j6  | banglore      |
| s3  | banglore      | p2  | london        | j6  | banglore      |
| s5  | visakhapatnam | p2  | london        | j6  | banglore      |
| s6  | amaravathi    | p2  | london        | j6  | banglore      |
| s2  | visakhapatnam | p3  | london        | j6  | banglore      |
| s3  | banglore      | p3  | london        | j6  | banglore      |
| s5  | visakhapatnam | p3  | london        | j6  | banglore      |
| s6  | amaravathi    | p3  | london        | j6  | banglore      |
| s1  | london        | p4  | visakhapatnam | j6  | banglore      |
| s3  | banglore      | p4  | visakhapatnam | j6  | banglore      |
| s4  | london        | p4  | visakhapatnam | j6  | banglore      |
| s6  | amaravathi    | p4  | visakhapatnam | j6  | banglore      |
| s1  | london        | p5  | amaravathi    | j6  | banglore      |
| s2  | visakhapatnam | p5  | amaravathi    | j6  | banglore      |
| s3  | banglore      | p5  | amaravathi    | j6  | banglore      |
| s4  | london        | p5  | amaravathi    | j6  | banglore      |
| s5  | visakhapatnam | p5  | amaravathi    | j6  | banglore      |
| s1  | london        | p6  | hyderabad     | j6  | banglore      |
| s2  | visakhapatnam | p6  | hyderabad     | j6  | banglore      |
| s3  | banglore      | p6  | hyderabad     | j6  | banglore      |
| s4  | london        | p6  | hyderabad     | j6  | banglore      |
| s5  | visakhapatnam | p6  | hyderabad     | j6  | banglore      |
| s6  | amaravathi    | p6  | hyderabad     | j6  | banglore      |
+-----+---------------+-----+---------------+-----+---------------+
127 rows in set (0.00 sec)

8.get all supplier number/part number/project number no two of them are not colocated

mysql> select suppliers.sid,suppliers.city,parts.pid,parts.city,projects.jid,projects.city from suppliers cross join parts cross join projects where suppliers.city!=parts.city and parts.city!=projects.city and projects.city!=suppliers.city;
+-----+---------------+-----+---------------+-----+---------------+
| sid | city          | pid | city          | jid | city          |
+-----+---------------+-----+---------------+-----+---------------+
| s3  | banglore      | p1  | visakhapatnam | j1  | london        |
| s6  | amaravathi    | p1  | visakhapatnam | j1  | london        |
| s3  | banglore      | p4  | visakhapatnam | j1  | london        |
| s6  | amaravathi    | p4  | visakhapatnam | j1  | london        |
| s2  | visakhapatnam | p5  | amaravathi    | j1  | london        |
| s3  | banglore      | p5  | amaravathi    | j1  | london        |
| s5  | visakhapatnam | p5  | amaravathi    | j1  | london        |
| s2  | visakhapatnam | p6  | hyderabad     | j1  | london        |
| s3  | banglore      | p6  | hyderabad     | j1  | london        |
| s5  | visakhapatnam | p6  | hyderabad     | j1  | london        |
| s6  | amaravathi    | p6  | hyderabad     | j1  | london        |
| s3  | banglore      | p1  | visakhapatnam | j2  | london        |
| s6  | amaravathi    | p1  | visakhapatnam | j2  | london        |
| s3  | banglore      | p4  | visakhapatnam | j2  | london        |
| s6  | amaravathi    | p4  | visakhapatnam | j2  | london        |
| s2  | visakhapatnam | p5  | amaravathi    | j2  | london        |
| s3  | banglore      | p5  | amaravathi    | j2  | london        |
| s5  | visakhapatnam | p5  | amaravathi    | j2  | london        |
| s2  | visakhapatnam | p6  | hyderabad     | j2  | london        |
| s3  | banglore      | p6  | hyderabad     | j2  | london        |
| s5  | visakhapatnam | p6  | hyderabad     | j2  | london        |
| s6  | amaravathi    | p6  | hyderabad     | j2  | london        |
| s1  | london        | p1  | visakhapatnam | j3  | amaravathi    |
| s3  | banglore      | p1  | visakhapatnam | j3  | amaravathi    |
| s4  | london        | p1  | visakhapatnam | j3  | amaravathi    |
| s2  | visakhapatnam | p2  | london        | j3  | amaravathi    |
| s3  | banglore      | p2  | london        | j3  | amaravathi    |
| s5  | visakhapatnam | p2  | london        | j3  | amaravathi    |
| s2  | visakhapatnam | p3  | london        | j3  | amaravathi    |
| s3  | banglore      | p3  | london        | j3  | amaravathi    |
| s5  | visakhapatnam | p3  | london        | j3  | amaravathi    |
| s1  | london        | p4  | visakhapatnam | j3  | amaravathi    |
| s3  | banglore      | p4  | visakhapatnam | j3  | amaravathi    |
| s4  | london        | p4  | visakhapatnam | j3  | amaravathi    |
| s1  | london        | p6  | hyderabad     | j3  | amaravathi    |
| s2  | visakhapatnam | p6  | hyderabad     | j3  | amaravathi    |
| s3  | banglore      | p6  | hyderabad     | j3  | amaravathi    |
| s4  | london        | p6  | hyderabad     | j3  | amaravathi    |
| s5  | visakhapatnam | p6  | hyderabad     | j3  | amaravathi    |
| s3  | banglore      | p2  | london        | j4  | visakhapatnam |
| s6  | amaravathi    | p2  | london        | j4  | visakhapatnam |
| s3  | banglore      | p3  | london        | j4  | visakhapatnam |
| s6  | amaravathi    | p3  | london        | j4  | visakhapatnam |
| s1  | london        | p5  | amaravathi    | j4  | visakhapatnam |
| s3  | banglore      | p5  | amaravathi    | j4  | visakhapatnam |
| s4  | london        | p5  | amaravathi    | j4  | visakhapatnam |
| s1  | london        | p6  | hyderabad     | j4  | visakhapatnam |
| s3  | banglore      | p6  | hyderabad     | j4  | visakhapatnam |
| s4  | london        | p6  | hyderabad     | j4  | visakhapatnam |
| s6  | amaravathi    | p6  | hyderabad     | j4  | visakhapatnam |
| s1  | london        | p1  | visakhapatnam | j5  | hyderabad     |
| s3  | banglore      | p1  | visakhapatnam | j5  | hyderabad     |
| s4  | london        | p1  | visakhapatnam | j5  | hyderabad     |
| s6  | amaravathi    | p1  | visakhapatnam | j5  | hyderabad     |
| s2  | visakhapatnam | p2  | london        | j5  | hyderabad     |
| s3  | banglore      | p2  | london        | j5  | hyderabad     |
| s5  | visakhapatnam | p2  | london        | j5  | hyderabad     |
| s6  | amaravathi    | p2  | london        | j5  | hyderabad     |
| s2  | visakhapatnam | p3  | london        | j5  | hyderabad     |
| s3  | banglore      | p3  | london        | j5  | hyderabad     |
| s5  | visakhapatnam | p3  | london        | j5  | hyderabad     |
| s6  | amaravathi    | p3  | london        | j5  | hyderabad     |
| s1  | london        | p4  | visakhapatnam | j5  | hyderabad     |
| s3  | banglore      | p4  | visakhapatnam | j5  | hyderabad     |
| s4  | london        | p4  | visakhapatnam | j5  | hyderabad     |
| s6  | amaravathi    | p4  | visakhapatnam | j5  | hyderabad     |
| s1  | london        | p5  | amaravathi    | j5  | hyderabad     |
| s2  | visakhapatnam | p5  | amaravathi    | j5  | hyderabad     |
| s3  | banglore      | p5  | amaravathi    | j5  | hyderabad     |
| s4  | london        | p5  | amaravathi    | j5  | hyderabad     |
| s5  | visakhapatnam | p5  | amaravathi    | j5  | hyderabad     |
| s1  | london        | p1  | visakhapatnam | j6  | banglore      |
| s4  | london        | p1  | visakhapatnam | j6  | banglore      |
| s6  | amaravathi    | p1  | visakhapatnam | j6  | banglore      |
| s2  | visakhapatnam | p2  | london        | j6  | banglore      |
| s5  | visakhapatnam | p2  | london        | j6  | banglore      |
| s6  | amaravathi    | p2  | london        | j6  | banglore      |
| s2  | visakhapatnam | p3  | london        | j6  | banglore      |
| s5  | visakhapatnam | p3  | london        | j6  | banglore      |
| s6  | amaravathi    | p3  | london        | j6  | banglore      |
| s1  | london        | p4  | visakhapatnam | j6  | banglore      |
| s4  | london        | p4  | visakhapatnam | j6  | banglore      |
| s6  | amaravathi    | p4  | visakhapatnam | j6  | banglore      |
| s1  | london        | p5  | amaravathi    | j6  | banglore      |
| s2  | visakhapatnam | p5  | amaravathi    | j6  | banglore      |
| s4  | london        | p5  | amaravathi    | j6  | banglore      |
| s5  | visakhapatnam | p5  | amaravathi    | j6  | banglore      |
| s1  | london        | p6  | hyderabad     | j6  | banglore      |
| s2  | visakhapatnam | p6  | hyderabad     | j6  | banglore      |
| s4  | london        | p6  | hyderabad     | j6  | banglore      |
| s5  | visakhapatnam | p6  | hyderabad     | j6  | banglore      |
| s6  | amaravathi    | p6  | hyderabad     | j6  | banglore      |
+-----+---------------+-----+---------------+-----+---------------+
92 rows in set (0.00 sec)

9.get full details for parts supplied by a supplier in london

mysql> select * from parts where pid in (select pid from spj where sid in (select sid from suppliers where city='london'));
+-----+-------+-------+--------+---------------+
| pid | pname | color | weight | city          |
+-----+-------+-------+--------+---------------+
| p1  | part1 | pink  | 70kgs  | visakhapatnam |
| p3  | part1 | white | 55kgs  | london        |
+-----+-------+-------+--------+---------------+
2 rows in set (0.00 sec)

10.get part numbers for parts supplied by a supplier in london to a project in london

mysql> select spj.pid,suppliers.city,projects.city from spj natural join suppliers natural join projects where suppliers.city='london' and projects.city='london';
+-----+--------+--------+
| pid | city   | city   |
+-----+--------+--------+
| p1  | london | london |
| p3  | london | london |
+-----+--------+--------+
2 rows in set (0.00 sec)

11.get all pairs of city names such that a supplier in the first city supplies a project in the second city

mysql> select suppliers.city,projects.city from suppliers,projects,spj where suppliers.sid=spj.sid and projects.jid=spj.jid;
+---------------+------------+
| city          | city       |
+---------------+------------+
| london        | london     |
| london        | amaravathi |
| visakhapatnam | london     |
| banglore      | london     |
| london        | london     |
| visakhapatnam | amaravathi |
+---------------+------------+
6 rows in set (0.00 sec)

12.get part numbers for parts supplied to any project by a supplier in the same city as that project

mysql> select spj.pid,suppliers.city,projects.city from spj natural join suppliers natural join projects;
+-----+--------+--------+
| pid | city   | city   |
+-----+--------+--------+
| p1  | london | london |
| p3  | london | london |
+-----+--------+--------+
2 rows in set (0.00 sec)

13.get project numbers for projects suopplied by at least one supplier not in the same city

mysql> select distinct spj.sid,spj.jid from spj,suppliers,projects where spj.sid=suppliers.sid and spj.jid=projects.jid and suppliers.city!=projects.city order by sid,jid;
+-----+-----+
| sid | jid |
+-----+-----+
| s1  | j3  |
| s1  | j4  |
| s1  | j5  |
| s2  | j1  |
| s2  | j2  |
| s2  | j3  |
| s2  | j5  |
| s3  | j1  |
| s5  | j3  |
+-----+-----+
9 rows in set (0.00 sec)

14.get all pairs of part numbers such that some suppliers supplies both the indicated parts

mysql> select distinct a.sid,a.pid as part1,b.pid as part2 from spj a,spj b where a.sid=b.sid and a.pid!=b.pid order by sid; +-----+-------+-------+
| sid | part1 | part2 |
+-----+-------+-------+
| s1  | p1    | p2    |
| s1  | p1    | p3    |
| s1  | p2    | p1    |
| s1  | p2    | p3    |
| s1  | p3    | p1    |
| s1  | p3    | p2    |
+-----+-------+-------+
6 rows in set (0.00 sec)

15.get the total number of projects supplied by supplier s1

mysql> select count(jid) from spj where sid='s1';
+------------+
| count(jid) |
+------------+
|          1 |
+------------+
1 row in set (0.00 sec)

16.get the total quantity of part p1 supplies by supplier s1

mysql> select sid,pid,quantity from spj where pid='p1' and sid='s1';
+-----+-----+----------+
| sid | pid | quantity |
+-----+-----+----------+
| s1  | p1  |      800 |
+-----+-----+----------+
1 row in set (0.00 sec)

17.for each part being supplied to a project ,get the part number,the project number,and the corresponding total quantity

mysql> select pid,spj.jid,quantity from spj where spj.jid in (select jid from projects where jname='project2');
+-----+-----+----------+
| pid | jid | quantity |
+-----+-----+----------+
| p3  | j2  |      500 |
| p3  | j2  |      300 |
+-----+-----+----------+
2 rows in set (0.01 sec)

18.get part numbers of parts supplied to some project in an average auantity of more than 350

mysql> update spj set quantity=20 where sid='s4';
Query OK, 1 row affected (0.07 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from spj;
+-----+-----+-----+----------+
| sid | pid | jid | quantity |
+-----+-----+-----+----------+
| s1  | p1  | j1  |      800 |
| s2  | p3  | j2  |      500 |
| s3  | p1  | j1  |      600 |
| s4  | p3  | j2  |       20 |
| s5  | p4  | j3  |      450 |
+-----+-----+-----+----------+
5 rows in set (0.00 sec)
mysql> select pid,avg(quantity) from spj where jid in (select jid from projects where jname='project2') group by pid having avg(quantity)>350;
Empty set (0.01 sec)

mysql> select pid,avg(quantity) from spj where jid in (select jid from projects where jname='project1') group by pid having avg(quantity)>350;
+-----+---------------+
| pid | avg(quantity) |
+-----+---------------+
| p1  |      700.0000 |
+-----+---------------+
1 row in set (0.00 sec)

19.get project names for projects supplied by supplier s1

mysql> select * from spj;
+-----+-----+-----+----------+
| sid | pid | jid | quantity |
+-----+-----+-----+----------+
| s1  | p1  | j1  |      800 |
| s1  | p5  | j3  |      100 |
| s2  | p3  | j2  |      500 |
| s3  | p1  | j1  |      600 |
| s4  | p3  | j2  |       20 |
| s5  | p4  | j3  |      450 |
+-----+-----+-----+----------+
6 rows in set (0.00 sec)
mysql> select jname from projects where jid in (select jid from spj where sid='s1');
+----------+
| jname    |
+----------+
| project1 |
| project3 |
+----------+
2 rows in set (0.00 sec)

20.get colors of parts supplied by supplier s1

mysql> select pid,color from parts where pid in (select pid from spj where sid='s1');
+-----+-------+
| pid | color |
+-----+-------+
| p1  | pink  |
| p5  | pink  |
+-----+-------+
2 rows in set (0.00 sec)

21.get part numbers for parts supplied to any project in london

mysql> select pid from spj where jid in (select jid from projects where city='london');
+-----+
| pid |
+-----+
| p1  |
| p1  |
| p3  |
| p3  |
+-----+
4 rows in set (0.00 sec)

22.get project numbers for projects using atleast one part available from supplier s1

mysql> select sid,pid,jid from spj;
+-----+-----+-----+
| sid | pid | jid |
+-----+-----+-----+
| s1  | p1  | j1  |
| s3  | p1  | j1  |
| s5  | p2  | j4  |
| s2  | p3  | j2  |
| s4  | p3  | j2  |
| s3  | p4  | j4  |
| s5  | p4  | j3  |
| s1  | p5  | j3  |
+-----+-----+-----+
8 rows in set (0.01 sec)
mysql> select pid,jid from spj where pid in (select pid from spj where sid='s1');
+-----+-----+
| pid | jid |
+-----+-----+
| p1  | j1  |
| p1  | j1  |
| p5  | j3  |
+-----+-----+
3 rows in set (0.02 sec)

23.get supplier number for suppliers supplying at least one part supplied by at least one supplier who supplies at least one red part

mysql> select sid from spj where pid=any (select pid from parts where color='pink');
+-----+
| sid |
+-----+
| s1  |
| s3  |
| s1  |
+-----+
3 rows in set (0.01 sec)

24.get supplier number for suppliers with a status lower than that of supplier s1

mysql> select * from suppliers;
+-----+--------+--------+---------------+
| sid | sname  | status | city          |
+-----+--------+--------+---------------+
| s1  | sri    | 20     | london        |
| s2  | asha   | 50     | visakhapatnam |
| s3  | yamuna | 30     | banglore      |
| s4  | ram    | 10     | london        |
| s5  | siri   | 75     | visakhapatnam |
| s6  | tom    | 40     | amaravathi    |
+-----+--------+--------+---------------+
6 rows in set (0.00 sec)
mysql> select sid from suppliers where status < any (select status from suppliers where sid='s1');
+-----+
| sid |
+-----+
| s4  |
+-----+
1 row in set (0.00 sec)

25.get project numbers for projects whose city is first in the alphabetic list of such cities

mysql> select jid from projects order by city limit 1 ;
+-----+
| jid |
+-----+
| j3  |
+-----+
1 row in set (0.00 sec)

26.get project numbers for projects supplied with part p1 in an average quantity greater than the greatest quantity in which any part is supplied to project j1

mysql>  select jid,avg(quantity) from spj where pid='p1' group by jid having avg(quantity)>(select quantity from spj where jid='j1' order by quantity desc limit 1);
+-----+---------------+
| jid | avg(quantity) |
+-----+---------------+
| j5  |      900.0000 |
+-----+---------------+
1 row in set (0.00 sec)


27.get supplier numbers for suppliers supplying some project with part p1 in a quantity greater than the average shipment quantity of part p1 for that project

mysql> select * from spj where pid="p1" and jid="j1" and quantity>(select avg(quantity) from spj where pid="p1");
+-----+-----+-----+----------+
| sid | pid | jid | quantity |
+-----+-----+-----+----------+
| s1  | p1  | j1  |      800 |
| s3  | p1  | j1  |      600 |
+-----+-----+-----+----------+
2 rows in set (0.02 sec)

28.get project numbers for projects supplied not supplied with any red part by any london supplier

mysql> select * from parts;
+-----+-------+-------+--------+---------------+
| pid | pname | color | weight | city          |
+-----+-------+-------+--------+---------------+
| p1  | part1 | red   | 70kgs  | visakhapatnam |
| p2  | part2 | black | 45kgs  | london        |
| p3  | part1 | white | 55kgs  | london        |
| p4  | part2 | black | 60kgs  | visakhapatnam |
| p5  | part1 | red   | 70kgs  | amaravathi    |
| p6  | part2 | white | 55kgs  | hyderabad     |
+-----+-------+-------+--------+---------------+
6 rows in set (0.00 sec)
mysql> select * from spj;
+-----+-----+-----+----------+
| sid | pid | jid | quantity |
+-----+-----+-----+----------+
| s1  | p1  | j1  |      800 |
| s1  | p2  | j4  |      250 |
| s1  | p3  | j5  |      250 |
| s2  | p3  | j2  |      500 |
| s3  | p1  | j1  |      600 |
| s4  | p3  | j2  |      300 |
| s5  | p4  | j3  |      450 |
+-----+-----+-----+----------+
7 rows in set (0.00 sec)
mysql> select jid from spj where sid in (select sid from parts natural join suppliers where suppliers.city!='london' and parts.color!='red'); +-----+
| jid |
+-----+
| j2  |
| j3  |
+-----+
2 rows in set (0.00 sec)

29.get project numbers for projects supplied entirely by supplier s1

mysql> select * from spj;
+-----+-----+-----+----------+
| sid | pid | jid | quantity |
+-----+-----+-----+----------+
| s1  | p1  | j1  |      800 |
| s1  | p2  | j4  |      250 |
| s1  | p3  | j5  |      250 |
| s2  | p3  | j2  |      500 |
| s3  | p1  | j1  |      600 |
| s4  | p3  | j2  |      300 |
| s5  | p4  | j3  |      450 |
+-----+-----+-----+----------+
7 rows in set (0.00 sec)
mysql> select sid,jid from spj where sid='s1' and jid in (select jid from spj group by jid having count(jid)<2);
+-----+-----+
| sid | jid |
+-----+-----+
| s1  | j4  |
| s1  | j5  |
+-----+-----+
2 rows in set (0.00 sec)

30.get part numbers for parts supplied to all projects in london

mysql> select distinct pid,jid from spj where jid in (select jid from projects where city='london');
+-----+-----+
| pid | jid |
+-----+-----+
| p1  | j1  |
| p3  | j2  |
+-----+-----+
2 rows in set (0.00 sec)

31.get supplier numbers for suppliers who supply the same part to all projects






32.get project numbers for projects supplied supplied with at least all parts available from supplier s1

mysql> select distinct jid from spj where pid in (select pid from spj where sid='s1') order by jid;
+-----+
| jid |
+-----+
| j1  |
| j2  |
| j4  |
| j5  |
+-----+
4 rows in set (0.00 sec)


33.get all cities in which at least one supplier,part or project is located

mysql> select city as cities from suppliers union select city from parts union select city from projects;
+---------------+
| cities        |
+---------------+
| london        |
| visakhapatnam |
| banglore      |
| amaravathi    |
| hyderabad     |
+---------------+
5 rows in set (0.00 sec)

34.get part numbers for parts that are supplied either by a london supplier or to a london project

mysql> select spj.pid from spj natural join suppliers natural join projects where suppliers.city='london' or projects.city='london';
+-----+
| pid |
+-----+
| p1  |
| p1  |
| p3  |
+-----+
3 rows in set (0.01 sec)

35.get supplier-number/part-number pairs such that the indicated suppliers does not supply the indicated part

mysql> select suppliers.sid,parts.pid from suppliers,parts where not exists (select * from spj where spj.sid=suppliers.sid and spj.pid=parts.pid) order by sid,pid;
+-----+-----+
| sid | pid |
+-----+-----+
| s1  | p4  |
| s1  | p5  |
| s1  | p6  |
| s2  | p1  |
| s2  | p2  |
| s2  | p4  |
| s2  | p5  |
| s2  | p6  |
| s3  | p2  |
| s3  | p3  |
| s3  | p4  |
| s3  | p5  |
| s3  | p6  |
| s4  | p1  |
| s4  | p2  |
| s4  | p4  |
| s4  | p5  |
| s4  | p6  |
| s5  | p1  |
| s5  | p2  |
| s5  | p3  |
| s5  | p5  |
| s5  | p6  |
| s6  | p1  |
| s6  | p2  |
| s6  | p3  |
| s6  | p4  |
| s6  | p5  |
| s6  | p6  |
+-----+-----+
29 rows in set (0.00 sec)


