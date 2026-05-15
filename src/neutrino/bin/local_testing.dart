import 'package:neutrino/data/mock_api.dart';

void main() async {
  final items = await mockApi.getFood(count: 6);
  for (final item in items) {
    print(item.name);
  }
}
