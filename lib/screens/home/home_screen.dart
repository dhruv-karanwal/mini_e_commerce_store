import 'package:flutter/material.dart';
import '../../widgets/bottom_nav.dart';
import '../../widgets/app_drawer.dart';
import '../product/product_list_screen.dart';
import '../cart/cart_screen.dart';
import '../profile/profile_screen.dart';
import '../../widgets/search_bar.dart';
import '../../providers/product_provider.dart';
import 'package:provider/provider.dart';
import '../../widgets/category_card.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final _pages = [
    const HomeContent(),
    const ProductListScreen(), // categories -> shows all products by default
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuickShop'),
        actions: const [
          IconButton(icon: Icon(Icons.notifications_none), onPressed: null),
        ],
      ),
      drawer: const AppDrawer(),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNav(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context).items;
    final categories = ['Groceries', 'Restaurants', 'Household', 'Offers'];

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const SearchBar(),
                const SizedBox(height: 12),
                SizedBox(
                  height: 110,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (ctx, i) => CategoryCard(name: categories[i]),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Popular',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('See all', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate((ctx, i) {
              final p = products[i];
              return GestureDetector(
                onTap: () => Navigator.of(
                  context,
                ).pushNamed('/product-detail', arguments: p.id),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: p.id,
                        child: AspectRatio(
                          aspectRatio: 3 / 2,
                          child: Image.network(p.imageUrl, fit: BoxFit.cover),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          p.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '₹${p.price.toStringAsFixed(0)}',
                          style: const TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }, childCount: products.length),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
          ),
        ),
      ],
    );
  }
}
