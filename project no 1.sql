show databases;
create database project2;
show table;
use project2;
#there two tables we have with name of ("NYC1, NYC2") 
select * from NYC1;
select * from NYC2;

#1. write query to show name from NYC_1
select name from NYC1;

#2. write query to show count of id in nyc_1
select count(id) as "total ID"  from nyc1;

#3. write query to show count of id in nyc_2
select  count(id) as "Total ID" from NYC2 ; 

#4. write query to show host id in nyc_1
select host_id as "HOST ID" from NYC1;

#5. write query to show all unique host id from nyc_1
select distinct(host_id) as "only unique host id" from nyc1;

#6. write query to show all unique neighbourhood_group from nyc_1
select distinct(neighbourhood_group) from nyc1;

#7. write query to show all unique neighbourhood from nyc_1
select distinct(neighbourhood) from nyc1;

#8. write query to show room_type from nyc_1
select room_type from nyc1;


#9. write query to show all values of Brooklyn & Manhattan from nyc_1
select * from nyc1 where  neighbourhood_group = ("Brooklyn" and "Manhattan");

select * from nyc1 where  neighbourhood_group in ("Brooklyn","Manhattan");

#10. write query to show unique value of room type from nyc_1
select distinct (room_type) from nyc1;

#11. write query to show maximum price from nyc_2
select max(price) from NYC2;

#12.write query to show minimum price from nyc_2
select min(price) from NYC2;

#13. write query to show average price from nyc_2
select avg(price) from NYC2;

#14.write query to show minimum value of minimum_nights from nyc_2
select min(minimum_nights) from NYC2;

#15.write query to show maximum value of minimum_nights from nyc_2
select max(minimum_nights) from NYC2;
# & #
select price,minimum_nights from NYC2 where minimum_nights=(select max(minimum_nights) from NYC2);

#16. write query to show average availability_365
select avg(availability_365) from NYC2;

#17.write query to show id , availability_365 and all  show id , availability_365 value is greater than 300
select  id , availability_365 from NYC2 where availability_365 >300;

#18. write query to show count of id where price is in between 300 to 400
select count(id) as"Total IDs where price between300 & 400" from NYC2  where price between 300 and 400;

#19. write query to show count of id where minimum_nights spend is less than 5
select count(id)as"Total IDs with nights<5" from NYC2  where minimum_nights <5;

#20.write query to show count where minimum_nights spend is greater than 100
select count(id) from NYC2  where minimum_nights > 100;

#21. write query to show all data of nyc_1 & nyc_2
select *from nyc1 inner join NYC2  on nyc1.id = NYC2.id ;

#22. write query to show host name and price
select nyc1.host_name ,NYC2.price from nyc1 inner join NYC2 on nyc1.id = NYC2.id;

#23. write query to show room_type and price
select nyc1.room_type  ,NYC2.price from nyc1 inner join NYC2 on nyc1.id = NYC2.id;

#24. write query to show neighbourhood_group&minimum_nights spend
select nyc1.neighbourhood_group  ,NYC2.minimum_nights  from nyc1 inner join NYC2 on nyc1.id = NYC2.id;

#25. write query to show neighbourhood & availability_365
select nyc1.neighbourhood  ,NYC2.availability_365 from nyc1 inner join NYC2 on nyc1.id = NYC2.id;

# 26.write query to show total price by neighbourhood_group
select nyc1.neighbourhood_group  ,NYC2.price  from nyc1 inner join NYC2 
on nyc1.id = NYC2.id group by nyc1.neighbourhood_group;

#27.write query to show maximum price by neighbourhood_group
select nyc1.neighbourhood_group, max(NYC2.price ) as "MAX PRICE"from nyc1 inner join NYC2 
on nyc1.id = NYC2.id group by nyc1.neighbourhood_group;

#28.write query to show maximum night spend by neighbourhood_group
select nyc1.neighbourhood_group, max(NYC2.minimum_nights) as "MAX NIGHT SPEND"from nyc1 inner join NYC2 on 
nyc1.id = NYC2.id group by nyc1.neighbourhood_group;

#29.write query to show maximum reviews_per_month spend by neighbourhood
select nyc1.neighbourhood,max(NYC2.reviews_per_month) as "MAX reviews_per_month "from nyc1 inner join NYC2 on 
nyc1.id =NYC2.id  group by neighbourhood;

#30.write query to show maximum price by room type
select nyc1.room_type,MAX(NYC2.price) "Maxi Price"from nyc1 inner join NYC2 on 
nyc1.id =NYC2.id  group by room_type;

#31.write query to show average number_of_reviews by room_type
select nyc1.room_type ,avg(NYC2.number_of_reviews) as "AVG number of reviews "from nyc1 inner join NYC2 on 
nyc1.id =NYC2.id  group by room_type;

#32.write query to show average price by room type
select nyc1.room_type ,avg(NYC2.price) as "AVG Price "from nyc1 inner join NYC2 on 
nyc1.id =NYC2.id  group by room_type;

