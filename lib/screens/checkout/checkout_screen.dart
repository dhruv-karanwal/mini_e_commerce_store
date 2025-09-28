import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';

class CheckoutScreen extends StatefulWidget {
  static const routeName = '/checkout';
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  String address = '';
  String payment = 'Cash';

  void _placeOrder() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    // Dummy place order
    Provider.of<CartProvider>(context, listen: false).clear();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Order Placed'),
        content: const Text('Your order has been placed successfully.'),
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.of(context).popUntil((route) => route.isFirst),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final total = Provider.of<CartProvider>(context).total;
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Delivery Address',
                    ),
                    validator: (v) => v!.isNotEmpty ? null : 'Enter address',
                    onSaved: (v) => address = v ?? '',
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    value: payment,
                    items: const [
                      DropdownMenuItem(
                        value: 'Cash',
                        child: Text('Cash on Delivery'),
                      ),
                      DropdownMenuItem(
                        value: 'Card',
                        child: Text('Card / UPI'),
                      ),
                    ],
                    onChanged: (v) => setState(() => payment = v ?? 'Cash'),
                    decoration: const InputDecoration(
                      labelText: 'Payment Method',
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '₹${total.toStringAsFixed(0)}',
                  style: const TextStyle(fontSize: 20, color: Colors.green),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _placeOrder,
              child: const Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}
