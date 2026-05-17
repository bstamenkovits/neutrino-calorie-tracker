class FoodItem {
  final String name;
  final double servingNumber;
  final String servingName;
  final double weight;
  final int calories;
  final String meal;

  FoodItem({
    required this.name,
    required this.servingNumber,
    required this.servingName,
    required this.weight,
    required this.calories,
    required this.meal,
  });

  @override
  String toString() {
    return 'FoodItem(name: $name, servings: $servingNumber $servingName, weight: $weight, calories: $calories, meal: $meal)';
  }
}