#33.write query to show average night spend by room type
select nyc1.room_type ,avg(NYC2.minimum_nights) as "AVG night spend "from nyc1 inner join NYC2 on 
nyc1.id =NYC2.id  group by room_type;

#34.write query to show average price by room type but average price is less than 100
select nyc1.room_type,avg(NYC2.price) "AVG Price"from nyc1 inner join NYC2 on 
nyc1.id =NYC2.id  group by nyc1.room_type having avg(NYC2.price) <100;

#35.write query to show average night by neighbourhood and average_nights is greater than 5
select nyc1.neighbourhood ,avg(NYC2.minimum_nights)as "AVG NIGHT" from nyc1  inner join NYC2 on 
nyc1.id =NYC2.id group by nyc1.neighbourhood having  avg(NYC2.minimum_nights) >5;

#36. write query to show all data from nyc_1 and price is greater than 200 using sub-query
select * from nyc1  where id in (select id from nyc2 where price >200);

#37. write query to show all values from nyc_2 table and host id is 314941
select * from nyc2 where id in (select id from nyc1 where host_id =314941);

#38. Find all pairs of id having the same host id, each pair coming once only.
select nyc1.id ,nyc1.host_id from nyc1 ,nyc2  where nyc1.host_id =nyc2.id  and nyc1.id <>nyc2.id order by host_id ;


#39.write sql query to show fetch all records that have the term cozy in name
select * from nyc1  where name like "%cozy%";

#40. write query to show price host id neighbourhood_group of manhattan neighbourhood_group
select nyc2.price ,nyc1.host_id ,nyc1.neighbourhood_group from nyc1 inner join nyc2 on nyc1.id =nyc2.id where neighbourhood_group= 'Manhattan' ;


#41.write query to show id , host name, neighbourhood and price but only for Upper West Side & Williamsburg neighbourhood also price is greater than 100.
select nyc1.id ,nyc1.host_name,nyc1.neighbourhood ,nyc2.price from nyc1 inner join nyc2 on nyc1.id = nyc2.id 
where neighbourhood in ("Upper West Side","Williamsburg") and price >100;

#42.write query to show id , host name, neighbourhood and price for host name Elise and neighbourhood is Bedford-Stuyvesant
select nyc1.id ,nyc1.host_name,nyc1.neighbourhood ,nyc2.price from nyc1 inner join nyc2 on nyc1.id = nyc2.id 
where neighbourhood in ("Bedford-Stuyvesant") and host_name in ("Elise");

#43. write query to show host_name,availability_365,minimum_nights only for 100+ availability_365 and minimum_nights
select nyc1.host_name ,nyc2.availability_365 ,nyc2.minimum_nights from nyc1 inner join nyc2 on nyc1.id = nyc2.id 
where minimum_nights>100 and availability_365>100;

#44. write query to show to fetch id ,host_name , number_of_reviews, and reviews_per_month but show only that records
## where number of reviews are 500+ and review per month is 5+
select nyc1.id,nyc1.host_name ,nyc2.number_of_reviews ,nyc2.reviews_per_month  from nyc1 inner join nyc2 on nyc1.id = nyc2.id 
where reviews_per_month>5 and number_of_reviews>500;

#45. write query to show neighbourhood_group which have most total number of review
select nyc1.neighbourhood_group, sum(nyc2.number_of_reviews)Total_review
from nyc1 inner join nyc2 on nyc1.id = nyc2.id
group by nyc1.neighbourhood_group order by Total_review desc limit 1 ;


#46. write query to show host name which have most cheaper total price
select nyc1.host_name,sum(nyc2.price) "Total price" from nyc1 inner join  nyc2 on nyc1.id =nyc2.id 
group by host_name order by sum(nyc2.price) asc limit 1;

#47. write query to show host name which have most costly total price
select nyc1.host_name,sum(nyc2.price) "Total price"from nyc1 inner join  nyc2 on nyc1.id =nyc2.id 
group by host_name order by sum(nyc2.price) desc limit 1;

#48. write query to show host name which have max price using sub-query
select nyc1.host_name, nyc2.price  from nyc1 inner join nyc2 on nyc1.id =nyc2.id 
where price in (select max(price) from nyc2);

#49. write query to show neighbourhood_group which price are less than 100
select nyc1.neighbourhood_group ,nyc2.price  from nyc1 inner join nyc2 on nyc1.id =nyc2.id 
where nyc2.id in (select nyc2.id from nyc2 where price <100);

#50. write query to find max price, average availability_365 for each room type and order in ascending by maximum price
select nyc1.room_type ,nyc1.neighbourhood_group , max(nyc2.price)maximum_price , avg(nyc2.availability_365) "Average"
from nyc1 inner join nyc2  on nyc1.id = nyc2.id
group by nyc1.room_type order by maximum_price asc;


























