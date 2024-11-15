with
    rename as (
        select
            cast(creditcardid as int) as pk_credit_card
            , cast(cardtype as string) as card_type
        from {{ source('erp_adventureworks', 'creditcard') }}
    )