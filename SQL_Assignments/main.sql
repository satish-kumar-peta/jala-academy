-- QUERIES

--1. Display snum,sname,city and comm of all salespeople.
Query:-
Select snum, sname, city, comm
from salespeople;

Output:
+------+---------+-----------+------+
| snum | sname   | city      | comm |
+------+---------+-----------+------+
| 1001 | Peel    | London    | 0.12 |
| 1002 | Serres  | San Jose  | 0.13 |
| 1003 | Axelrod | New york  | 0.10 |
| 1004 | Motika  | London    | 0.11 |
| 1007 | Rafkin  | Barcelona | 0.15 |
+------+---------+-----------+------+

--2. Display all snum without duplicates from all orders.
Query:-
Select distinct snum
from orders;

Output:
+------+
| snum |
+------+
| 1007 |
| 1004 |
| 1001 |
| 1002 |
| 1003 |
+------+

--3. Display names and commissions of all salespeople in london.
Query:-
Select sname,comm
from salespeople
where city = 'London';

Output:
+--------+------+
| sname  | comm |
+--------+------+
| Peel   | 0.12 |
| Motika | 0.11 |
+--------+------+

--4. All customers with rating of 100.
Query:-
Select cname
from cust
where rating = 100;

Output:
+---------+
| cname   |
+---------+
| Hoffman |
| Grass   |
| Pereira |
+---------+


--5. Produce orderno, amount and date form all rows in the order table.
Query:-
Select ONUM, AMT, ODATE
from orders;

Output:
+------+---------+------------+
| ONUM | AMT     | ODATE      |
+------+---------+------------+
| 3001 |   18.69 | 1994-10-03 |
| 3002 | 1900.10 | 1994-10-03 |
| 3003 |  767.19 | 1994-10-03 |
| 3005 | 5160.45 | 1994-10-03 |
| 3006 | 1098.16 | 1994-10-04 |
| 3007 |   75.75 | 1994-10-05 |
| 3008 | 4723.00 | 1994-10-05 |
| 3009 | 1713.23 | 1994-10-04 |
| 3010 | 1309.95 | 1994-10-06 |
| 3011 | 9891.88 | 1994-10-06 |
+------+---------+------------+

--6. All customers in San Jose, who have rating more than 200.
Query:-
Select cname
from cust
where rating > 200;

Output:
+---------+
| cname   |
+---------+
| Liu     |
| Clemens |
+---------+


--7. All customers who were either located in San Jose or had a rating above 200.


Query:-
Select cname
from cust
where city = "San Jose" or rating > 200;

Output:
+---------+
| cname   |
+---------+
| Liu     |
| Clemens |
+---------+



--8. All orders for more than $1000.
Query:-
Select *
from orders
where amt > 1000;

Output:
+------+---------+------------+------+------+
| ONUM | AMT     | ODATE      | CNUM | SNUM |
+------+---------+------------+------+------+
| 3002 | 1900.10 | 1994-10-03 | 2007 | 1004 |
| 3005 | 5160.45 | 1994-10-03 | 2003 | 1002 |
| 3006 | 1098.16 | 1994-10-04 | 2008 | 1007 |
| 3008 | 4723.00 | 1994-10-05 | 2006 | 1001 |
| 3009 | 1713.23 | 1994-10-04 | 2002 | 1003 |
| 3010 | 1309.95 | 1994-10-06 | 2004 | 1002 |
| 3011 | 9891.88 | 1994-10-06 | 2006 | 1001 |
+------+---------+------------+------+------+

--9. Names and citires of all salespeople in london with commission above 0.10.
Query:
Select sname, city
from SALESPEOPLE
where comm > 0.10 and city = 'London';

Output:
+--------+--------+
| sname  | city   |
+--------+--------+
| Peel   | London |
| Motika | London |
+--------+--------+


--10. All customers excluding those with rating <= 100 unless they are located in Rome.
Query:
Select cname
from cust
where rating <= 100 or city = 'Rome';
Output:
+----------+
| cname    |
+----------+
| Hoffman  |
| Giovanne |
| Grass    |
| Pereira  |
+----------+


--11. All salespeople either in Barcelona or in london.
Query:-
SELECT *
FROM SALESPEOPLE
WHERE CITY = 'Barcelona' OR CITY = 'London';

Output:
+--------+-----------+
| sname  | city      |
+--------+-----------+
| Peel   | London    |
| Motika | London    |
| Rafkin | Barcelona |
+--------+-----------+

--12.All salespeople with commission between 0.10 and 0.12. (Boundary values should be excluded)
Query:-
Select sname, comm
from salespeople
where comm > 0.10 and comm < 0.12;

Output:-
+--------+------+
| sname  | comm |
+--------+------+
| Motika | 0.11 |
+--------+------+

--13.All customers with NULL values in city column.
Query:-
Select cname
from cust
where city is null;

Output:


    Program did not output anything!



--14.All orders taken on Oct 3Rd   and Oct 4th  1994.
Query:-
SELECT *
FROM ORDERS
WHERE ODATE IN ('1994-10-03', '1994-10-04');

Output:
+------+---------+------------+------+------+
| ONUM | AMT     | ODATE      | CNUM | SNUM |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1994-10-03 | 2008 | 1007 |
| 3002 | 1900.10 | 1994-10-03 | 2007 | 1004 |
| 3003 |  767.19 | 1994-10-03 | 2001 | 1001 |
| 3005 | 5160.45 | 1994-10-03 | 2003 | 1002 |
| 3006 | 1098.16 | 1994-10-04 | 2008 | 1007 |
| 3009 | 1713.23 | 1994-10-04 | 2002 | 1003 |
+------+---------+------------+------+------+

--15.All customers serviced by peel or Motika.
Query:-
SELECT c.*
FROM CUST c
JOIN SALESPEOPLE s ON c.SNUM = s.SNUM WHERE s.SNAME IN ('Peel', 'Motika');

Output:
+------+---------+--------+--------+------+
| CNUM | CNAME   | CITY   | RATING | SNUM |
+------+---------+--------+--------+------+
| 2001 | Hoffman | London |    100 | 1001 |
| 2007 | Pereira | Rome   |    100 | 1004 |
+------+---------+--------+--------+------+

--16. All customers whose names begin with a letter from A to B.
Query:-
SELECT *
FROM CUST
WHERE SUBSTR(CNAME, 1, 1) BETWEEN 'A' AND 'B';

Output:
  Program did not output anything!


--17.All orders except those with 0 or NULL value in amt field.
Query:-
Select onum
from orders
where amt != 0 or
amt is not null;

Output:
+------+
| onum |
+------+
| 3001 |
| 3002 |
| 3003 |
| 3005 |
| 3006 |
| 3007 |
| 3008 |
| 3009 |
| 3010 |
| 3011 |
+------+


--18.Count the number of salespeople currently listing orders in the order table.
Query:-
Select count(distinct snum)
from orders;

Output:
+----------------------+
| count(distinct snum) |
+----------------------+
|                    5 |
+----------------------+


--19.Largest order taken by each salesperson, datewise.
Query:-
Select odate, snum, max(amt)
from orders
group by odate, snum
order by odate,snum;

Output:
+------------+------+----------+
| odate      | snum | max(amt) |
+------------+------+----------+
| 1994-10-03 | 1001 |   767.19 |
| 1994-10-03 | 1002 |  5160.45 |
| 1994-10-03 | 1004 |  1900.10 |
| 1994-10-03 | 1007 |    18.69 |
| 1994-10-04 | 1003 |  1713.23 |
| 1994-10-04 | 1007 |  1098.16 |
| 1994-10-05 | 1001 |  4723.00 |
| 1994-10-05 | 1002 |    75.75 |
| 1994-10-06 | 1001 |  9891.88 |
| 1994-10-06 | 1002 |  1309.95 |
+------------+------+----------+

--20.Largest order taken by each salesperson with order value more than $3000.
Query:-
Select odate, snum, max(amt)
from orders
where amt > 3000
group by odate, snum
order by odate,snum;

Output:
+------------+------+----------+
| odate      | snum | max(amt) |
+------------+------+----------+
| 1994-10-03 | 1002 |  5160.45 |
| 1994-10-05 | 1001 |  4723.00 |
| 1994-10-06 | 1001 |  9891.88 |
+------------+------+----------+

--21. Which day had the hightest total amount ordered.
Query:
Select odate, amt, snum, cnum
from orders
where amt = (select max(amt)
from orders)

Output:
odate            amt          snum        cnum
---------------- ------------ ----------- -----------
      1994-10-06      9891.88        1001        2006

--22. Count all orders for Oct 3rd.
Query:
Select count(*)
from orders
where odate = ‘03-OCT-94’;

Output:
OrderCount
-----------
          4

--23. Count the number of different non NULL city values in customers table.
Query:
Select count(distinct city)
from cust;

