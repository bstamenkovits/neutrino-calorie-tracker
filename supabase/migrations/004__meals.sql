create table public.meals (
    -- columns
    id uuid not null,
    name text not null,

    -- primary key
    constraint meals_pkey_id primary key (id)
) TABLESPACE pg_default;
