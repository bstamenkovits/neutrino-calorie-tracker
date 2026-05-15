import 'dart:math';

class FoodItem {
  final String name;
  final double servings;
  final double weight;
  final int calories;
  final String meal;

  FoodItem({
    required this.name,
    required this.servings,
    required this.weight,
    required this.calories,
    required this.meal,
  });

  @override
  String toString() {
    return 'FoodItem(name: $name, servings: $servings, weight: $weight, calories: $calories, meal: $meal)';
  }
}

class MockApi {
  static const _foodNames = [
    'Avocado toast',
    'Greek salad',
    'Oatmeal',
    'Chicken breast',
    'Salmon fillet',
    'Banana smoothie',
    'Quinoa bowl',
    'Turkey sandwich',
    'Veggie stir fry',
    'Yogurt parfait',
  ];

  static const _mealTypes = [
    'Breakfast',
    'Lunch',
    'Dinner',
    'Snack',
  ];

  final Random _random = Random();

  Future<List<FoodItem>> getFood({int count = 8}) async {
    return List.generate(count, (index) {
      final name = _foodNames[_random.nextInt(_foodNames.length)];
      final meal = _mealTypes[_random.nextInt(_mealTypes.length)];
      final servings = (1 + _random.nextInt(3)) * 0.5;
      final weight = 60 + _random.nextInt(241);
      final calories = 60 + _random.nextInt(441);

      return FoodItem(
        name: name,
        servings: servings,
        weight: weight.toDouble(),
        calories: calories,
        meal: meal,
      );
    });
  }
}

final mockApi = MockApi();