output:
----------
          4

--24. Select each customer’s smallest order.
Query:
Select cnum, min(amt)
from orders
group by cnum;

output:
cnum
----------- ------------
       2001       767.19
       2002      1713.23
       2003      5160.45
       2004        75.75
       2006      4723.00
       2007      1900.10
       2008        18.69


--25. First customer in alphabetical order whose name begins with G.
Query:
Select min(cname)
from cust
where cname like ‘G%’;

Output:
--------------------------------------------------
Giovanne

--26. Get the output like “ For dd/mm/yy there are ___ orders.
Query:
Select 'For ' || to_char(odate,'dd/mm/yy') || ' there are '||
count(*) || ' Orders'
from orders
group by odate;

output:
For 03/10/94 there are 4 Orders
For 04/10/94 there are 2 Orders
For 05/10/94 there are 2 Orders
For 06/10/94 there are 2 Orders



--27. Assume that each salesperson has a 12% commission. Produce order no., salesperson no., and amount of salesperson’s commission for that order.
Query:
Select onum, snum, amt, amt * 0.12
from orders
order by snum;

Output:
onum        snum        amt
----------- ----------- ------------ ---------------
       3003        1001       767.19         92.0628
       3008        1001      4723.00        566.7600
       3011        1001      9891.88       1187.0256
       3007        1002        75.75          9.0900
       3010        1002      1309.95        157.1940
       3005        1002      5160.45        619.2540
       3009        1003      1713.23        205.5876
       3002        1004      1900.10        228.0120
       3001        1007        18.69          2.2428
       3006        1007      1098.16        131.7792



--28. Find highest rating in each city. Put the output in this form. For the city (city), the highest rating is : (rating).
Query:
Select 'For the city (' || city || '), the highest rating is : (' ||
max(rating) || ')'
from cust
group by city;

output:
For the city (Berlin), the highest rating is : (100)
For the city (London), the highest rating is : (300)
For the city (Rome), the highest rating is : (200)
For the city (San Jose), the highest rating is : (300)




--29. Display the totals of orders for each day and place the results in descending order.
Query:
Select odate, count(onum)
from orders
group by odate
order by count(onum);

Output:
odate
---------------- -----------
      1994-10-04           2
      1994-10-05           2
      1994-10-06           2
      1994-10-03           4


--30. All combinations of salespeople and customers who shared a city. (ie same city).
Query:
Select sname, cname
from salespeople, cust
where salespeople.city = cust.city;

Output:
sname                                              cname
-------------------------------------------------- --------------------------------------------------
Peel                                               Hoffman
Peel                                               Clemens
Serres                                             Liu
Motika                                             Hoffman
Motika

--



--31. Name of all customers matched with the salespeople serving them.
Query:
Select cname, sname
from cust, salespeople
where cust.snum = salespeople.snum;

Output:
+----------+---------+
| cname    | sname   |
+----------+---------+
| Hoffman  | Peel    |
| Giovanne | Axelrod |
| Liu      | Serres  |
| Grass    | Serres  |
| Clemens  | Rafkin  |
| Pereira  | Motika  |
+----------+---------+

--32. List each order number followed by the name of the customer who made the order.
Query:
Select onum, cname
from orders, cust
where orders.cnum = cust.cnum;

Output:
+------+----------+
| onum | cname    |
+------+----------+
| 3002 | Pereira  |
| 3003 | Hoffman  |
| 3005 | Liu      |
| 3007 | Grass    |
| 3008 | Clemens  |
| 3009 | Giovanne |
| 3010 | Grass    |
| 3011 | Clemens  |
+------+----------+

--33. Names of salesperson and customer for each order after the order number.
Query:
Select onum, sname, cname
from orders, cust, salespeople
where orders.cnum = cust.cnum and orders.snum = salespeople.snum;
Output:
+------+---------+----------+
| onum | sname   | cname    |
+------+---------+----------+
| 3002 | Motika  | Pereira  |
| 3003 | Peel    | Hoffman  |
| 3005 | Serres  | Liu      |
| 3007 | Serres  | Grass    |
| 3008 | Peel    | Clemens  |
| 3009 | Axelrod | Giovanne |
| 3010 | Serres  | Grass    |
| 3011 | Peel    | Clemens  |
+------+---------+----------+

--34. Produce all customer serviced by salespeople with a commission above 12%.
Query:
Select cname, sname, comm
from cust, salespeople
where comm > 0.12 and cust.snum = salespeople.snum;
Output:
+---------+--------+------+
| cname   | sname  | comm |
+---------+--------+------+
| Liu     | Serres | 0.13 |
| Grass   | Serres | 0.13 |
| Clemens | Rafkin | 0.15 |
+---------+--------+------+
--35. Calculate the amount of the salesperson’s commission on each order with a rating above 100.
Query:
Select sname, amt * comm
from orders, cust, salespeople
where rating > 100 and
          salespeople.snum = cust.snum and
          salespeople.snum = orders.snum and
          cust.cnum = orders.cnum

Output:
+---------+------------+
| sname   | amt * comm |
+---------+------------+
| Serres  |   670.8585 |
| Axelrod |   171.3230 |
+---------+------------+

--36. Find all pairs of customers having the same rating.
Query:
Select a.cname, b.cname,a.rating
from cust a, cust b
where a.rating = b.rating and a.cnum != b.cnum

Output:
+---------+---------+--------+
| cname   | cname   | rating |
+---------+---------+--------+
| Pereira | Hoffman |    100 |
| Grass   | Hoffman |    100 |
| Clemens | Liu     |    300 |
| Pereira | Grass   |    100 |
| Hoffman | Grass   |    100 |
| Liu     | Clemens |    300 |
| Grass   | Pereira |    100 |
| Hoffman | Pereira |    100 |
+---------+---------+--------+

-37. Find all pairs of customers having the same rating, each pair coming once only.
Query:
Select a.cname, b.cname,a.rating
from cust a, cust b
where a.rating = b.rating and a.cnum != b.cnum and a.cnum < b.cnum;

Output:
+---------+---------+--------+
| cname   | cname   | rating |
+---------+---------+--------+
| Hoffman | Grass   |    100 |
| Hoffman | Pereira |    100 |
| Liu     | Clemens |    300 |
| Grass   | Pereira |    100 |
+---------+---------+--------+

--38. Policy is to assign three salesperson to each customers. Display all such combinations.
Query:
Select cname, sname
from salespeople, cust
where sname in  ( select sname from salespeople where rownum <= 3)
order by cname;

