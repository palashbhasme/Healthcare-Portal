import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mini_project/common/global_variables.dart';

class ListCard extends StatelessWidget {
  const ListCard({
    super.key,
    required this.dateTime,
    required this.doctorName,
    required this.reason,
  });

  final String doctorName;
  final DateTime dateTime;
  final String reason;

  @override
  Widget build(BuildContext context) {
    final screenWidth =
        MediaQuery.of(context).size.width; // Access context here
    final screenHeight = MediaQuery.of(context).size.height;
    final _formattedDate = DateFormat('dd MM yyyy').format(dateTime);

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
               "Dr: $doctorName",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                "Date: ${_formattedDate}",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Reason: $reason',
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
