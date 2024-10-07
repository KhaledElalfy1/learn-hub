import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6C6C8C), // Background color similar to your image
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent, // Transparent button to simulate the dialog appearance
            shadowColor: Colors.transparent,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return SuccessDialog();
              },
            );
          },
          child: Container(),
        ),
      ),
    );
  }
}

class SuccessDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0), // Rounded corners
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 300, // Adjusted width for better layout
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Adjusted the size of the checkmark icon
            const Icon(
              Icons.check_circle_rounded,
              color: Color(0xFF2A53FF), // Checkmark icon color
              size: 70, // Size adjusted for a better match to the design
            ),
            const SizedBox(height: 16),
            const Text(
              'Success',
              style: TextStyle(
                fontSize: 24, // Text size for the title
                fontWeight: FontWeight.bold,
                color: Colors.black, // Darker text color to match the image
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "Congratulations, you have \n completed your registration!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600, // Lighter grey text color
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2A53FF), // Blue button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded button corners
                ),
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 16), // Adjusted for wider button
              ),
              child: const Text(
                'Done',
                style: TextStyle(fontSize: 20, color: Colors.white), // Adjusted button text size
              ),
            ),
          ],
        ),
      ),
    );
  }
}