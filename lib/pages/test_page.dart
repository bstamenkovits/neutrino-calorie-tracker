import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Supabase.instance.client.schema('app').from('ingredients').select().limit(1).maybeSingle(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final data = snapshot.data;
          if (data == null) {
            return const Center(child: Text('No data found'));
          }

          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(data.toString()),
            ),
          );
        },
      ),
    );
  }
}
