import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mini_project/models/patient.dart';

class PatientProvider extends ChangeNotifier {
  Patient _patient = Patient(
    id: '',
    firstName: '',
    lastName: '',
    username: '',
    password: '',
    email: '',
    phone: '',
    age: '',
    aadharNumber: '',
    gender: '',
    address: '',
    dob: '',
  );

  Patient get patient => _patient;
  void setPatient(String patient){
    _patient = Patient.fromJson(jsonDecode(patient));
  }
}
