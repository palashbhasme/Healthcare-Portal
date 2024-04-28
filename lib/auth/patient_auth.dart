import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mini_project/common/error_handler.dart';
import 'package:mini_project/common/utils.dart';
import 'package:mini_project/models/patient.dart';
import 'package:mini_project/screens/patient_home_screen.dart';
import '../common/global_variables.dart';

class PatientAuth {
  static Future registerUser(Patient patient, BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse('$uri/api/patient/register'),
        body: {
          'firstName': patient.firstName,
          'lastName': patient.lastName,
          'username': patient.username,
          'password': patient.password,
          'email': patient.email,
          'phone': patient.phone,
          'age': patient.age,
          'aadharNumber': patient.aadharNumber,
          'gender': patient.gender,
          'address': patient.address,
          'dob': patient.dob,
        },
      );
      print(response.body);
      httpErrorHandler(response: response, context: context, onSuccess: () {});
      return jsonDecode(response.body);
    } catch (error) {
      print('error here');
      print('Error registering patient: $error');
    }
  }

  static Future loginUser(Patient patient, BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse('$uri/api/patient/login'),
        body: {
          'username': patient.username,
          'password': patient.password,
        },
      );
      print(response.body);
      httpErrorHandler(
          response: response,
          context: context,
          onSuccess: () {
            Navigator.pushReplacementNamed(
              context,
              PatientHomeScreen.routName,
            );
          });
      return jsonDecode(response.body);
    } catch (error) {
      print('error here');
      print('Error registering patient: $error');
    }
  }

// static Future<dynamic> getUser(BuildContext context, String patientId) async {
//   try {
//     final response = await http.get(
//       Uri.parse(
//         '$uri/api/patient/getPatientAppointments/:${patientId}',
//       ),
//     );
//     print(response.body);
//
//     httpErrorHandler(
//       response: response,
//       context: context,
//       onSuccess: () {
//         // Navigator.pushReplacementNamed(
//         //   context,
//         //   PatientHomeScreen.routName,
//         // );
//         },
//     );
//   } catch (e) {
//     print(e.toString());
//   }
// }
}
