use wes;

select distinct name,age from users;

select avg(age), sum(age) from users;

select avg(age) from users
union
select sum(age) from users;

describe cars;

select id,model,price,price*2 as doublePrice from cars;

select concat('My name is',name,'I`m',age,'gender - ',gender) as strings from users;

select * from users where  concat('Ms ',name,' ',gender) = 'Ms Olha Female';
select * from users where age = id+12;
select * from users where name > 'Max';

select id,name,age from users order by 3 desc;

select id,lower(name) as name,age, gender from users;
select id,upper(name) as name, age, gender from users;

select * from client
                  join application  on client.idClient = Client_idClient
                  join department  on idDepartment = client.Department_idDepartment
where City = 'Kyiv';

# drop table cars;

create table cities(
                       id int primary key not null auto_increment,
                       city varchar(20) not null
);

insert into cities (city) values ('Kyiv');

create table user(
                     id int primary key not null auto_increment,
                     name varchar(20) not null,
                     age int not null ,
                     city_id int null ,
                     foreign key (city_id) references cities(id)
);

select user.id,name,age, c.city from user
                                         join cities c on c.id = user.city_id
where city = 'lviv';

select * from user left join cities c on c.id = user.city_id;
select * from user right join cities c on c.id = user.city_id;
