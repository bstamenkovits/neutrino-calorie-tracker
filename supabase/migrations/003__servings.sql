create table public.servings (
    -- columns
    id uuid not null,
    name text not null,
    size_g double precision null,
    ingredient_id uuid not null,

    -- primary and foreign keys
    constraint servings_pkey_id primary key (id),
    constraint servings_fkey_ingredient_id foreign key (ingredient_id) references ingredients (id) on update CASCADE on delete CASCADE,

    -- data checks
    constraint servings_chk_size_g check (size_g > 0)
) TABLESPACE pg_default;
