select America,Asia,Europe from (select name as America,row_number()over(order by name) as r1
from student
where continent='America') am
left join (select name as Asia,row_number()over(order by name) as r1
from student
where continent='Asia') asi on am.r1=asi.r1 
left join(select name as Europe,row_number()over(order by name) as r1
from student
where continent='Europe') e
on am.r1=e.r1
