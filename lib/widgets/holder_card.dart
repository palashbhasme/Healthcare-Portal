import 'dart:ui';

import 'package:flutter/material.dart';

class HolderCard extends StatelessWidget {
  const HolderCard(
      {Key? key,
      required this.path,
      required this.entity,
      required this.isSelected})
      : super(key: key);

  final String path;
  final String entity;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 160,
        height: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(
            width: isSelected?2.0:0.0,
            color: isSelected?Colors.green:Colors.black,
          ),
          // Adjust the border radius as needed
          color: Colors.white,
        ),
        child: Column(
          children: [
            Image(
              image: AssetImage(
                path,
              ),
            ),
            Text(
              entity,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
