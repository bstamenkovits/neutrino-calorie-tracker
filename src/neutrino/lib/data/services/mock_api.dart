import 'dart:math';
import 'package:neutrino/data/models/food_item.dart';


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
        servingNumber: servings,
        servingName: 'portion(s)',
        weight: weight.toDouble(),
        calories: calories,
        meal: meal,
      );
    });
  }
}

final mockApi = MockApi();
