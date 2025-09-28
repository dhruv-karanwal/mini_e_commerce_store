import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => [..._items];

  List<Product> category(String cat) =>
      _items.where((p) => p.category == cat).toList();

  Product? findById(String id) => _items.firstWhere(
    (p) => p.id == id,
    orElse: () => throw Exception('Product not found'),
  );

  void toggleFavorite(String id) {
    final p = findById(id);
    p.isFavorite = !p.isFavorite;
    notifyListeners();
  }

  // Dummy data loader
  void loadDummyData() {
    if (_items.isNotEmpty) return;
    _items.addAll([
      Product(
        id: 'p1',
        title: 'Fresh Apples (1kg)',
        description: 'Crisp, sweet apples from local farms.',
        price: 120,
        rating: 4.5,
        imageUrl: 'https://picsum.photos/seed/apple/600/400',
        category: 'Groceries',
      ),
      Product(
        id: 'p2',
        title: 'Paneer Wrap',
        description: 'Delicious paneer wrap, spicy and fresh.',
        price: 99,
        rating: 4.2,
        imageUrl: 'https://picsum.photos/seed/wrap/600/400',
        category: 'Restaurants',
      ),
      Product(
        id: 'p3',
        title: 'Organic Bananas (1 dozen)',
        description: 'Sweet organic bananas.',
        price: 70,
        rating: 4.6,
        imageUrl: 'https://picsum.photos/seed/banana/600/400',
        category: 'Groceries',
      ),
      Product(
        id: 'p4',
        title: 'Detergent Powder (2kg)',
        description: 'Cleans better, longer-lasting scent.',
        price: 240,
        rating: 4.1,
        imageUrl: 'https://picsum.photos/seed/detergent/600/400',
        category: 'Household',
      ),
      Product(
        id: 'p5',
        title: 'Pizza Margherita',
        description: 'Classic Margherita with fresh basil.',
        price: 299,
        rating: 4.4,
        imageUrl: 'https://picsum.photos/seed/pizza/600/400',
        category: 'Restaurants',
      ),
    ]);
    notifyListeners();
  }

  List<Product> search(String q) {
    final lower = q.toLowerCase();
    return _items
        .where(
          (p) =>
              p.title.toLowerCase().contains(lower) ||
              p.description.toLowerCase().contains(lower),
        )
        .toList();
  }
}
