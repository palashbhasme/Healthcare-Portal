import 'package:flutter/material.dart';

class CustomElevatedButton extends StatefulWidget {
  const CustomElevatedButton({
    super.key,
    required this.isEnabled,
    required this.onPressed,
    required this.text
  });

  final bool isEnabled;
  final VoidCallback onPressed;
  final String text;
  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.isEnabled ? Colors.black : Colors.grey[300],
        minimumSize: const Size(240, 50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
      onPressed: widget.onPressed,
      child: Text(
        widget.text,
        style: TextStyle(
          color: widget.isEnabled ? Colors.white : Colors.grey,
          fontWeight: FontWeight.w400,
          fontSize: 24,
        ),
      ),
    );
  }
}
