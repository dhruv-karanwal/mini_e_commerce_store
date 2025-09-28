import 'product.dart';

class OrderItem {
  final String id;
  final List<Product> products;
  final double total;
  final DateTime dateTime;
  String status; // e.g., ordered, packed, out, delivered

  OrderItem({
    required this.id,
    required this.products,
    required this.total,
    required this.dateTime,
    this.status = 'Ordered',
  });
}
