import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/wishlist';
  const WishlistScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // In this simplified demo, favorites are toggled on products; you can fetch them via provider.
    return Scaffold(
      appBar: AppBar(title: const Text('Wishlist')),
      body: const Center(child: Text('Your favorites will appear here')),
    );
  }
}
