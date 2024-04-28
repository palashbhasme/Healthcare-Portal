import 'package:flutter/material.dart';
import 'package:mini_project/common/global_variables.dart';

class CustomGlanceCard extends StatefulWidget {
  const CustomGlanceCard({
    super.key,
    required this.name,
    required this.date,
    required this.reason,
    required this.isDoc,
  });

  final String date;
  final String name;
  final String reason;
  final bool isDoc;

  @override
  State<CustomGlanceCard> createState() => _CustomGlanceCardState();
}

class _CustomGlanceCardState extends State<CustomGlanceCard> {
  @override
  Widget build(BuildContext context) {
    final screenWidth =
        MediaQuery
            .of(context)
            .size
            .width; // Access context here
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return Material(
      child: Container(
        height: screenHeight * 0.15,
        width: screenWidth * 0.97,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 0.8,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.11),
                spreadRadius: 0,
                blurRadius: 10,
                offset: Offset(0, 4), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.isDoc == true?"Dr${widget.name}":"${widget.name}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                "Date: ${widget.date}",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Reason: ${widget.reason}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
