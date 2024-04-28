import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/screens/history_screen.dart';
import 'package:mini_project/screens/patient_home_screen.dart';
import 'package:mini_project/screens/patient_register_screen.dart';
import 'package:mini_project/screens/patient_view_appointment.dart';
import 'package:mini_project/screens/summary_screen.dart';
import 'package:mini_project/screens/user_selection_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case UserSelectionScreen.routName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => UserSelectionScreen(),
      );
      break;

    case PatientRegisterScreen.routName:
      return MaterialPageRoute(
        builder: (_) => PatientRegisterScreen(),
      );
      break;
    case PatientHomeScreen.routName:
      return MaterialPageRoute(
        builder: (_) => PatientHomeScreen(),
      );
      break;
    case HistoryScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => HistoryScreen(),
      );
      break;
    case PatientAppointmentView.routeName:
      return MaterialPageRoute(builder: (_)=> PatientAppointmentView());
      break;

    case SummaryScreen.routeName:
      return MaterialPageRoute(builder: (_)=> SummaryScreen());
      break;
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Text('Screen does not exist!'),
        ),
      );
  }
}
