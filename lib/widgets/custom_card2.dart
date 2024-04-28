import 'package:flutter/material.dart';
import 'package:mini_project/common/global_variables.dart';

class CustomCard2 extends StatefulWidget {
  const CustomCard2(
      {super.key,
        required this.name,
      });

  final String name;
  @override
  State<CustomCard2> createState() => _CustomCard2State();
}

class _CustomCard2State extends State<CustomCard2> {
  @override
  Widget build(BuildContext context) {
    final screenWidth =
        MediaQuery.of(context).size.width; // Access context here
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(8.0),
      width: screenWidth * 0.97,
      height: screenHeight * 0.16,
      decoration: BoxDecoration(
        color: GlobalVariables.kPrimaryColor,
        border: Border.all(
          width: 0.8,
        ),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.11),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/black man.webp'),
                  radius: 45.0,
                ),
                SizedBox(height: 15.0),

              ],
            ),
          )
        ],
      ),
    );
  }
}
