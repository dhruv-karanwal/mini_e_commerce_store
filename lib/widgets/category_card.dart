import 'package:flutter/material.dart';
import '../screens/product/product_list_screen.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  const CategoryCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => ProductListScreen(category: name)),
      ),
      child: Container(
        width: 120,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.green[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.green.shade100),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(_iconFor(name), size: 36, color: Colors.green),
            const SizedBox(height: 8),
            Text(name, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  IconData _iconFor(String c) {
    switch (c.toLowerCase()) {
      case 'groceries':
        return Icons.local_grocery_store;
      case 'restaurants':
        return Icons.restaurant;
      case 'household':
        return Icons.home;
      default:
        return Icons.label;
    }
  }
}
