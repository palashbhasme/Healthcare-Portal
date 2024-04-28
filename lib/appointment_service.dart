import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mini_project/common/error_handler.dart';
import 'package:mini_project/common/global_variables.dart';
import 'package:mini_project/common/utils.dart';
import 'package:mini_project/models/appointment.dart';
import 'package:mini_project/screens/history_screen.dart';
import 'global_variable.dart';
import 'dart:convert';

class AppointmentService {
  static Future fetchAllAppointments(String id, BuildContext context) async {
    List<Appointment> allAppointments = [];
    try {
      final response = await http.get(
        Uri.parse('$uri/api/patient/getPatientAppointments/${id}'),
      );

      if (response.statusCode > 200 || response.statusCode < 300) {

        final jsonData = jsonDecode(response.body);
        List<dynamic> appointmentsJson = jsonData['appointments'];

        for (var appointmentJson in appointmentsJson) {
          allAppointments.add(Appointment.fromJson(appointmentJson));
        }
      } else {
        throw 'Failed to load appointments: ${response.statusCode}';
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return allAppointments;
  }



  static Future fetchAppointment(String id, BuildContext context) async {
    Appointment appointment;
    try {
       final response = await http.get(
        Uri.parse('$uri/api/patient/getAppointment/$id'),
      );
       print(response.statusCode);
       print(jsonDecode(response.body));
      if (response.statusCode > 200 || response.statusCode < 300) {
        final jsonData = jsonDecode(response.body);
        print(jsonData['appointment']['doctor']);
        appointment = Appointment.fromJson(jsonData['appointment']);
        return appointment;
      }else{
        throw 'Failed to load appointments: ${response.statusCode}';
      }
    } catch (e) {
      print("error fetching appointment");

      showSnackBar(context, e.toString());
    }
  }

}
