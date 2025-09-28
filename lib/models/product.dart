class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final double rating;
  final String imageUrl;
  final String category;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.category,
    this.isFavorite = false,
  });
}
