/* Write your T-SQL query statement below */
with pickname as(
    select count(MovieRating.user_id) as id, Users.name as results
    from MovieRating
    join Users on MovieRating.user_id = Users.user_id
    group by Users.name
),
pickMove as (
    select cast(round(avg(cast(movierating.rating as float)), 2) as decimal(10,2)) as id , Movies.title  
    from MovieRating
    join Movies on MovieRating.movie_id = Movies.movie_id
    where year(created_at) = 2020 and month(created_at) = 2
    group by Movies.title
)
select * from (
    select top 1 pickname.results
    from pickname
    order by id desc, pickname.results
) as top_user

union all

select * from (
    select top 1 pickmove.title
    from pickmove
    order by id desc, pickmove.title
) as top_movie;

    
