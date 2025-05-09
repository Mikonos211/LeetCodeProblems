/* Write your T-SQL query statement below */
with accountsStats as (
    select 
        case
            when income < 20000 then 'Low Salary'
            when income >= 20000 and income <= 50000 then 'Average Salary'
            when income > 50000 then 'High Salary'
            else 'Unknown'
        end as category,
        account_id
    from accounts
),
allCategories as (
    select 'Low Salary' as category
    union all
    select 'Average Salary'
    union all
    select 'High Salary'
)
select 
    c.category, 
    count(a.category) as accounts_count
from allCategories c
left join accountsStats a
    on c.category = a.category
group by c.category
