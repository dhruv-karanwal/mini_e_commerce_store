import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'OnlineBazaar', 
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            fontSize: 22, 
            color: Color(0xFFE80071) // Brand Color for logo/name
          )
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () { /* TODO: Navigate to Search Screen */ },
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () { Navigator.pushNamed(context, '/profile'); }, // Placeholder
          ),
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () { Navigator.pushNamed(context, '/cart'); },
          ),
        ],
      ),
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- 1. Top Promotional Banner (like a Myntra Super-Sale banner) ---
            Container(
              height: 180,
              color: const Color(0xFFFFDBF3), // Light pink background
              alignment: Alignment.center,
              child: const Text(
                'GRAND FESTIVAL SALE | UP TO 80% OFF',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFE80071)),
              ),
            ),
            
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Shop By Category', 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            
            // --- 2. Circular Category List ---
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: _buildCategoryCircles(context),
              ),
            ),
            
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Text(
                'New Arrivals', 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            
            // --- 3. Featured Product Grid (Placeholder for product cards) ---
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(), // Important for SingleChildScrollView
              shrinkWrap: true,
              itemCount: 6, 
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.65, // Tall cards for clothing focus
              ),
              itemBuilder: (context, index) {
                // TODO: Replace with your ProductCard widget
                return _buildProductPlaceholder(context, index); 
              },
            ),
          ],
        ),
      ),
      
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFFE80071), // Brand Pink for selected tab
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'Bag'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
        onTap: (index) {
          // Implement navigation to the main routes based on index
          final routes = ['/home', '/product-listing', '/cart', '/profile']; 
          if (index < routes.length) {
              Navigator.pushNamed(context, routes[index]);
          }
        },
      ),
    );
  }

  // Helper function to build category circles
  List<Widget> _buildCategoryCircles(BuildContext context) {
    const categories = ['T-Shirts', 'Jeans', 'Dresses', 'Shoes', 'Watches', 'Accessories'];
    return categories.map((name) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              // Navigate to PLP
              Navigator.of(context).pushNamed('/product-listing', arguments: name);
            },
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[200],
              child: const Icon(Icons.checkroom, color: Colors.black54, size: 30),
            ),
          ),
          const SizedBox(height: 5),
          Text(name, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    )).toList();
  }

  // Helper function for product card placeholder
  Widget _buildProductPlaceholder(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        // Navigate to PDP
        Navigator.of(context).pushNamed('/product-details', arguments: 'product_id_$index');
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                color: Colors.grey[100],
                alignment: Alignment.center,
                child: const Icon(Icons.image, size: 50, color: Colors.grey),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, left: 4),
              child: Text(
                'Product Name', 
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 4),
              child: Text('Brand/Category', style: TextStyle(color: Colors.grey, fontSize: 12)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Row(
                children: [
                  const Text('₹999', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(width: 8),
                  Text('₹1999', style: TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough, fontSize: 12)),
                  const Text('(50% OFF)', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}