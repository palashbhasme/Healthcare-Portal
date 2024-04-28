import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:mini_project/common/global_variables.dart';
import 'package:mini_project/appointment_service.dart';
import 'package:mini_project/screens/history_screen.dart';
import 'package:mini_project/widgets/custom_info_card.dart';
import 'package:mini_project/widgets/custom_glance_card.dart';
import 'package:mini_project/widgets/options_card.dart';
import 'package:provider/provider.dart';

import '../patient_provider.dart';

class PatientHomeScreen extends StatefulWidget {
  const PatientHomeScreen({super.key});

  static const routName = '/patient_home_screen';

  @override
  State<PatientHomeScreen> createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen> {
  var _myBox = Hive.box('patientBox');



  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        title: Text(
          'Arogyam',
          style: GoogleFonts.arbutusSlab(color: Colors.green, fontSize: 24),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomCard(
                    name: _myBox.get('name'),
                    age: _myBox.get('age'),
                    aadhar: _myBox.get('aadharNumber'),
                    userName: _myBox.get('userName'),
                  ),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'You Previous Appointment',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // CustomGlanceCard(isDoc: false, date: _myBox.get("date"),),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 4.0, 10.0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OptionsCard(
                      onTap: () {
                        Navigator.pushNamed(context, HistoryScreen.routeName);
                      },
                      color: GlobalVariables.secondary_color,
                      image: 'assets/images/history.webp',
                      text: 'Your History',
                    ),
                    SizedBox(
                      width: 2.0,
                      // Adjust width for line thickness
                      height: screenHeight * 0.15,
                      // Expands to fill remaining vertical space
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                    OptionsCard(
                      onTap: () {},
                      color: GlobalVariables.tertiary_color,
                      image: 'assets/images/prescription.webp',
                      text: ' Add Prescription',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
