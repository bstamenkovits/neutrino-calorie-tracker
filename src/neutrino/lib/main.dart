import 'package:flutter/material.dart';
import 'package:neutrino/data/services/mock_api.dart';
import 'package:neutrino/data/models/food_item.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: Scaffold(
        body: const FoodItemsLoader(),
      ),
    );
  }
}


/// A widget that loads food items from the mock API and displays them in a list
/// using the [FoodItemContainer] widget. It handles loading and error states
/// gracefully.
class FoodItemsLoader extends StatelessWidget {
  const FoodItemsLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FoodItem>>(
      future: mockApi.getFood(count: 6),
      builder: (context, snapshot) {
        // Handle loading
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }

        // Handle error
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        // Handle success
        final items = snapshot.data ?? [];
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: items.length,
          itemBuilder: (context, index) => FoodItemContainer(item: items[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 12),
        );
      },
    );
  }
}


/// A simple widget to display a food item in a styled container.
class FoodItemContainer extends StatelessWidget {
  final FoodItem item;

  const FoodItemContainer({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          // const SizedBox(height: 8),
          Text('Weight: ${item.weight}g'),
          Text('Servings: ${item.servings}'),
          Text('Calories: ${item.calories}'),
        ],
      ),
    );
  }
}
