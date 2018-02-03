# 1. How many airplanes have listed speeds?  What is the minimum listed speed and the maximum listed speed? 
select count(*) from planes where speed >0;
select min(speed) from planes;
select max(speed) from planes;

# 2. What is the total distance flown by all of the planes in January 2013?  What is the total distance flown by all of the planes in January 2013 where the tailnum is missing? 
select sum(distance) from flights where month = 1;
select sum(distance) from flights where month = 1 and tailnum is null;

# 3. What is the total distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer?  Write this statement first using an INNER JOIN, then using a LEFT OUTER JOIN.  How do your results compare? 
select sum(distance), manufacturer 
	from flights inner join planes
		on flights.tailnum = planes.tailnum 
		where month = 7 and day = 5
		group by manufacturer;
 
 select sum(distance), manufacturer 
	from flights left join planes
    on flights.tailnum = planes.tailnum
		where month= 7 and day = 5
        group by manufacturer;

# 4. How many flights with less than 100 seats flew on August 13, group by airline name? 
select count(*)
	from planes left join flights
		on planes.tailnum = flights.tailnum 
        where seats = 55
        group by carrier;
        
