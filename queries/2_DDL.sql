use MyDatabase;

/* Create a new table called persons
with columns : id, person_name, birth_date, and phone */
create table persons (
	id int not null,
    person_name varchar(50) not null,
	birth_date date,
    phone varchar(15) not null,
    constraint pk_persons primary key (id)
);

select * from persons;

-- Add a new column called email to the persons table
alter table persons
add email varchar(50) not null;

-- Remove the column phone from the persons table
alter table persons
drop column phone;

-- Delete the table persons from the database
drop table persons;