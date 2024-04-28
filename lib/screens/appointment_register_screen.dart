import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/widgets/custom_elevated_button.dart';
import 'package:mini_project/widgets/prescription_text_field.dart';
import 'package:mini_project/widgets/upload_button.dart';

import '../../widgets/custom_text_field.dart';
import '../widgets/custom_info_card.dart';

class AppointmentRegisterScreen extends StatefulWidget {
  AppointmentRegisterScreen({super.key});
  static const routName = '/appointment-register-screen;';

  @override
  State<AppointmentRegisterScreen> createState() =>
      _AppointmentRegisterScreenState();
}

class _AppointmentRegisterScreenState extends State<AppointmentRegisterScreen> {
  final _healthFormKey = GlobalKey<FormState>();

  final TextEditingController patientNameController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();
  final TextEditingController allergiesController = TextEditingController();
  final TextEditingController prescriptionController = TextEditingController();
  final TextEditingController remarkController = TextEditingController();
  final TextEditingController testController = TextEditingController();



  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(12.0, 12.0, 8.0, 8.0),
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            CustomCard(
              name: 'Palash',
              age: "18",
              aadhar: "XXXXXXXXXXXX1233",
              userName: "Palash2003",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Date: 2023-04-28", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:18
                  ),),
                ],
              ),
            ),
            Form(
              key: _healthFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Personal Info Section
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextField(
                      controller: patientNameController,
                      hintText: 'Patient Name',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 8, 0, 8.0),
                    child: Text(
                      'Appointment Info',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextField(
                          controller: reasonController,
                          hintText: 'Reason',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextField(
                          controller: remarkController,
                          hintText: 'Remarks',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextField(
                          controller: testController,
                          hintText: 'Tests(if any)',
                        ),
                      )
                    ],
                  ),

                  // Adding some space between sections

                  const Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 8.0, 0, 8.0),
                    child: Text(
                      'Prescription',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PrescriptionTextField(
                      controller: prescriptionController,
                      hintText: 'Medicines, dosage ...',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: UploadButton(
                text: "Submit",
                onPressed: () {
                  if (_healthFormKey.currentState!.validate()) {}
                },
              ),
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Container(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
