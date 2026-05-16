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
      home: Scaffold(
        body: const FoodItemsLoader(),
      ),
    );
  }
}


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
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            for (final item in items) FoodItemContainer(item: item),
          ],
        );
      },
    );
  }
}


class FoodItemContainer extends StatelessWidget {
  final FoodItem item;

  const FoodItemContainer({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Weight: ${item.weight}g'),
            Text('Servings: ${item.servings}'),
            Text('Calories: ${item.calories}'),
          ],
        ),
      ),
    );
  }
}