Output:
+--------------+--------------+--------------+--------------+
| CustomerName | Salesperson1 | Salesperson2 | Salesperson3 |
+--------------+--------------+--------------+--------------+
| Clemens      | Axelrod      | Motika       | Peel         |
| Clemens      | Axelrod      | Motika       | Rafkin       |
| Clemens      | Axelrod      | Motika       | Serres       |
| Clemens      | Axelrod      | Peel         | Motika       |
| Clemens      | Axelrod      | Peel         | Rafkin       |
| Clemens      | Axelrod      | Peel         | Serres       |
| Clemens      | Axelrod      | Rafkin       | Motika       |
| Clemens      | Axelrod      | Rafkin       | Peel         |
| Clemens      | Axelrod      | Rafkin       | Serres       |
| Clemens      | Axelrod      | Serres       | Motika       |
| Clemens      | Axelrod      | Serres       | Peel         |
| Clemens      | Axelrod      | Serres       | Rafkin       |
| Clemens      | Motika       | Axelrod      | Peel         |
| Clemens      | Motika       | Axelrod      | Rafkin       |
| Clemens      | Motika       | Axelrod      | Serres       |
| Clemens      | Motika       | Peel         | Axelrod      |
| Clemens      | Motika       | Peel         | Rafkin       |
| Clemens      | Motika       | Peel         | Serres       |
| Clemens      | Motika       | Rafkin       | Axelrod      |
| Clemens      | Motika       | Rafkin       | Peel         |
| Clemens      | Motika       | Rafkin       | Serres       |
| Clemens      | Motika       | Serres       | Axelrod      |
| Clemens      | Motika       | Serres       | Peel         |
| Clemens      | Motika       | Serres       | Rafkin       |
| Clemens      | Peel         | Axelrod      | Motika       |
| Clemens      | Peel         | Axelrod      | Rafkin       |
| Clemens      | Peel         | Axelrod      | Serres       |
| Clemens      | Peel         | Motika       | Axelrod      |
| Clemens      | Peel         | Motika       | Rafkin       |
| Clemens      | Peel         | Motika       | Serres       |
| Clemens      | Peel         | Rafkin       | Axelrod      |
| Clemens      | Peel         | Rafkin       | Motika       |
| Clemens      | Peel         | Rafkin       | Serres       |
| Clemens      | Peel         | Serres       | Axelrod      |
| Clemens      | Peel         | Serres       | Motika       |
| Clemens      | Peel         | Serres       | Rafkin       |
| Clemens      | Rafkin       | Axelrod      | Motika       |
| Clemens      | Rafkin       | Axelrod      | Peel         |
| Clemens      | Rafkin       | Axelrod      | Serres       |
| Clemens      | Rafkin       | Motika       | Axelrod      |
| Clemens      | Rafkin       | Motika       | Peel         |
| Clemens      | Rafkin       | Motika       | Serres       |
| Clemens      | Rafkin       | Peel         | Axelrod      |
| Clemens      | Rafkin       | Peel         | Motika       |
| Clemens      | Rafkin       | Peel         | Serres       |
| Clemens      | Rafkin       | Serres       | Axelrod      |
| Clemens      | Rafkin       | Serres       | Motika       |
| Clemens      | Rafkin       | Serres       | Peel         |
| Clemens      | Serres       | Axelrod      | Motika       |
| Clemens      | Serres       | Axelrod      | Peel         |
| Clemens      | Serres       | Axelrod      | Rafkin       |
| Clemens      | Serres       | Motika       | Axelrod      |
| Clemens      | Serres       | Motika       | Peel         |
| Clemens      | Serres       | Motika       | Rafkin       |
| Clemens      | Serres       | Peel         | Axelrod      |
| Clemens      | Serres       | Peel         | Motika       |
| Clemens      | Serres       | Peel         | Rafkin       |
| Clemens      | Serres       | Rafkin       | Axelrod      |
| Clemens      | Serres       | Rafkin       | Motika       |
| Clemens      | Serres       | Rafkin       | Peel         |
| Giovanne     | Axelrod      | Motika       | Peel         |
| Giovanne     | Axelrod      | Motika       | Rafkin       |
| Giovanne     | Axelrod      | Motika       | Serres       |
| Giovanne     | Axelrod      | Peel         | Motika       |
| Giovanne     | Axelrod      | Peel         | Rafkin       |
| Giovanne     | Axelrod      | Peel         | Serres       |
| Giovanne     | Axelrod      | Rafkin       | Motika       |
| Giovanne     | Axelrod      | Rafkin       | Peel         |
| Giovanne     | Axelrod      | Rafkin       | Serres       |
| Giovanne     | Axelrod      | Serres       | Motika       |
| Giovanne     | Axelrod      | Serres       | Peel         |
| Giovanne     | Axelrod      | Serres       | Rafkin       |
| Giovanne     | Motika       | Axelrod      | Peel         |
| Giovanne     | Motika       | Axelrod      | Rafkin       |
| Giovanne     | Motika       | Axelrod      | Serres       |
| Giovanne     | Motika       | Peel         | Axelrod      |
| Giovanne     | Motika       | Peel         | Rafkin       |
| Giovanne     | Motika       | Peel         | Serres       |
| Giovanne     | Motika       | Rafkin       | Axelrod      |
| Giovanne     | Motika       | Rafkin       | Peel         |
| Giovanne     | Motika       | Rafkin       | Serres       |
| Giovanne     | Motika       | Serres       | Axelrod      |
| Giovanne     | Motika       | Serres       | Peel         |
| Giovanne     | Motika       | Serres       | Rafkin       |
| Giovanne     | Peel         | Axelrod      | Motika       |
| Giovanne     | Peel         | Axelrod      | Rafkin       |
| Giovanne     | Peel         | Axelrod      | Serres       |
| Giovanne     | Peel         | Motika       | Axelrod      |
| Giovanne     | Peel         | Motika       | Rafkin       |
| Giovanne     | Peel         | Motika       | Serres       |
| Giovanne     | Peel         | Rafkin       | Axelrod      |
| Giovanne     | Peel         | Rafkin       | Motika       |
| Giovanne     | Peel         | Rafkin       | Serres       |
| Giovanne     | Peel         | Serres       | Axelrod      |
| Giovanne     | Peel         | Serres       | Motika       |
| Giovanne     | Peel         | Serres       | Rafkin       |
| Giovanne     | Rafkin       | Axelrod      | Motika       |
| Giovanne     | Rafkin       | Axelrod      | Peel         |
| Giovanne     | Rafkin       | Axelrod      | Serres       |
| Giovanne     | Rafkin       | Motika       | Axelrod      |
| Giovanne     | Rafkin       | Motika       | Peel         |
| Giovanne     | Rafkin       | Motika       | Serres       |
| Giovanne     | Rafkin       | Peel         | Axelrod      |
| Giovanne     | Rafkin       | Peel         | Motika       |
| Giovanne     | Rafkin       | Peel         | Serres       |
| Giovanne     | Rafkin       | Serres       | Axelrod      |
| Giovanne     | Rafkin       | Serres       | Motika       |
| Giovanne     | Rafkin       | Serres       | Peel         |
| Giovanne     | Serres       | Axelrod      | Motika       |
| Giovanne     | Serres       | Axelrod      | Peel         |
| Giovanne     | Serres       | Axelrod      | Rafkin       |
| Giovanne     | Serres       | Motika       | Axelrod      |
| Giovanne     | Serres       | Motika       | Peel         |
| Giovanne     | Serres       | Motika       | Rafkin       |
| Giovanne     | Serres       | Peel         | Axelrod      |
| Giovanne     | Serres       | Peel         | Motika       |
| Giovanne     | Serres       | Peel         | Rafkin       |
| Giovanne     | Serres       | Rafkin       | Axelrod      |
| Giovanne     | Serres       | Rafkin       | Motika       |
| Giovanne     | Serres       | Rafkin       | Peel         |
| Grass        | Axelrod      | Motika       | Peel         |
| Grass        | Axelrod      | Motika       | Rafkin       |
| Grass        | Axelrod      | Motika       | Serres       |
| Grass        | Axelrod      | Peel         | Motika       |
| Grass        | Axelrod      | Peel         | Rafkin       |
| Grass        | Axelrod      | Peel         | Serres       |
| Grass        | Axelrod      | Rafkin       | Motika       |
| Grass        | Axelrod      | Rafkin       | Peel         |
| Grass        | Axelrod      | Rafkin       | Serres       |
| Grass        | Axelrod      | Serres       | Motika       |
| Grass        | Axelrod      | Serres       | Peel         |
| Grass        | Axelrod      | Serres       | Rafkin       |
| Grass        | Motika       | Axelrod      | Peel         |
| Grass        | Motika       | Axelrod      | Rafkin       |
| Grass        | Motika       | Axelrod      | Serres       |
| Grass        | Motika       | Peel         | Axelrod      |
| Grass        | Motika       | Peel         | Rafkin       |
| Grass        | Motika       | Peel         | Serres       |
| Grass        | Motika       | Rafkin       | Axelrod      |
| Grass        | Motika       | Rafkin       | Peel         |
| Grass        | Motika       | Rafkin       | Serres       |
| Grass        | Motika       | Serres       | Axelrod      |
| Grass        | Motika       | Serres       | Peel         |
| Grass        | Motika       | Serres       | Rafkin       |
| Grass        | Peel         | Axelrod      | Motika       |
| Grass        | Peel         | Axelrod      | Rafkin       |
| Grass        | Peel         | Axelrod      | Serres       |
| Grass        | Peel         | Motika       | Axelrod      |
| Grass        | Peel         | Motika       | Rafkin       |
| Grass        | Peel         | Motika       | Serres       |
| Grass        | Peel         | Rafkin       | Axelrod      |
| Grass        | Peel         | Rafkin       | Motika       |
| Grass        | Peel         | Rafkin       | Serres       |
| Grass        | Peel         | Serres       | Axelrod      |
| Grass        | Peel         | Serres       | Motika       |
| Grass        | Peel         | Serres       | Rafkin       |
| Grass        | Rafkin       | Axelrod      | Motika       |
| Grass        | Rafkin       | Axelrod      | Peel         |
| Grass        | Rafkin       | Axelrod      | Serres       |
| Grass        | Rafkin       | Motika       | Axelrod      |
| Grass        | Rafkin       | Motika       | Peel         |
| Grass        | Rafkin       | Motika       | Serres       |
| Grass        | Rafkin       | Peel         | Axelrod      |
| Grass        | Rafkin       | Peel         | Motika       |
| Grass        | Rafkin       | Peel         | Serres       |
| Grass        | Rafkin       | Serres       | Axelrod      |
| Grass        | Rafkin       | Serres       | Motika       |
| Grass        | Rafkin       | Serres       | Peel         |
| Grass        | Serres       | Axelrod      | Motika       |
| Grass        | Serres       | Axelrod      | Peel         |
| Grass        | Serres       | Axelrod      | Rafkin       |
| Grass        | Serres       | Motika       | Axelrod      |
| Grass        | Serres       | Motika       | Peel         |
| Grass        | Serres       | Motika       | Rafkin       |
| Grass        | Serres       | Peel         | Axelrod      |
| Grass        | Serres       | Peel         | Motika       |
| Grass        | Serres       | Peel         | Rafkin       |
| Grass        | Serres       | Rafkin       | Axelrod      |
| Grass        | Serres       | Rafkin       | Motika       |
| Grass        | Serres       | Rafkin       | Peel         |
| Hoffman      | Axelrod      | Motika       | Peel         |
| Hoffman      | Axelrod      | Motika       | Rafkin       |
| Hoffman      | Axelrod      | Motika       | Serres       |
| Hoffman      | Axelrod      | Peel         | Motika       |
| Hoffman      | Axelrod      | Peel         | Rafkin       |
| Hoffman      | Axelrod      | Peel         | Serres       |
| Hoffman      | Axelrod      | Rafkin       | Motika       |
| Hoffman      | Axelrod      | Rafkin       | Peel         |
| Hoffman      | Axelrod      | Rafkin       | Serres       |
| Hoffman      | Axelrod      | Serres       | Motika       |
| Hoffman      | Axelrod      | Serres       | Peel         |
| Hoffman      | Axelrod      | Serres       | Rafkin       |
| Hoffman      | Motika       | Axelrod      | Peel         |
| Hoffman      | Motika       | Axelrod      | Rafkin       |
| Hoffman      | Motika       | Axelrod      | Serres       |
| Hoffman      | Motika       | Peel         | Axelrod      |
| Hoffman      | Motika       | Peel         | Rafkin       |
| Hoffman      | Motika       | Peel         | Serres       |
| Hoffman      | Motika       | Rafkin       | Axelrod      |
| Hoffman      | Motika       | Rafkin       | Peel         |
| Hoffman      | Motika       | Rafkin       | Serres       |
| Hoffman      | Motika       | Serres       | Axelrod      |
| Hoffman      | Motika       | Serres       | Peel         |
| Hoffman      | Motika       | Serres       | Rafkin       |
| Hoffman      | Peel         | Axelrod      | Motika       |
| Hoffman      | Peel         | Axelrod      | Rafkin       |
| Hoffman      | Peel         | Axelrod      | Serres       |
| Hoffman      | Peel         | Motika       | Axelrod      |
| Hoffman      | Peel         | Motika       | Rafkin       |
| Hoffman      | Peel         | Motika       | Serres       |
| Hoffman      | Peel         | Rafkin       | Axelrod      |
| Hoffman      | Peel         | Rafkin       | Motika       |
| Hoffman      | Peel         | Rafkin       | Serres       |
| Hoffman      | Peel         | Serres       | Axelrod      |
| Hoffman      | Peel         | Serres       | Motika       |
| Hoffman      | Peel         | Serres       | Rafkin       |
| Hoffman      | Rafkin       | Axelrod      | Motika       |
| Hoffman      | Rafkin       | Axelrod      | Peel         |
| Hoffman      | Rafkin       | Axelrod      | Serres       |
| Hoffman      | Rafkin       | Motika       | Axelrod      |
| Hoffman      | Rafkin       | Motika       | Peel         |
| Hoffman      | Rafkin       | Motika       | Serres       |
| Hoffman      | Rafkin       | Peel         | Axelrod      |
| Hoffman      | Rafkin       | Peel         | Motika       |
| Hoffman      | Rafkin       | Peel         | Serres       |
| Hoffman      | Rafkin       | Serres       | Axelrod      |
| Hoffman      | Rafkin       | Serres       | Motika       |
| Hoffman      | Rafkin       | Serres       | Peel         |
| Hoffman      | Serres       | Axelrod      | Motika       |
| Hoffman      | Serres       | Axelrod      | Peel         |
| Hoffman      | Serres       | Axelrod      | Rafkin       |
| Hoffman      | Serres       | Motika       | Axelrod      |
| Hoffman      | Serres       | Motika       | Peel         |
| Hoffman      | Serres       | Motika       | Rafkin       |
| Hoffman      | Serres       | Peel         | Axelrod      |
| Hoffman      | Serres       | Peel         | Motika       |
| Hoffman      | Serres       | Peel         | Rafkin       |
| Hoffman      | Serres       | Rafkin       | Axelrod      |
| Hoffman      | Serres       | Rafkin       | Motika       |
| Hoffman      | Serres       | Rafkin       | Peel         |
| Liu          | Axelrod      | Motika       | Peel         |
| Liu          | Axelrod      | Motika       | Rafkin       |
| Liu          | Axelrod      | Motika       | Serres       |
| Liu          | Axelrod      | Peel         | Motika       |
| Liu          | Axelrod      | Peel         | Rafkin       |
| Liu          | Axelrod      | Peel         | Serres       |
| Liu          | Axelrod      | Rafkin       | Motika       |
| Liu          | Axelrod      | Rafkin       | Peel         |
| Liu          | Axelrod      | Rafkin       | Serres       |
| Liu          | Axelrod      | Serres       | Motika       |
| Liu          | Axelrod      | Serres       | Peel         |
| Liu          | Axelrod      | Serres       | Rafkin       |
| Liu          | Motika       | Axelrod      | Peel         |
| Liu          | Motika       | Axelrod      | Rafkin       |
| Liu          | Motika       | Axelrod      | Serres       |
| Liu          | Motika       | Peel         | Axelrod      |
| Liu          | Motika       | Peel         | Rafkin       |
| Liu          | Motika       | Peel         | Serres       |
| Liu          | Motika       | Rafkin       | Axelrod      |
| Liu          | Motika       | Rafkin       | Peel         |
| Liu          | Motika       | Rafkin       | Serres       |
| Liu          | Motika       | Serres       | Axelrod      |
| Liu          | Motika       | Serres       | Peel         |
| Liu          | Motika       | Serres       | Rafkin       |
| Liu          | Peel         | Axelrod      | Motika       |
| Liu          | Peel         | Axelrod      | Rafkin       |
| Liu          | Peel         | Axelrod      | Serres       |
| Liu          | Peel         | Motika       | Axelrod      |
| Liu          | Peel         | Motika       | Rafkin       |
| Liu          | Peel         | Motika       | Serres       |
| Liu          | Peel         | Rafkin       | Axelrod      |
| Liu          | Peel         | Rafkin       | Motika       |
| Liu          | Peel         | Rafkin       | Serres       |
| Liu          | Peel         | Serres       | Axelrod      |
| Liu          | Peel         | Serres       | Motika       |
| Liu          | Peel         | Serres       | Rafkin       |
| Liu          | Rafkin       | Axelrod      | Motika       |
| Liu          | Rafkin       | Axelrod      | Peel         |
| Liu          | Rafkin       | Axelrod      | Serres       |
| Liu          | Rafkin       | Motika       | Axelrod      |
| Liu          | Rafkin       | Motika       | Peel         |
| Liu          | Rafkin       | Motika       | Serres       |
| Liu          | Rafkin       | Peel         | Axelrod      |
| Liu          | Rafkin       | Peel         | Motika       |
| Liu          | Rafkin       | Peel         | Serres       |
| Liu          | Rafkin       | Serres       | Axelrod      |
| Liu          | Rafkin       | Serres       | Motika       |
| Liu          | Rafkin       | Serres       | Peel         |
| Liu          | Serres       | Axelrod      | Motika       |
| Liu          | Serres       | Axelrod      | Peel         |
| Liu          | Serres       | Axelrod      | Rafkin       |
| Liu          | Serres       | Motika       | Axelrod      |
| Liu          | Serres       | Motika       | Peel         |
| Liu          | Serres       | Motika       | Rafkin       |
| Liu          | Serres       | Peel         | Axelrod      |
| Liu          | Serres       | Peel         | Motika       |
| Liu          | Serres       | Peel         | Rafkin       |
| Liu          | Serres       | Rafkin       | Axelrod      |
| Liu          | Serres       | Rafkin       | Motika       |
| Liu          | Serres       | Rafkin       | Peel         |
| Pereira      | Axelrod      | Motika       | Peel         |
| Pereira      | Axelrod      | Motika       | Rafkin       |
| Pereira      | Axelrod      | Motika       | Serres       |
| Pereira      | Axelrod      | Peel         | Motika       |
| Pereira      | Axelrod      | Peel         | Rafkin       |
| Pereira      | Axelrod      | Peel         | Serres       |
| Pereira      | Axelrod      | Rafkin       | Motika       |
| Pereira      | Axelrod      | Rafkin       | Peel         |
| Pereira      | Axelrod      | Rafkin       | Serres       |
| Pereira      | Axelrod      | Serres       | Motika       |
| Pereira      | Axelrod      | Serres       | Peel         |
| Pereira      | Axelrod      | Serres       | Rafkin       |
| Pereira      | Motika       | Axelrod      | Peel         |
| Pereira      | Motika       | Axelrod      | Rafkin       |
| Pereira      | Motika       | Axelrod      | Serres       |
| Pereira      | Motika       | Peel         | Axelrod      |
| Pereira      | Motika       | Peel         | Rafkin       |
| Pereira      | Motika       | Peel         | Serres       |
| Pereira      | Motika       | Rafkin       | Axelrod      |
| Pereira      | Motika       | Rafkin       | Peel         |
| Pereira      | Motika       | Rafkin       | Serres       |
| Pereira      | Motika       | Serres       | Axelrod      |
| Pereira      | Motika       | Serres       | Peel         |
| Pereira      | Motika       | Serres       | Rafkin       |
| Pereira      | Peel         | Axelrod      | Motika       |
| Pereira      | Peel         | Axelrod      | Rafkin       |
| Pereira      | Peel         | Axelrod      | Serres       |
| Pereira      | Peel         | Motika       | Axelrod      |
| Pereira      | Peel         | Motika       | Rafkin       |
| Pereira      | Peel         | Motika       | Serres       |
| Pereira      | Peel         | Rafkin       | Axelrod      |
| Pereira      | Peel         | Rafkin       | Motika       |
| Pereira      | Peel         | Rafkin       | Serres       |
| Pereira      | Peel         | Serres       | Axelrod      |
| Pereira      | Peel         | Serres       | Motika       |
| Pereira      | Peel         | Serres       | Rafkin       |
| Pereira      | Rafkin       | Axelrod      | Motika       |
| Pereira      | Rafkin       | Axelrod      | Peel         |
| Pereira      | Rafkin       | Axelrod      | Serres       |
| Pereira      | Rafkin       | Motika       | Axelrod      |
| Pereira      | Rafkin       | Motika       | Peel         |
| Pereira      | Rafkin       | Motika       | Serres       |
| Pereira      | Rafkin       | Peel         | Axelrod      |
| Pereira      | Rafkin       | Peel         | Motika       |
| Pereira      | Rafkin       | Peel         | Serres       |
| Pereira      | Rafkin       | Serres       | Axelrod      |
| Pereira      | Rafkin       | Serres       | Motika       |
| Pereira      | Rafkin       | Serres       | Peel         |
| Pereira      | Serres       | Axelrod      | Motika       |
| Pereira      | Serres       | Axelrod      | Peel         |
| Pereira      | Serres       | Axelrod      | Rafkin       |
| Pereira      | Serres       | Motika       | Axelrod      |
| Pereira      | Serres       | Motika       | Peel         |
| Pereira      | Serres       | Motika       | Rafkin       |
| Pereira      | Serres       | Peel         | Axelrod      |
| Pereira      | Serres       | Peel         | Motika       |
| Pereira      | Serres       | Peel         | Rafkin       |
| Pereira      | Serres       | Rafkin       | Axelrod      |
| Pereira      | Serres       | Rafkin       | Motika       |
| Pereira      | Serres       | Rafkin       | Peel         |
+------+-------+----------+--------+------+


