import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:mini_project/common/global_variables.dart';
import 'package:mini_project/appointment_service.dart';
import 'package:mini_project/common/utils.dart';
import 'package:mini_project/models/appointment.dart';
import 'package:mini_project/screens/patient_view_appointment.dart';
import 'package:mini_project/widgets/history_list_card.dart';

import '../widgets/custom_serach_bar.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  static const routeName = '/history_screen';

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<Appointment> appointments = [];
  Appointment? appointment;
  var _myBox = Hive.box('patientBox');

  @override
  void initState() {
    super.initState();
  }

  Future<void> _getAppointments(String id) async {
    try {
      final fetchedAppointments =
          await AppointmentService.fetchAllAppointments(id, context);
      appointments = fetchedAppointments;
    } catch (error) {
      print(error);
    }
  }

  void _showAppointmentScreen(String appointmentId) async {
    _myBox.put('_appointmentId', appointmentId);
    Navigator.pushNamed(
      context,
      PatientAppointmentView.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: GlobalVariables.secondary_color,
              floating: false,
              pinned: false,
              expandedHeight: 60,
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'History',
                  style: GoogleFonts.arbutusSlab(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            SliverAppBar(
              automaticallyImplyLeading: false,
              collapsedHeight: 60.0,
              backgroundColor: GlobalVariables.secondary_color,
              expandedHeight: 80.0,
              pinned: true,
              title: CustomSearchBar(),
            ),
            FutureBuilder(
                future: _getAppointments(_myBox.get("_id")),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SliverToBoxAdapter(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error ${snapshot.error}'),
                    );
                  } else {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final appointment = appointments[index];
                          return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: (){
                                _showAppointmentScreen(appointment.id);
                              },
                              child: ListCard(
                                dateTime: appointment.date,
                                reason: appointment.remarks,
                                doctorName: appointment.doctorName,
                              ),
                            ),
                          );
                        },
                        childCount: appointments.length,
                      ),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
