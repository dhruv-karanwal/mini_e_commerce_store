import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/product_provider.dart';
import '../../models/product.dart';
import '../../widgets/product_card.dart';

class ProductListScreen extends StatelessWidget {
  final String? category;
  final String? query;
  const ProductListScreen({super.key, this.category, this.query});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    List<Product> products;
    if (query != null && query!.isNotEmpty) {
      products = provider.search(query!);
    } else if (category != null) {
      products = provider.category(category!);
    } else {
      products = provider.items;
    }

    return Scaffold(
      appBar: AppBar(title: Text(query ?? category ?? 'Products')),
      body: products.isEmpty
          ? const Center(child: Text('No items found'))
          : GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: products.length,
              itemBuilder: (ctx, i) => ProductCard(product: products[i]),
            ),
    );
  }
}
