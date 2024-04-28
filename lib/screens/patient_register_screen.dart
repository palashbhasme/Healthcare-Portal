import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:mini_project/auth/patient_auth.dart';
import 'package:mini_project/models/patient.dart';

import 'package:mini_project/widgets/custom_elevated_button.dart';
import 'package:mini_project/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class PatientRegisterScreen extends StatefulWidget {
  const PatientRegisterScreen({Key? key}) : super(key: key);
  static const String routName = '/patient_login';

  @override
  State<PatientRegisterScreen> createState() => _PatientRegisterScreenState();
}

class _PatientRegisterScreenState extends State<PatientRegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var userData;

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _aadharNumberController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  var _myBox = Hive.box('patientBox');

  void _writeData(Patient userData) {
    _myBox.put('_id', userData.id);
    _myBox.put('name', '${userData.firstName} ${userData.lastName}');
    _myBox.put('age', userData.age);
    _myBox.put('userName', userData.username);
    _myBox.put('aadharNumber', userData.aadharNumber);
  }

  void _register() async {
    if (_formKey.currentState!.validate()) {
      Patient patient = Patient(
        id: '',
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        username: _usernameController.text,
        password: _passwordController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        age: _ageController.text,
        aadharNumber: _aadharNumberController.text,
        gender: _genderController.text,
        address: _addressController.text,
        dob: _dobController.text,
      );

      userData = await PatientAuth.registerUser(patient, context);
      _writeData(Patient.fromJson(userData));

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Account Created')));

    }
  }
  // List<DropdownMenuItem<String>> genders = [
  //   DropdownMenuItem(
  //     value: 'Male',
  //     child: Text('Male'),
  //   ),
  //   DropdownMenuItem(
  //     value: 'Female',
  //     child: Text('Female'),
  //   ),
  //   DropdownMenuItem(
  //     value: 'Other',
  //     child: Text('Other'),
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        toolbarHeight: 80,
        title: Text(
          'Arogyam',
          style: GoogleFonts.arbutusSlab(color: Colors.green),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                CustomTextField(
                  controller: _firstNameController,
                  hintText: 'First Name',
                ),
                SizedBox(height: 16),
                CustomTextField(
                  controller: _lastNameController,
                  hintText: 'Last Name',
                ),
                SizedBox(height: 16),
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
                SizedBox(height: 16),
                CustomTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16),
                CustomTextField(
                  controller: _phoneController,
                  hintText: 'Phone',
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 16),
                CustomTextField(
                  controller: _ageController,
                  hintText: 'Age',
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16),
                CustomTextField(
                  controller: _aadharNumberController,
                  hintText: 'Aadhar Number',
                ),
                SizedBox(height: 16),
                CustomTextField(
                  controller: _genderController,
                  hintText: 'Gender',
                ),
                SizedBox(height: 16),
                CustomTextField(
                  controller: _addressController,
                  hintText: 'Address',
                ),
                SizedBox(height: 16),
                CustomTextField(
                  controller: _dobController,
                  hintText: 'Date of Birth',
                ),
                SizedBox(height: 24),
                CustomElevatedButton(
                  text: 'Register',
                  isEnabled: true,
                  onPressed: () async {
                     _register();

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
