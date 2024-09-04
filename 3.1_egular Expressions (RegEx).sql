--Regular Expressions (RegEx)
 select * from stores;

 select physical_address from stores  where regexp_like(PHYSICAL_ADDRESS, '[A-Z]{2} \d{5}') ;

-- The regexp_like function is for pattarn matching 
-- [A-Z]{2} means it will keep all upper letter two times, and the space means one space requert \d{5} five digits.
 select STORE_NAME , case 
 when regexp_like(PHYSICAL_ADDRESS, '[A-Z]{2} \d{5}') then 'US City'
 else 'Other city'
 end as city_US
 from stores where city_us == 'US City';

 select * from customers;

 select Full_name from customers where regexp_like(full_name,'^(Stephen|Steven)');