--39. Display all customers located in cities where salesman serres has customer.
Query:
Select cname
from cust
where city = ( select city from cust, salespeople where cust.snum = salespeople.snum and  sname = 'Serres');

Select cname
from cust
where city in ( select city from cust, orders where cust.cnum = orders.cnum and
                orders.snum in ( select snum from salespeople where sname = 'Serres'));


Output:
+------+-------+----------+--------+------+
| CNUM | CNAME | CITY     | RATING | SNUM |
+------+-------+----------+--------+------+
| 2003 | Liu   | San Jose |    300 | 1002 |
| 2004 | Grass | Berlin   |    100 | 1002 |
+------+-------+----------+--------+------+

--40. Find all pairs of customers served by single salesperson.
Query:
Select cname from cust
 where snum in (select snum from cust
                group by snum
                having count(snum) > 1);

Select distinct a.cname
from cust a ,cust b
where a.snum = b.snum and a.rowid != b.rowid;

Output:
+-------+
| cname |
+-------+
| Liu   |
| Grass |
+-------+
--41. Produce all pairs of salespeople which are living in the same city. Exclude combinations of salespeople with themselves as well as duplicates with the order reversed.
Query:
Select a.sname, b.sname
from salespeople a, salespeople b
where a.snum > b.snum and
      a.city = b.city;

