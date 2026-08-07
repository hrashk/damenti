-- task 1
select e.*
from employees e join employees m on e.department_id = m.department_id and m.is_manager = true
where e.birth_dt < m.birth_dt;

-- task 2
select c1.client_id as client1, c2.client_id as client2, c1.city
from clients c1 join clients c2 on c1.city = c2.city and c1.client_id < c2.client_id;

-- task 3
select c1.client_id as client1, c2.client_id as client2, c1.phone
from clients c1 join clients c2 on c1.phone = c2.phone and c1.client_id < c2.client_id;

-- task 4
select t1.team, t1.points, count(distinct t2.points) as rnk -- dense rank
from teams t1 join teams t2 on t2.points >= t1.points
group by t1.team, t1.points;

-- task 5
select p1.*
from products p1 join products p2 on p2.product_id = 1
where p1.price > p2.price;

-- task 6
select s1.user_id, s1.session_id as session1, s2.session_id as session2
from sessions s1 join sessions s2 on s1.user_id = s2.user_id and s1.session_id < s2.session_id
where s1.start_ts < s2.end_ts and s2.start_ts < s1.end_ts;

-- task 7
select e.manager_id, e.name, m.name as manager_name
from employees e left join employees m on e.manager_id = m.employee_id;

-- task 8
select s1.id, count(s2.id) as rnk
from scores s1 left join scores s2 on s1.score < s2.score
group by s1.id;

-- task 9
select e1.emplopyee_id , e2.emplopyee_id , e1.department_id 
from employees e1 join employees e2
    on e1.department_id = e2.department_id
    and e1.emplopyee_id < e2.emplopyee_id ;

-- task 10
select o1.order_id as order1, o2.order_id as order2
from orders o1 join orders o2
	on o1.client_id  = o2.client_id
	and o1.amount < o2.amount;
