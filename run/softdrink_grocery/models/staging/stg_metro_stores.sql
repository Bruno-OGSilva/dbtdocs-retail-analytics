

  create or replace view `soft-drink-grocery`.`staging`.`stg_metro_stores`
  OPTIONS()
  as with

source as (

    select * from `soft-drink-grocery`.`raw`.`raw_metro_stores`

),

renamend as (
    select
        `Store Name` as store_name,
        `Operational Site` as store_id,
        case
            when lower(`Banner Description`) = 'food basics' then 'Food Basics'
            else `Banner Description`
        end as banner,
        Province as province,
        retail_group,
        CONCAT(retail_group, '|', `Operational Site`) as unique_store_id
    from
        source

)

select * from renamend;

