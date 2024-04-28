import 'package:flutter/material.dart';

class PrescriptionTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const PrescriptionTextField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.97, // Similar width to CustomCard
      height: screenHeight*0.23, // Adjust height as needed
      decoration: BoxDecoration(
        color: Colors.lightGreen[50], // Light green color
        borderRadius: BorderRadius.circular(8.0), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none, // Remove default border
          ),
          style: TextStyle(fontSize: 16.0), // Adjust font size as needed
        ),
      ),
    );
  }
}
