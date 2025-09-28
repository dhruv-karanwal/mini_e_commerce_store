import 'package:flutter/material.dart';
import 'auth/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  static const routeName = '/onboarding';
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          _buildPage(
            context,
            'Fast Delivery',
            'Get groceries & meals delivered in minutes',
            Icons.delivery_dining,
          ),
          _buildPage(
            context,
            'Best Offers',
            'Daily deals from nearby stores and restaurants',
            Icons.local_offer,
          ),
          _buildPage(
            context,
            'Secure Payment',
            'Multiple payment options',
            Icons.lock,
          ),
          _buildFinal(context),
        ],
      ),
    );
  }

  Widget _buildPage(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 120, color: Colors.green),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFinal(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.thumb_up, size: 120, color: Colors.green),
          const SizedBox(height: 24),
          const Text(
            'Ready to start?',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => Navigator.of(
              context,
            ).pushReplacementNamed(LoginScreen.routeName),
            child: const Text('Get Started'),
          ),
        ],
      ),
    );
  }
}
