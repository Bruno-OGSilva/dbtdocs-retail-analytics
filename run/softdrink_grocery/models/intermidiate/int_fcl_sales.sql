

  create or replace view `soft-drink-grocery`.`intermidiate`.`int_fcl_sales`
  OPTIONS()
  as with

fcl_sales as (

    select * from `soft-drink-grocery`.`staging`.`stg_fcl_sales`

),

fcl_no_promo as (
        select
            store_id,
            product,
            upc_no,
            upc_int,
            dollar_sales,
            unit_sales,
            week_end_date,
            retail_group,
            unique_store_id,
            pod
    from fcl_sales
)

select * from fcl_no_promo;

