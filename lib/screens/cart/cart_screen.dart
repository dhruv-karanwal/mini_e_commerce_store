import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';
import '../checkout/checkout_screen.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: cart.items.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (ctx, i) {
                      final id = cart.items.keys.toList()[i];
                      final item = cart.items[id]!;
                      return ListTile(
                        leading: SizedBox(
                          width: 60,
                          child: Image.network(
                            item.product.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(item.product.title),
                        subtitle: Text(
                          '₹${item.product.price.toStringAsFixed(0)} x ${item.quantity}',
                        ),
                        trailing: SizedBox(
                          width: 120,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () => cart.removeSingle(id),
                                icon: const Icon(Icons.remove),
                              ),
                              Text('${item.quantity}'),
                              IconButton(
                                onPressed: () => cart.addItem(item.product),
                                icon: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '₹${cart.total.toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const CheckoutScreen(),
                          ),
                        ),
                        child: const Text('Proceed to Checkout'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
