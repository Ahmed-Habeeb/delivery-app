import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F9FF), // light blue background
      body: Column(
        children: [
          const SizedBox(height: 80),
          Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 220,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Orders Delivery',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/delivery_guy.png',
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
