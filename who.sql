create table who_num select Who ,COUNT(Who) as num from 2011_mozilla_activity_level2 GROUP BY Who ;
create table who_num_10 select * FROM who_num ORDER BY num DESC LIMIT 1,10
