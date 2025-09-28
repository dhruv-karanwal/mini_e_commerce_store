# 📱 Mini E-Commerce Store (Flutter)

A **fully functional Flutter e-commerce mobile app** inspired by Blinkit & Zomato.  
This app demonstrates modern Flutter development practices, including **state management, navigation, animations, and UI widgets**.  
Built with **Provider**, **Google Fonts**, and **Carousel Slider**.  

---

## ✨ Features
- Splash Screen & Onboarding with carousel  
- Login & Signup with validation  
- Home page with categories, offers, and search  
- Product listing (grid + list toggle)  
- Product details page with cart support  
- Cart with quantity & total price calculation  
- Checkout (address, payment, order summary)  
- Order tracking (ordered → packed → shipped → delivered)  
- Wishlist / Favorites  
- Profile with user info & settings  
- Bottom Navigation Bar (Home, Categories, Cart, Profile)  
- Drawer menu (Offers, Help, Settings, Logout)  
- Smooth animations & responsive layout  

---

## 📂 Folder Structure
mini_e_commerce_store/
│── lib/
│ ├── main.dart # App entry point
│ ├── models/ # Data models (product, user, order)
│ ├── providers/ # State management (Provider classes)
│ ├── screens/ # Screens (Splash, Onboarding, Login, Home, etc.)
│ │ ├── splash_screen.dart
│ │ ├── onboarding_screen.dart
│ │ ├── login_screen.dart
│ │ ├── signup_screen.dart
│ │ ├── home_screen.dart
│ │ ├── product_list_screen.dart
│ │ ├── product_detail_screen.dart
│ │ ├── cart_screen.dart
│ │ ├── checkout_screen.dart
│ │ ├── order_tracking_screen.dart
│ │ ├── profile_screen.dart
│ ├── widgets/ # Reusable widgets (buttons, cards, etc.)
│── assets/
│ ├── images/ # App images (logo, banners, product pics)
│── pubspec.yaml # Project dependencies
│── README.md # Project documentation
