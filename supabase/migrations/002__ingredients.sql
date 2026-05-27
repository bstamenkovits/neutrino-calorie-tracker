create table public.ingredients (
    -- columns
    id uuid not null,
    name text not null,
    calories_kcal double precision null,
    fat_g double precision null,
    carbs_g double precision null,
    protein_g double precision null,
    category_id uuid null,

    -- primary & foreign keys
    constraint ingredients_pkey_id primary key (id),
    constraint ingredients_fkey_category_id foreign key (category_id) references ingredients_categories (id) on update CASCADE on delete CASCADE,

    -- check valid nutritional values
    constraint ingredients_chk_calories_kcal check (calories_kcal >= 0.0),
    constraint ingredients_chk_fat_g check (fat_g >= 0.0),
    constraint ingredients_chk_carbs_g check (carbs_g >= 0.0),
    constraint ingredients_chk_protein_g check (protein_g >= 0.0)

) TABLESPACE pg_default;
