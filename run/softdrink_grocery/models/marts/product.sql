
  
    

    create or replace table `soft-drink-grocery`.`marts`.`product`
      
    
    

    OPTIONS()
    as (
      with product as (
    select * from `soft-drink-grocery`.`staging`.`stg_product`
)

select * from product
    );
  