output :
 +--------+-------+
| sname  | sname |
+--------+-------+
| Motika | Peel  |
+--------+-------+

--42.Produce all pairs of orders by given customer, names that customers and eliminates duplicates.
Query:
Select c.cname, a.onum, b.onum
from orders a, orders b, cust c
where a.cnum = b.cnum and a.onum > b.onum and c.cnum = a.cnum;

output :
+---------+------+------+
| cname   | onum | onum |
+---------+------+------+
| Grass   | 3010 | 3007 |
| Clemens | 3011 | 3008 |
+---------+------+------+

--43. Produce names and cities of all customers with the same rating as Hoffman.
Query:
Select cname, city
from cust
where rating = (select rating from cust where cname = 'Hoffman')
and cname != 'Hoffman';

output :
+---------+--------+
| cname   | city   |
+---------+--------+
| Grass   | Berlin |
| Pereira | Rome   |
+---------+--------+

--44. Extract all the orders of Motika.
Query:
SELECT o.*
FROM ORDERS o
JOIN SALESPEOPLE s ON o.SNUM = s.SNUM
WHERE s.SNAME = 'Motika';

output :
+------+---------+------------+------+------+
| ONUM | AMT     | ODATE      | CNUM | SNUM |
+------+---------+------------+------+------+
| 3002 | 1900.10 | 1994-10-03 | 2007 | 1004 |
+------+---------+------------+------+------+

--45.All orders credited to the same salesperson who services Hoffman.
Query:
Select onum, sname, cname, amt
from orders a, salespeople b, cust c
where a.snum = b.snum and a.cnum = c.cnum and a.snum = ( select snum from orders
                where cnum = ( select cnum from cust where cname = 'Hoffman'));

output :
+------+-------+---------+---------+
| onum | sname | cname   | amt     |
+------+-------+---------+---------+
| 3003 | Peel  | Hoffman |  767.19 |
| 3008 | Peel  | Clemens | 4723.00 |
| 3011 | Peel  | Clemens | 9891.88 |
+------+-------+---------+---------+

--46. All orders that are greater than the average for Oct 4.
Query:
SELECT *
FROM ORDERS
WHERE AMT > (SELECT AVG(AMT) FROM ORDERS WHERE ODATE = '1994-10-04')
AND ODATE = '1994-10-04';WHERE SUBSTR(CNAME, 1, 1) BETWEEN 'A' AND 'B';

Output:
+------+---------+------------+------+------+
| ONUM | AMT     | ODATE      | CNUM | SNUM |
+------+---------+------------+------+------+
| 3009 | 1713.23 | 1994-10-04 | 2002 | 1003 |
+------+---------+------------+------+------+


--47. Find average commission of salespeople in london.
Query:
Select avg(comm)
from salespeople
where city = ‘London’;

output :
+-------------------+
| AverageCommission |
+-------------------+
|          0.115000 |
+-------------------+

--48. Find all orders attributed to salespeople servicing customers in london.
Query:
Select snum, cnum
from orders
where cnum in (select cnum from cust where city = 'London');

output :
+------+------+
| snum | cnum |
+------+------+
| 1001 | 2001 |
| 1001 | 2006 |
| 1001 | 2006 |
+------+------+

--49. Extract commissions of all salespeople servicing customers in London.
Query:
SELECT DISTINCT s.COMM
FROM SALESPEOPLE s
JOIN CUST c ON s.SNUM = c.SNUM
WHERE c.CITY = 'London';

output :
+------+
| COMM |
+------+
| 0.12 |
| 0.15 |
+------+

--50. Find all customers whose cnum is 1000 above the snum of serres.
Query:
Select cnum, cname from cust
where cnum > ( select snum+1000 from salespeople where sname = 'Serres');

output :
+------+---------+
| cnum | cname   |
+------+---------+
| 2003 | Liu     |
| 2004 | Grass   |
| 2006 | Clemens |
| 2007 | Pereira |
+------+---------+

--51. Count the customers with rating  above San Jose’s average.
Query:
Select cnum, rating
from cust
where rating > ( select avg(rating) from cust where city = 'San Jose');

Output:
count(*)
0

--52.Obtain all orders for the customer named Cisnerous.(Assume you don’t know his customer no. (cnum)).
Query:
SELECT O.* FROM ORDERS O
JOIN CUST C ON O.CNUM = C.CNUM
WHERE C.CNAME = 'Clemens';

