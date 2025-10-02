import 'package:flutter/material.dart';

class ProductListingScreen extends StatelessWidget {
  // Pass in a category name (e.g., "T-Shirts")
  final String categoryName;

  const ProductListingScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        actions: const [
          // TODO: Add Filter and Sort icons
          Icon(Icons.filter_list),
          SizedBox(width: 8),
          Icon(Icons.sort),
          SizedBox(width: 8),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        // TODO: Replace with actual product data
        itemCount: 8, 
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7, // Adjust ratio for clothing items
        ),
        itemBuilder: (context, index) {
          // TODO: Replace with your custom ProductCard widget
          return Container(
            color: Colors.grey[200],
            alignment: Alignment.center,
            child: Text('Product $index Card'),
          );
        },
      ),
    );
  }
}