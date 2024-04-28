import 'package:flutter/material.dart';

import '../common/global_variables.dart';

class OptionsCard extends StatelessWidget {
  const OptionsCard(
      {super.key,
      required this.image,
      required this.text,
      required this.color, required this.onTap});

  final String image;
  final String text;
  final Color color;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 148,
        height: 144,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.11),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage(image),
            ),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            )
          ],
        ),
      ),
    );
  }
}
