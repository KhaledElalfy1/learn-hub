import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  // This simulates decorative confetti-like background elements
                  Container(
                    width: 120,
                    height: 120,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                  ),
                  // Add some decorative elements (simulated confetti-like elements)
                  const Positioned(
                    left: 20,
                    top: 10,
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.orange,
                    ),
                  ),
                  const Positioned(
                    right: 25,
                    top: 20,
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.purple,
                    ),
                  ),
                  const Positioned(
                    right: 10,
                    bottom: 15,
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.green,
                    ),
                  ),
                  const Positioned(
                    left: 10,
                    bottom: 20,
                    child: CircleAvatar(
                      radius: 3,
                      backgroundColor: Colors.pink,
                    ),
                  ),
                  // Checkmark icon
                  const Icon(
                    Icons.check_circle_rounded,
                    color: Color(0xFF2A53FF),
                    size: 70,
                  ),
                  const Positioned(
                    top: 10,
                    child: Icon(
                      Icons.auto_awesome,
                      color: Colors.blue,
                      size: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Successful purchase!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Action when button is pressed
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2A53FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                ),
                child: const Text(
                  'Start learning',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
