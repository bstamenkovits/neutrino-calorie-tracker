create table public.food_logs (
    -- columns
    id uuid not null,
    date_added timestamp with time zone not null,
    meal_id uuid null,
    ingredient_id uuid null,
    serving_id uuid null,
    quantity double precision not null,
    user_id uuid null,

    -- primary and foreign keys
    constraint food_logs_pkey_id primary key (id),
    constraint food_logs_fkey_ingredient_id foreign key (ingredient_id) references ingredients (id) on update CASCADE on delete CASCADE,
    constraint food_logs_fkey_meal_id foreign key (meal_id) references meals (id) on update CASCADE on delete CASCADE,
    constraint food_logs_fkey_serving_id foreign key (serving_id) references servings (id) on update CASCADE on delete CASCADE,
    constraint food_logs_fkey_user_id foreign key (user_id) references auth.users (id) on update CASCADE on delete CASCADE
) TABLESPACE pg_default;
