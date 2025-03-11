with

fcl_stores as (
    select * from `soft-drink-grocery`.`staging`.`stg_fcl_stores`
),

discount_banners as (
    select `Discount Banners` as discount_banner
    from `soft-drink-grocery`.`raw`.`raw_discount_banners`
),

fcl_stores_channel as (
    select
        store_name,
        store_id,
        banner,
        province,
        retail_group,
        unique_store_id,
        case
            when banner in (select discount_banner from discount_banners) then 'Discount'
            else 'Conventional'
        end as channel
    from fcl_stores
)

select * from fcl_stores_channel