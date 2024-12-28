# Write your MySQL query statement below
with state_table as(
  select fail_date dates, 'failed' state from Failed where year(fail_date) = 2019
  union
  select *, 'succeeded' state from Succeeded where year(success_date) = 2019
),
rank_table as(
  select dates, state, dense_rank()over(partition by state order by dates,state) rnk from state_table
)
select state period_state, min(dates) start_date, min(dates)+ interval count(dates)-1 day end_date from rank_table group by state,dates-interval rnk day order by start_date