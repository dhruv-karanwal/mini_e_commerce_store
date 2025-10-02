import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // Define the brand primary color for consistency
  static const Color brandPrimaryColor = Color(0xFFE80071); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar remains clean and white, consistent with Myntra-style UI
      appBar: AppBar(
        title: const Text('Sign In', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[ // Correctly opened and closed list of children
              // --- 1. Logo/App Name ---
              const Text(
                'OnlineBazaar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: brandPrimaryColor,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 40),

              // --- 2. Email/Username Input ---
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email or Mobile Number',
                  prefixIcon: const Icon(Icons.person_outline, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: brandPrimaryColor, width: 2.0),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              // --- 3. Password Input ---
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: brandPrimaryColor, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // --- 4. Login Button ---
              ElevatedButton(
                onPressed: () {
                  // Navigate to the Home Screen upon "successful" login.
                  Navigator.of(context).pushReplacementNamed('/home');
                },
                style: ElevatedButton.styleFrom(
                  // Style defined in main.dart: uses brandPrimaryColor
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                child: const Text('LOG IN'),
              ),
              const SizedBox(height: 20),

              // --- 5. Navigation to Sign Up ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("New to OnlineBazaar?"),
                  TextButton(
                    onPressed: () {
                      // Navigate to the Sign Up screen
                      Navigator.of(context).pushNamed('/signup');
                    },
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(
                        color: brandPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ], // End of Column children list
          ), // End of Column widget
        ), // End of SingleChildScrollView widget
      ), // End of Center widget
    ); // End of Scaffold widget
  } // End of build method
} // End of LoginScreen class