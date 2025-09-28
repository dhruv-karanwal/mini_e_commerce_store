import 'package:flutter/material.dart';

class OrderTrackingScreen extends StatelessWidget {
  static const routeName = '/order-tracking';
  final String orderId;
  final String status;
  const OrderTrackingScreen({
    super.key,
    this.orderId = 'ORD123',
    this.status = 'Out for Delivery',
  });

  @override
  Widget build(BuildContext context) {
    final steps = ['Ordered', 'Packed', 'Out for Delivery', 'Delivered'];
    final current = steps.indexOf(status) >= 0 ? steps.indexOf(status) : 2;

    return Scaffold(
      appBar: AppBar(title: const Text('Order Tracking')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Order ID: $orderId',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: steps.length,
                itemBuilder: (ctx, i) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: i <= current
                          ? Colors.green
                          : Colors.grey,
                      child: Text('${i + 1}'),
                    ),
                    title: Text(steps[i]),
                    subtitle: Text(i <= current ? 'Completed' : 'Pending'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
