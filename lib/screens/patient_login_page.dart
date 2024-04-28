import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../auth/patient_auth.dart';
import '../models/patient.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_field.dart';

class PatientLoginPage extends StatefulWidget {
  const PatientLoginPage({super.key});

  @override
  State<PatientLoginPage> createState() => _DoctorLoginPageState();
}

class _DoctorLoginPageState extends State<PatientLoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _writeData(Patient userData) {
    var _myBox = Hive.box('patientBox');
    _myBox.put('_id', userData.id);
    _myBox.put('name', '${userData.firstName}${userData.lastName}');
    _myBox.put('age', userData.age);
    _myBox.put('userName', userData.username);
    _myBox.put('aadharNumber', userData.aadharNumber);
  }

  void _login() async {
    Patient patient = Patient(
      id: '',
      firstName: '',
      lastName: '',
      username: _usernameController.text,
      password: _passwordController.text,
      email: '',
      phone: '',
      age: '',
      aadharNumber: '',
      gender: '',
      address: '',
      dob: '',
    );
    var _userData = await PatientAuth.loginUser(patient, context);
    _writeData(Patient.fromJson(_userData,));

  }

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
      ),      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                CustomTextField(
                  controller: _usernameController,
                  hintText: 'Username',
                ),
                SizedBox(height: 16),
                CustomTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                CustomElevatedButton(
                  text: 'Login',
                  isEnabled: true,
                  onPressed: () async {
                    _login();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
