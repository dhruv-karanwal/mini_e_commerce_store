import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String productId;
  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('OnlineBazaar'),
        actions: const [
          Icon(Icons.share_outlined),
          SizedBox(width: 10),
          Icon(Icons.shopping_bag_outlined),
          SizedBox(width: 10),
        ],
      ),
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- 1. Product Images Carousel (Placeholder) ---
            Container(
              height: 450,
              width: double.infinity,
              color: Colors.grey[100],
              alignment: Alignment.center,
              child: const Text('Image Gallery / Carousel', style: TextStyle(color: Colors.grey)),
            ),
            
            // --- 2. Details Section ---
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Brand Name
                  const Text(
                    'Brand Name', 
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                  ),
                  // Product Name
                  const Text(
                    'Solid T-shirt with Round Neck', 
                    style: TextStyle(fontSize: 16, color: Colors.black54)
                  ),
                  const SizedBox(height: 10),
                  
                  // Price Tag
                  Row(
                    children: [
                      Text(
                        '₹999', 
                        style: TextStyle(
                          fontSize: 22, 
                          fontWeight: FontWeight.bold, 
                          color: theme.colorScheme.primary
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        '₹1999', 
                        style: TextStyle(
                          fontSize: 18, 
                          color: Colors.grey, 
                          decoration: TextDecoration.lineThrough
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        '(50% OFF)', 
                        style: TextStyle(fontSize: 18, color: Colors.orange, fontWeight: FontWeight.bold)
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Size Selection
                  const Text('SELECT SIZE', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8.0,
                    children: ['S', 'M', 'L', 'XL'].map((size) => _buildSizeChip(size)).toList(),
                  ),
                  const Divider(height: 40),
                  
                  // Product Description
                  const Text('PRODUCT DETAILS', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text(
                    'A stylish cotton T-shirt, perfect for daily wear. Features a crew neck and a slim fit. '
                    'Material: 100% Cotton. Wash Care: Machine wash cold.',
                    style: TextStyle(color: Colors.black87),
                  ),
                  const Divider(height: 40),

                  // Customer Ratings
                  const Text('RATINGS & REVIEWS', style: TextStyle(fontWeight: FontWeight.bold)),
                  // ... (Placeholder for ratings widget)
                ],
              ),
            ),
          ],
        ),
      ),
      
      // --- 3. Sticky Bottom Action Bar ---
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.shade200)),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: TextButton.icon(
                onPressed: () { 
                  // TODO: Implement Wishlist logic
                },
                icon: const Icon(Icons.favorite_border, color: Colors.black),
                label: const Text('WISHLIST', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ElevatedButton(
                  onPressed: selectedSize == null ? null : () {
                    // TODO: Implement Add to Cart logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Added Size $selectedSize to Cart!'))
                    );
                  },
                  // Uses the primary color defined in main.dart (Brand Pink)
                  child: const Text('ADD TO BAG', style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build size selector chips
  Widget _buildSizeChip(String size) {
    final isSelected = size == selectedSize;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = size;
        });
      },
      child: Container(
        width: 45,
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).colorScheme.primary.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(45),
          border: Border.all(
            color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey.shade400,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Text(
          size, 
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            color: isSelected ? Theme.of(context).colorScheme.primary : Colors.black
          ),
        ),
      ),
    );
  }
}