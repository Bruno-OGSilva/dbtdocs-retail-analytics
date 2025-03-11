with

source as (

    select * from `soft-drink-grocery`.`raw`.`raw_sobeys_stores`

),

renamend as (
    select
        Geography as store_name,
        `Store No` as store_id,
        `Division Name` as division,
        `Format Name` as format,
        `Banners Name` as banner,
        `Province Name` as province,
        retail_group,
        CONCAT(retail_group, '|', `Store No`) as unique_store_id
    from
        source

)

select * from renamend