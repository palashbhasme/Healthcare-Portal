import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mini_project/common/utils.dart';
import 'package:mini_project/models/appointment.dart';
import 'package:mini_project/screens/summary_screen.dart';
import 'package:mini_project/summary_api/summary_helper.dart';
import 'package:mini_project/widgets/upload_button.dart';
import '../appointment_service.dart';
import '../widgets/appointment_view_card.dart';
import '../widgets/custom_card2.dart';
import '../widgets/custom_info_card.dart';
import 'dart:io';

class PatientAppointmentView extends StatefulWidget {
  const PatientAppointmentView({Key? key}) : super(key: key);
  static const routeName = '/appointment_view_patient';

  @override
  State<PatientAppointmentView> createState() => _PatientAppointmentViewState();
}

class _PatientAppointmentViewState extends State<PatientAppointmentView> {
  File? image;
  Appointment? appointment;

  var _myBox = Hive.box('patientBox');

  void _uploadImage() async {
    if (image != null) {
      var id = SummaryHelper.upload(_myBox.get('_id'), image!);
      _myBox.put('_prescriptionId', id);
    }
  }

  void _selectImages() async {
    File? image = await pickImages();
    if (image != null) {
      setState(() {
        this.image = image;
        // SummaryHelper.upload(_myBox.get('_id'), image);
      });
    }
  }

  Future<void> _getAppointment() async {
    try {
      final fetchedAppointments = await AppointmentService.fetchAppointment(
          _myBox.get('_appointmentId'), context);
      appointment = fetchedAppointments;
      print(appointment!.doctorName);
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        toolbarHeight: 60,
        title: Text(
          'Arogyam',
          style: TextStyle(color: Colors.green, fontSize: 24),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: _getAppointment(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Unkown Error'),
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomCard2(
                            name: 'Dr ${appointment?.doctorName}',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Date: ${appointment!.date}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppointmentCard(
                          text: appointment!.remarks,
                          height: 80,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppointmentCard(
                          text: appointment!.remarks,
                          height: 80,
                        ),
                      ),

                      // Adding some space between sections

                      const Padding(
                        padding: EdgeInsets.fromLTRB(8.0, 8.0, 0, 8.0),
                        child: Text(
                          'Prescription',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppointmentCard(
                          text: appointment!.prescription,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: _selectImages,
                          child: image != null
                              ? Container(
                                  height: 150,
                                  width: double.infinity,
                                  child: Image.file(
                                    image as File,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(10),
                                  dashPattern: [10, 4],
                                  strokeCap: StrokeCap.round,
                                  child: Container(
                                    width: double.infinity,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.folder_open,
                                          size: 40,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'Select Prescription Image',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey.shade400,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  UploadButton(
                                      onPressed: _uploadImage,
                                      text: 'Upload Prescription'),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  UploadButton(
                                      onPressed: (){
                                        Navigator.pushNamed(context, SummaryScreen.routeName);
                                      },
                                      text: 'Get Summary'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
              }),
        ),
      ),
    );
  }
}