output:
+------+---------+------------+------+------+
| ONUM | AMT     | ODATE      | CNUM | SNUM |
+------+---------+------------+------+------+
| 3008 | 4723.00 | 1994-10-05 | 2006 | 1001 |
| 3011 | 9891.88 | 1994-10-06 | 2006 | 1001 |
+------+---------+------------+------+------+

--53 Produce the names and rating of all customers who have above average orders.
Query:
SELECT c.CNAME, c.RATING
FROM CUST c
JOIN ORDERS o ON c.CNUM = o.CNUM
WHERE o.AMT > (SELECT AVG(AMT) FROM ORDERS);

Output:
+---------+--------+
| CNAME   | RATING |
+---------+--------+
| Liu     |    300 |
| Clemens |    300 |
| Clemens |    300 |
+---------+--------+

--54.Find total amount in orders for each salesperson for whom this total is greater than the amount of the largest order in the table.
Query:
SELECT s.SNAME, SUM(o.AMT) AS TotalSales
FROM SALESPEOPLE s
JOIN ORDERS o ON s.SNUM = o.SNUM
GROUP BY s.SNAME
HAVING SUM(o.AMT) > (SELECT MAX(AMT) FROM ORDERS);

Output:
+-------+------------+
| SNAME | TotalSales |
+-------+------------+
| Peel  |   15382.07 |
+-------+------------+

--55.Find all customers with order on 3rd Oct.
Query:
SELECT c.*
FROM CUST c
JOIN ORDERS o ON c.CNUM = o.CNUM
WHERE o.ODATE = '1994-10-03';

Output:
+------+---------+----------+--------+------+
| CNUM | CNAME   | CITY     | RATING | SNUM |
+------+---------+----------+--------+------+
| 2007 | Pereira | Rome     |    100 | 1004 |
| 2001 | Hoffman | London   |    100 | 1001 |
| 2003 | Liu     | San Jose |    300 | 1002 |
+------+---------+----------+--------+------+

--56.Find names and numbers of all salesperson who have more than one customer.
Query:
SELECT s.SNAME, s.SNUM
FROM SALESPEOPLE s
JOIN CUST c ON s.SNUM = c.SNUM
GROUP BY s.SNUM, s.SNAME
HAVING COUNT(c.CNUM) > 1;

Output:
+--------+------+
| SNAME  | SNUM |
+--------+------+
| Serres | 1002 |
+--------+------+

--57.Check if the correct salesperson was credited with each sale.
Query:
SELECT
    o.ONUM,
    o.SNUM AS Order_Salesperson,
    c.SNUM AS Customer_Salesperson,
    CASE WHEN o.SNUM = c.SNUM THEN 'Correct'
    ELSE 'Incorrect'
    END AS Credit_Check FROM ORDERS o JOIN
    CUST c ON o.CNUM = c.CNUM;

Output:
+------+-------------------+----------------------+--------------+
| ONUM | Order_Salesperson | Customer_Salesperson | Credit_Check |
+------+-------------------+----------------------+--------------+
| 3002 |              1004 |                 1004 | Correct      |
| 3003 |              1001 |                 1001 | Correct      |
| 3005 |              1002 |                 1002 | Correct      |
| 3007 |              1002 |                 1002 | Correct      |
| 3008 |              1001 |                 1007 | Incorrect    |
| 3009 |              1003 |                 1003 | Correct      |
| 3010 |              1002 |                 1002 | Correct      |
| 3011 |              1001 |                 1007 | Incorrect    |
+------+-------------------+----------------------+--------------+

--58.Find all orders with above average amounts for their customers.
Query:
SELECT o.*
FROM ORDERS o
WHERE o.AMT > (
    SELECT AVG(o2.AMT)
    FROM ORDERS o2
    WHERE o2.CNUM = o.CNUM
);

Output:
+------+---------+------------+------+------+
| ONUM | AMT     | ODATE      | CNUM | SNUM |
+------+---------+------------+------+------+
| 3006 | 1098.16 | 1994-10-04 | 2008 | 1007 |
| 3010 | 1309.95 | 1994-10-06 | 2004 | 1002 |
| 3011 | 9891.88 | 1994-10-06 | 2006 | 1001 |
+------+---------+------------+------+------+

--59.Find the sums of the amounts from order table grouped by date, eliminating all those dates where the sum was not at least 2000 above the maximum amount.
Query:
SELECT ODATE,SUM(AMT) AS TotalAmount
FROM orders
GROUP BY ODATE
HAVING SUM(AMT) >= (SELECT MAX(AMT) FROM orders) + 2000;

Output:
Program did not output anything!

--60 Find names and numbers of all customers with ratings equal to the maximum for their city.
Query:
SELECT c.CNAME, c.CNUM
FROM CUST c
WHERE c.RATING = (
    SELECT MAX(c2.RATING)
    FROM CUST c2
    WHERE c2.CITY = c.CITY);

OUTPUT:
+----------+------+
| CNAME    | CNUM |
+----------+------+
| Giovanne | 2002 |
| Liu      | 2003 |
| Grass    | 2004 |
| Clemens  | 2006 |
+----------+------+

--61 Find all salespeople who have customers in their cities who they don’t service. ( Both way using Join and Correlated subquery.)
Query:
SELECT DISTINCT s.SNAME
FROM SALESPEOPLE s
JOIN CUST c ON s.CITY = c.CITY
WHERE s.SNUM <> c.SNUM;

OUTPUT:
+--------+
| SNAME  |
+--------+
| Motika |
| Peel   |
+--------+

--62 Extract cnum,cname and city from customer table if and only if one or more of the customers in the table are located in San Jose.
Query:
SELECT cnum, cname, city
FROM CUST
WHERE EXISTS (SELECT 1 FROM CUST WHERE city = 'San Jose');

OUTPUT:
+------+----------+----------+
| cnum | cname    | city     |
+------+----------+----------+
| 2001 | Hoffman  | London   |
| 2002 | Giovanne | Rome     |
| 2003 | Liu      | San Jose |
| 2004 | Grass    | Berlin   |
| 2006 | Clemens  | London   |
| 2007 | Pereira  | Rome     |
+------+----------+----------+

--63 Find salespeople no. who have multiple customers
Query:
SELECT SNUM
FROM CUST
GROUP BY SNUM
HAVING COUNT(CNUM) > 1;

OUTPUT:
+------+
| SNUM |
+------+
| 1002 |
+------+

--64 Find salespeople number, name and city who have multiple customers.
Query:
SELECT s.SNUM, s.SNAME, s.CITY
FROM SALESPEOPLE s
JOIN CUST c ON s.SNUM = c.SNUM
GROUP BY s.SNUM, s.SNAME, s.CITY
HAVING COUNT(c.CNUM) > 1;

OUTPUT:
+------+--------+----------+
| SNUM | SNAME  | CITY     |
+------+--------+----------+
| 1002 | Serres | San Jose |
+------+--------+----------+

--65 Find salespeople who serve only one customer.
Query:
SELECT s.SNUM, s.SNAME, s.CITY
FROM SALESPEOPLE s
JOIN CUST c ON s.SNUM = c.SNUM
GROUP BY s.SNUM, s.SNAME, s.CITY
HAVING COUNT(c.CNUM) = 1;

OUTPUT:
+------+---------+-----------+
| SNUM | SNAME   | CITY      |
+------+---------+-----------+
| 1001 | Peel    | London    |
| 1003 | Axelrod | New york  |
| 1007 | Rafkin  | Barcelona |
| 1004 | Motika  | London    |
+------+---------+-----------+

--66 Extract rows of all salespeople with more than one current order.
Query:
SELECT s.*
FROM SALESPEOPLE s
WHERE s.SNUM IN (
    SELECT SNUM
    FROM ORDERS
    GROUP BY SNUM
    HAVING COUNT(NUM) > 1
);

OUTPUT:
+------+--------+-----------+------+
| SNUM | SNAME  | CITY      | COMM |
+------+--------+-----------+------+
| 1001 | Peel   | London    | 0.12 |
| 1002 | Serres | San Jose  | 0.13 |
| 1007 | Rafkin | Barcelona | 0.15 |
+------+--------+-----------+------+

--67 Find all salespeople who have customers with a rating of 300. (use EXISTS)
Query:
SELECT s.*
FROM SALESPEOPLE s
WHERE EXISTS (
    SELECT 1
    FROM CUST c
    WHERE c.SNUM = s.SNUM
      AND c.RATING = 300
);

OUTPUT:
+------+--------+-----------+------+
| SNUM | SNAME  | CITY      | COMM |
+------+--------+-----------+------+
| 1002 | Serres | San Jose  | 0.13 |
| 1007 | Rafkin | Barcelona | 0.15 |
+------+--------+-----------+------+

