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
