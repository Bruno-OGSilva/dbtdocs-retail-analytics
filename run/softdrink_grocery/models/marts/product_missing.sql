
  
    

    create or replace table `soft-drink-grocery`.`marts`.`product_missing`
      
    
    

    OPTIONS()
    as (
      with product as (
    select * from `soft-drink-grocery`.`staging`.`stg_product`
),

sales as(
    select * from `soft-drink-grocery`.`marts`.`sales`
),

product_missing as (
    select
    a.product,
    a.upc_no,
    a.retail_group,
    b.brand
from sales a
left join product b
    on a.`upc_no` = b.`upc`
where b.brand IS NULL
)

select * from product_missing
    );
  