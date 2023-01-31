-- Active: 1675071918474@@127.0.0.1@55000@postgres
{
	"name": "Abdulloh Sattorov",
	"age": 15,
	"isActive": true
}

create table students (
	id serial not null primary key,
	data jsonb
);


insert into students (data, data1) values
('{
	"name": "Abdulloh Sattorov",
	"age": 15,
	"isActive": true
}', '{
	"name": "Abdulloh Sattorov",
	"age": 15,
	"isActive": true
}')
;

insert into students (data) values
('{
	"name": "Abdulloh Sattorov",
	"age": 15,
	"isActive": true,
	"friend": {
		"name": "Aziz",
		"isActive": true,
		"age": 15
	}
}')
;

select row_to_json(id) from students;

select data ->> 'name' from students
where data ->> 'age' > 14;

select data ->> 'name' from students
where data ->> 'name' = 'Abdulloh Sattorov';

select row_to_json(products) from products;

text	string
numeric	number
boolean boolean
null	null
		object



insert into students (data) values ('{
	"x": 1,
	"x": 2,
	"x": 3
}');

create index my_index on students using gin (data);
