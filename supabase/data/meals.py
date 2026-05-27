import uuid
import pandas as pd

def generate_uuid(input_string: str) -> str:
    return str(uuid.uuid5(uuid.NAMESPACE_DNS, input_string))

meals = [
    'Breakfast',
    'Lunch',
    'Dinner',
    'Snack'
]

meal_data = pd.DataFrame([
    {
        "id": generate_uuid(meal),
        "name": meal
    }
    for meal in meals
])

meal_data.to_csv('./data/csv/meals.csv', index=False)
