create table public.ingredients_categories (
    id uuid not null,
    name text not null,
    constraint ingredients_categories_pkey_id primary key (id)
) TABLESPACE pg_default;
