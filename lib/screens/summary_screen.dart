import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:mini_project/summary_api/summary_helper.dart';
import 'package:mini_project/widgets/appointment_view_card.dart';

import '../models/summary.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  static const routeName = '/summary-screen';

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  var _myBox = Hive.box('patientBox');
  Summary? summary;

  @override
  void initState() {
    super.initState();
    _getSummary();
  }

  void _getSummary() async {
    try {
      summary = await SummaryHelper.getSummary(_myBox.get('_prescriptionId'))
          as Summary?;
    } catch (error) {
      print("Error fetching summary: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        toolbarHeight: 60,
        title: Text(
          'Arogyam',
          style: GoogleFonts.arbutusSlab(color: Colors.green, fontSize: 26),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.06,
              ),
              summary != null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Patient Name:${summary!.patientName}",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Date:${summary!.date}",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: AppointmentCard(
                  text: summary?.diagnosis.join('\n') ??
                      "Diagnosis not available",
                  height: screenHeight * 0.2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: AppointmentCard(
                  text: summary?.medications.join('\n') ??
                      "Medication not available",
                  height: screenHeight * 0.2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
