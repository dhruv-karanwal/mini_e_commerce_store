import 'package:flutter/material.dart';

// Import your screen files
// Ensure these files exist in their respective directories (e.g., lib/screens/auth/login_screen.dart)
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/product/product_listing_screen.dart';
import 'screens/product/product_details_screen.dart';
import 'screens/cart_checkout/cart_screen.dart';
import 'screens/cart_checkout/checkout_screen.dart';
import 'screens/account/profile_screen.dart';

// -------------------------------------------------------------------
// 1. Main Function
// -------------------------------------------------------------------

void main() {
  runApp(const EcommerceApp());
}

// -------------------------------------------------------------------
// 2. Main App Widget
// -------------------------------------------------------------------

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce Clothing App',
      debugShowCheckedModeBanner: false,
      
      // Basic Theme Setup
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Define a consistent color scheme
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
          secondary: Colors.redAccent, // Accent color for buttons, etc.
        ),
        useMaterial3: true,
      ),
      
      // Initial Route
      initialRoute: '/login', 
      
      // -------------------------------------------------------------------
      // 3. Named Routes (Corrected: Removed 'const' from the function wrapper)
      // -------------------------------------------------------------------
      routes: {
        // Authentication Routes
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        
        // Core Shopping Routes
        '/home': (context) => const HomeScreen(), 
        
        // Cart and Checkout Routes
        '/cart': (context) => const CartScreen(),
        '/checkout': (context) => const CheckoutScreen(),
        
        // Account Routes
        '/profile': (context) => const ProfileScreen(),
      },
      
      // -------------------------------------------------------------------
      // 4. onGenerateRoute (For routes requiring arguments)
      // -------------------------------------------------------------------
      onGenerateRoute: (settings) {
        // Route for Product Details Page (e.g., navigating with a product ID)
        if (settings.name == '/product-details') {
          final productId = settings.arguments as String? ?? 'default-product-id';
          return MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(productId: productId),
          );
        }
        
        // Route for Product Listing Page (e.g., navigating with a category name)
        if (settings.name == '/product-listing') {
          final categoryName = settings.arguments as String? ?? 'All Products';
          return MaterialPageRoute(
            builder: (context) => ProductListingScreen(categoryName: categoryName),
          );
        }
        
        // Return null for routes not handled here
        return null; 
      },
    );
  }
}