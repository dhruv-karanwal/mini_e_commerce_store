import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // TODO: Shipping Address Selection/Form
            const Text('1. Shipping Address', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(),
            // TODO: Payment Method Selection
            const Text('2. Payment Method', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(),
            // TODO: Order Summary
            const Text('3. Review Order', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // TODO: Implement order placement logic
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15),
          ),
          child: const Text('Place Order', style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}