--68 Find all salespeople who have customers with a rating of 300. (use Join).
Query:
SELECT DISTINCT s.*
FROM SALESPEOPLE s
JOIN CUST c ON s.SNUM = c.SNUM
WHERE c.RATING = 300;

OUTPUT:
+------+--------+-----------+------+
| SNUM | SNAME  | CITY      | COMM |
+------+--------+-----------+------+
| 1002 | Serres | San Jose  | 0.13 |
| 1007 | Rafkin | Barcelona | 0.15 |
+------+--------+-----------+------+

--69 Select all salespeople with customers located in their cities who are not assigned to them. (use EXISTS).
Query:
SELECT s.*
FROM SALESPEOPLE s
WHERE EXISTS (
    SELECT 1
    FROM CUST c
    WHERE c.CITY = s.CITY
      AND c.SNUM <> s.SNUM
);

OUTPUT:
+------+--------+--------+------+
| SNUM | SNAME  | CITY   | COMM |
+------+--------+--------+------+
| 1001 | Peel   | London | 0.12 |
| 1004 | Motika | London | 0.11 |
+------+--------+--------+------+

--70 Extract from customers table every customer assigned the a salesperson who currently has at least one other customer ( besides the customer being selected) with orders in order table.
Query:
SELECT c1.*
FROM CUST c1
WHERE EXISTS (
    SELECT 1
    FROM CUST c2
    JOIN ORDERS o ON c2.CNUM = o.CNUM
    WHERE c2.SNUM = c1.SNUM
      AND c2.CNUM <> c1.CNUM
);

OUTPUT:
+------+-------+----------+--------+------+
| CNUM | CNAME | CITY     | RATING | SNUM |
+------+-------+----------+--------+------+
| 2004 | Grass | Berlin   |    100 | 1002 |
| 2003 | Liu   | San Jose |    300 | 1002 |
+------+-------+----------+--------+------+


--71.Find salespeople with customers located in their cities ( using both ANY and IN).
-- Using ANY:

Query:
SELECT s.*
FROM SALESPEOPLE s
WHERE s.SNUM = ANY (
    SELECT c.SNUM
    FROM CUST c
    WHERE c.CITY = s.CITY
);

Output:
SNUM        SNAME                                              CITY                                               COMM
----------- -------------------------------------------------- -------------------------------------------------- ------
       1001 Peel                                               London                                                .12
       1002 Serres                                             San Jose                                              .13

-- Using IN:
SELECT s.*
FROM SALESPEOPLE s
WHERE s.SNUM IN (
    SELECT c.SNUM
    FROM CUST c
    WHERE c.CITY = s.CITY
);

Output:
SNUM        SNAME                                              CITY                                               COMM
----------- -------------------------------------------------- -------------------------------------------------- ------
       1001 Peel                                               London                                                .12
       1002 Serres                                             San Jose                                              .13


--72.Find all salespeople for whom there are customers that follow them in alphabetical order. (Using ANY and EXISTS)
-- Using ANY:
Query:
SELECT s1.*
FROM SALESPEOPLE s1
WHERE s1.SNAME = ANY (
    SELECT s2.SNAME
    FROM SALESPEOPLE s2
    JOIN CUST c ON s2.SNUM = c.SNUM
    WHERE s2.SNAME < c.CNAME
);

Output:
SNUM        SNAME                                              CITY                                               COMM
----------- -------------------------------------------------- -------------------------------------------------- ------
       1003 Axelrod                                            New york                                              .10
       1004 Motika                                             London                                                .11

-- Using EXISTS:
SELECT s1.*
FROM SALESPEOPLE s1
WHERE EXISTS (
    SELECT 1
    FROM SALESPEOPLE s2
    JOIN CUST c ON s2.SNUM = c.SNUM
    WHERE s1.SNAME = s2.SNAME
      AND s2.SNAME < c.CNAME
);

Output:
SNUM        SNAME                                              CITY                                               COMM
----------- -------------------------------------------------- -------------------------------------------------- ------
       1003 Axelrod                                            New york                                              .10
       1004 Motika                                             London                                                .11



--73.Select customers who have a greater rating than any customer in rome.
Query:
SELECT *
FROM CUST
WHERE RATING > ANY (SELECT RATING FROM CUST WHERE CITY = 'Rome');

Output:
CNUM        CNAME                                              CITY                                               RATING      SNUM
----------- -------------------------------------------------- -------------------------------------------------- ----------- -----------
       2002 Giovanne                                           Rome                                                       200        1003
       2003 Liu                                                San Jose                                                   300        1002
       2006 Clemens                                            London                                                     300        1007


--74.Select all orders that had amounts that were greater that atleast one of the orders from Oct 6th.
Query:
SELECT *
FROM ORDERS
WHERE AMT > ANY (SELECT AMT FROM ORDERS WHERE ODATE = '1994-10-06');

Output:
ONUM        AMT          ODATE            CNUM        SNUM
----------- ------------ ---------------- ----------- -----------
       3002      1900.10       1994-10-03        2007        1004
       3005      5160.45       1994-10-03        2003        1002
       3008      4723.00       1994-10-05        2006        1001
       3009      1713.23       1994-10-04        2002        1003
       3011      9891.88       1994-10-06        2006        1001


--75.Find all orders with amounts smaller than any amount for a customer in San Jose. (Both using ANY and without ANY)
Query:
-- Using ANY:
SELECT *
FROM ORDERS
WHERE AMT < ANY (
    SELECT AMT
    FROM ORDERS o
    JOIN CUST c ON o.CNUM = c.CNUM
    WHERE c.CITY = 'San Jose'
);

Output:
ONUM        AMT          ODATE            CNUM        SNUM
----------- ------------ ---------------- ----------- -----------
       3001        18.69       1994-10-03        2008        1007
       3002      1900.10       1994-10-03        2007        1004
       3003       767.19       1994-10-03        2001        1001
       3006      1098.16       1994-10-04        2008        1007
       3007        75.75       1994-10-05        2004        1002
       3008      4723.00       1994-10-05        2006        1001
       3009      1713.23       1994-10-04        2002        1003
       3010      1309.95       1994-10-06        2004        1002
-- Without ANY (using subquery with MIN):
SELECT *
FROM ORDERS
WHERE AMT < (
    SELECT MIN(AMT)
    FROM ORDERS o
    JOIN CUST c ON o.CNUM = c.CNUM
    WHERE c.CITY = 'San Jose'
);

Output:
ONUM        AMT          ODATE            CNUM        SNUM
----------- ------------ ---------------- ----------- -----------
       3001        18.69       1994-10-03        2008        1007
       3002      1900.10       1994-10-03        2007        1004
       3003       767.19       1994-10-03        2001        1001
       3006      1098.16       1994-10-04        2008        1007
       3007        75.75       1994-10-05        2004        1002
       3008      4723.00       1994-10-05        2006        1001
       3009      1713.23       1994-10-04        2002        1003
       3010      1309.95       1994-10-06        2004        1002

--76.Select those customers whose ratings are higher than every customer in Paris. ( Using both ALL and NOT EXISTS).
-- Using ALL:
Query:
SELECT *
FROM CUST
WHERE RATING > ALL (SELECT RATING FROM CUST WHERE CITY = 'Paris');

Output:
CNUM        CNAME                                              CITY                                               RATING      SNUM
----------- -------------------------------------------------- -------------------------------------------------- ----------- -----------
       2001 Hoffman                                            London                                                     100        1001
       2002 Giovanne                                           Rome                                                       200        1003
       2003 Liu                                                San Jose                                                   300        1002
       2004 Grass                                              Berlin                                                     100        1002
       2006 Clemens                                            London                                                     300        1007
       2007 Pereira                                            Rome                                                       100        1004
-- Using NOT EXISTS:
SELECT c1.*
FROM CUST c1
WHERE NOT EXISTS (
    SELECT 1
    FROM CUST c2
    WHERE c2.CITY = 'Paris'
      AND c2.RATING >= c1.RATING
);

Output:
CNUM        CNAME                                              CITY                                               RATING      SNUM
----------- -------------------------------------------------- -------------------------------------------------- ----------- -----------
       2001 Hoffman                                            London                                                     100        1001
       2002 Giovanne                                           Rome                                                       200        1003
       2003 Liu                                                San Jose                                                   300        1002
       2004 Grass                                              Berlin                                                     100        1002
       2006 Clemens                                            London                                                     300        1007
       2007 Pereira                                            Rome                                                       100        1004

--77.Select all customers whose ratings are equal to or greater than ANY of the Seeres
Query:
SELECT CNAME FROM CUST WHERE
RATING >= (SELECT RATING FROM CUST
WHERE CNAME = 'Liu' -- Assuming 'Seeres' was meant to be 'Liu');

Output:
CNAME
--------------------------------------------------
Liu
Clemens


