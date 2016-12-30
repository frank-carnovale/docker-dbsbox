
set client_min_messages to warning;

drop table employee;
drop table department;

create table department ( -- dept
    dept_id serial primary key,
    name    varchar
);

create table employee ( -- emp
    emp_id   serial primary key,
    dept_id  int references department not null,
    name      varchar not null
);

insert into department(name) values ('Catering');
insert into employee(dept_id,name) values (1,  'Joe the Chef');

