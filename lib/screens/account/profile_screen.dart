import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Account')),
      body: ListView(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
          ),
          // TODO: Add user name/email display
          ListTile(
            leading: const Icon(Icons.shopping_bag_outlined),
            title: const Text('Order History'),
            onTap: () {
              // TODO: Navigate to OrderHistoryScreen
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite_border),
            title: const Text('Wishlist'),
            onTap: () {
              // TODO: Navigate to WishlistScreen
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_on_outlined),
            title: const Text('Saved Addresses'),
            onTap: () {
              // TODO: Navigate to AddressesScreen
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('App Settings'),
            onTap: () {
              // TODO: Navigate to SettingsScreen
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () {
              // TODO: Implement logout logic
            },
          ),
        ],
      ),
    );
  }
}