--78.Find all salespeople who have no customers located in their city. ( Both using ANY and ALL)
-- Using NOT EXISTS (generally preferred)
Query:
SELECT s.SNAME FROM SALESPEOPLE s
WHERE NOT EXISTS (
    SELECT 1
    FROM CUST c
    WHERE c.SNUM = s.SNUM AND c.CITY = s.CITY
);

Output:
SNAME
--------------------------------------------------
Axelrod
Motika
Rafkin

-- Using ANY (less efficient in some cases)
SELECT s.SNAME
FROM SALESPEOPLE s
WHERE s.SNUM = ANY ( SELECT s.SNUM FROM SALESPEOPLE s
WHERE NOT EXISTS (SELECT 1 FROM CUST c
WHERE c.SNUM = s.SNUM AND c.CITY = s.CITY ));

Output:
SNAME
--------------------------------------------------
Axelrod
Motika
Rafkin

--79.Find all orders for amounts greater than any for the customers in London.
Query:
SELECT *
FROM ORDERS
WHERE AMT > ANY (
    SELECT o.AMT
    FROM ORDERS o
    JOIN CUST c ON o.CNUM = c.CNUM
    WHERE c.CITY = 'London'
);

Output:
ONUM        AMT          ODATE            CNUM        SNUM
----------- ------------ ---------------- ----------- -----------
       3002      1900.10       1994-10-03        2007        1004
       3005      5160.45       1994-10-03        2003        1002
       3006      1098.16       1994-10-04        2008        1007
       3008      4723.00       1994-10-05        2006        1001
       3009      1713.23       1994-10-04        2002        1003
       3010      1309.95       1994-10-06        2004        1002
       3011      9891.88       1994-10-06        2006        1001

--80.Find all salespeople and customers located in london.
Query:
SELECT SNAME, 'Salesperson' AS Type, CITY
FROM SALESPEOPLE
WHERE CITY = 'London'
UNION ALL
SELECT CNAME,'Customer' AS Type,CITY
FROM CUST WHERE
    CITY = 'London';

Output:
SNAME                                              Type        CITY
-------------------------------------------------- ----------- --------------------------------------------------
Peel                                               Salesperson London
Motika                                             Salesperson London
Hoffman                                            Customer    London
Clemens                                            Customer    London

--81.For every salesperson, dates on which highest and lowest orders were brought.
Query:
SELECT
    s.SNAME,
    (SELECT ODATE FROM ORDERS WHERE SNUM = s.SNUM ORDER BY AMT DESC LIMIT 1) AS HighestOrderDate,
    (SELECT ODATE FROM ORDERS WHERE SNUM = s.SNUM ORDER BY AMT ASC LIMIT 1) AS LowestOrderDate
FROM SALESPEOPLE s;

Output:
SNAME                                              HighestOrderDate LowestOrderDate
-------------------------------------------------- ---------------- ----------------
Peel                                                     1994-10-06       1994-10-03
Serres                                                   1994-10-03       1994-10-05
Axelrod                                                  1994-10-04       1994-10-04
Motika                                                   1994-10-03       1994-10-03
Rafkin                                                   1994-10-04       1994-10-03

--82.List all of the salespeople and indicate those who don’t have customers in their cities as well as those who do have.
Query:
SELECT
    s.SNAME,
    s.CITY,
    CASE
        WHEN c.CNAME IS NULL THEN 'No Customers in City'
        ELSE 'Has Customers in City'
    END AS CustomerStatus
FROM
    SALESPEOPLE s
LEFT JOIN
    CUST c ON s.SNUM = c.SNUM AND s.CITY = c.CITY;

Output:
SNAME                                              CITY                                               CustomerStatus
-------------------------------------------------- -------------------------------------------------- ---------------------
Peel                                               London                                             Has Customers in City
Serres                                             San Jose                                           Has Customers in City
Axelrod                                            New york                                           No Customers in City
Motika                                             London                                             No Customers in City
Rafkin                                             Barcelona                                          No Customers in City

--83.Append strings to the selected fields, indicating weather or not a given salesperson was matched to a customer in his city.
Query:
SELECT
    s.SNAME,
    s.CITY AS SalespersonCity,
    c.CNAME AS CustomerName,
    c.CITY AS CustomerCity,
    CASE
        WHEN s.CITY = c.CITY THEN 'Matched'
        ELSE 'Not Matched'
    END AS CityMatch
FROM
    SALESPEOPLE s
LEFT JOIN
    CUST c ON s.SNUM = c.SNUM;

Output:
SNAME                                              SalespersonCity                                    CustomerName                                       CustomerCity                                       CityMatch
-------------------------------------------------- -------------------------------------------------- -------------------------------------------------- -------------------------------------------------- -----------
Peel                                               London                                             Hoffman                                            London                                             Matched
Serres                                             San Jose                                           Liu                                                San Jose                                           Matched
Serres                                             San Jose                                           Grass                                              Berlin                                             Not Matched
Axelrod                                            New york                                           Giovanne                                           Rome                                               Not Matched
Motika                                             London                                             Pereira                                            Rome                                               Not Matched
Rafkin                                             Barcelona                                          Clemens                                            London                                             Not Matched


--84.Create a union of two queries that shows the names, cities and ratings of all customers. Those with a rating of 200 or greater will also have the words ‘High Rating’, while the others will have the words ‘Low Rating’.
SELECT CNAME, CITY, RATING, 'High Rating' AS Rating_Category
Query:
FROM CUST
WHERE RATING >= 200

UNION

SELECT CNAME, CITY, RATING, 'Low Rating' AS Rating_Category
FROM CUST
WHERE RATING < 200;

Output:
CNAME                                              CITY                                               RATING      Rating_Category
-------------------------------------------------- -------------------------------------------------- ----------- ---------------
Clemens                                            London                                                     300 High Rating
Giovanne                                           Rome                                                       200 High Rating
Grass                                              Berlin                                                     100 Low Rating
Hoffman                                            London                                                     100 Low Rating
Liu                                                San Jose                                                   300 High Rating
Pereira                                            Rome                                                       100 Low Rating

--85.Write command that produces the name and number of each salesperson and each customer with more than one current order. Put the result in alphabetical order.
SELECT SNAME AS Name, SNUM AS Number
Query:
FROM SALESPEOPLE
WHERE SNUM IN (SELECT SNUM FROM ORDERS GROUP BY SNUM HAVING COUNT(*) > 1)

UNION

SELECT CNAME AS Name, CNUM AS Number
FROM CUST
WHERE CNUM IN (SELECT CNUM FROM ORDERS GROUP BY CNUM HAVING COUNT(*) > 1)

ORDER BY Name;

Output:
Name                                               Number
-------------------------------------------------- -----------
Clemens                                                   2006
Grass                                                     2004
Peel                                                      1001
Rafkin                                                    1007
Serres                                                    1002

--86.Form a union of three queries. Have the first select the snums of all salespeople in San Jose, then second the cnums of all customers in San Jose and the third the onums of all orders on Oct. 3. Retain duplicates between the last two queries, but eliminates and redundancies between either of them and the first.
Query:
SELECT SNUM
FROM SALESPEOPLE
WHERE CITY = 'San Jose'
UNION
SELECT CNUM
FROM CUST
WHERE CITY = 'San Jose'
UNION ALL
SELECT ONUM
FROM ORDERS
WHERE ODATE = '1994-10-03';

Output:
Name                                               Number
-------------------------------------------------- -----------
Clemens                                                   2006
Grass                                                     2004
Peel                                                      1001
Rafkin                                                    1007
Serres                                                    1002

--87.Produce all the salesperson in London who had at least one customer there.
Query:
SELECT s.SNAME
FROM SALESPEOPLE s
WHERE s.CITY = 'London'
AND s.SNUM IN (SELECT c.SNUM FROM CUST c WHERE c.CITY = 'London');

Output:
SNAME
--------------------------------------------------
Peel

--88.Produce all the salesperson in London who did not have customers there.
Query:
SELECT s.SNAME
FROM SALESPEOPLE s
WHERE s.CITY = 'London'
AND s.SNUM NOT IN (SELECT c.SNUM FROM CUST c WHERE c.CITY = 'London');

Output:
SNAME
--------------------------------------------------
Motika

--89.We want to see salespeople matched to their customers without excluding those salesperson who were not currently assigned to any customers. (User OUTER join and UNION)
-- Using LEFT OUTER JOIN to get all salespeople and their matching customers, including those without customers.
Query:
SELECT s.SNAME, c.CNAME
FROM SALESPEOPLE s
LEFT OUTER JOIN CUST c ON s.SNUM = c.SNUM;

Output:
SNAME                                              CNAME
-------------------------------------------------- --------------------------------------------------
Peel                                               Hoffman
Serres                                             Liu
Serres                                             Grass
Axelrod                                            Giovanne
Motika                                             Pereira
Rafkin                                             Clemens