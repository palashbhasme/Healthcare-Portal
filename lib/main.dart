import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mini_project/routes.dart';
import 'package:mini_project/screens/history_screen.dart';
import 'package:mini_project/screens/patient_view_appointment.dart';
import 'package:mini_project/screens/patient_login_page.dart';
import 'package:hive/hive.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('patientBox');
  var box2 = await Hive.openBox('doctorBox');

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  var _myBox = Hive.box('patientBox');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: (settings) => generateRoute(
        settings,
      ),
      theme: ThemeData(
        fontFamily: ' Inter-VariableFont.ttf',
      ),
      home: _myBox.get('name') == null
          ? PatientLoginPage()
          : HistoryScreen(),
    );
  }
}
