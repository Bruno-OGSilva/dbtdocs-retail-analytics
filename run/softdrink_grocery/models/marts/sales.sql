
  
    

    create or replace table `soft-drink-grocery`.`marts`.`sales`
      
    
    

    OPTIONS()
    as (
      with lcl_sales as (
    select * from `soft-drink-grocery`.`intermidiate`.`int_lcl_sales`
),

fcl_sales as (
    select * from `soft-drink-grocery`.`intermidiate`.`int_fcl_sales`
),

sobeys_sales as (
    select * from `soft-drink-grocery`.`staging`.`stg_sobeys_sales`
),

ccl_sales as (
    select * from `soft-drink-grocery`.`staging`.`stg_ccl_sales`
),

pfg_sales as (
    select * from `soft-drink-grocery`.`staging`.`stg_pfg_sales`
),

metro_sales as (
    select * from `soft-drink-grocery`.`staging`.`stg_metro_sales`
),

sales as (
    select * from lcl_sales
    union all
    select * from fcl_sales
    union all
    select * from sobeys_sales
    union all
    select * from ccl_sales
    union all
    select * from pfg_sales
    union all
    select * from metro_sales
)

select * from sales
    );
  