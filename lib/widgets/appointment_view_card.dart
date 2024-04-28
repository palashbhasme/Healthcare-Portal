import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  AppointmentCard({
    super.key,
    required this.text,
    this.height,
    this.width,
  });

  final String text;
  double? height;
  double? width;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: width == null?screenWidth * 0.97:width, // Similar width to CustomCard
      height:  height==null?screenHeight * 0.11:height, // Adjust height as needed
      decoration: BoxDecoration(
        color: Colors.lightGreen[50], // Light green color
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
