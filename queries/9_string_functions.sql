use MyDatabase;

-- concat
-- Concatenate customer first name and country in one column
select
	concat(first_name, '_', country) as name_country
from customers;

-- upper and lower
-- Convert the firstname to lowercase and uppercase
select
	lower(first_name) as low_name,
    upper(first_name) as up_name
from customers;

-- trim -> removes leading and trailing spaces
-- find customers whose first name contains leading or trailing spaces
select
	first_name
from customers
where trim(first_name) != first_name;

-- replace -> replace a specific character with new character
-- it can be used to remove some character as well by not specifying a new character

-- Remove - from a phone numbers
select
	'123-456-789' as phone,
    replace('123-456-789', '-', '') as clean_phone;
    
-- length
-- calculate the length of each customer's first name
select
	first_name,
	length(first_name) as length_name
from customers;

-- left and right
-- retrieve the first two characters of each first name
select
	first_name,
    left(trim(first_name), 2) as first_2_char
from customers;

-- retrieve the last two characters of each first name
select
	first_name,
    right(trim(first_name), 2) as first_2_char
from customers;

-- substring -> Extracts a part of string at a particular position
-- After the 2nd character, extract 2 characters from first name
select
	first_name,
    substring(trim(first_name), 3, 2) as substr_2_char
from customers;

-- Retrieve a list of customer's first names after removing the first character
select
	first_name,
	substring(trim(first_name), 2, length(first_name)) as new_name
from customers;

