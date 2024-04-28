import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/screens/patient_register_screen.dart';
import 'package:mini_project/widgets/custom_elevated_button.dart';

import '../widgets/holder_card.dart';

class UserSelectionScreen extends StatefulWidget {
  const UserSelectionScreen({Key? key}) : super(key: key);
  static const String routName = '/user_selection';

  @override
  State<UserSelectionScreen> createState() => _UserSelectionScreenState();
}

class _UserSelectionScreenState extends State<UserSelectionScreen> {
  bool card1Selected = false;
  bool card2Selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        backgroundColor: Colors.black,
        toolbarHeight: 80,
        title: Center(
          child: Text(
            'Arogyam',
            style: GoogleFonts.arbutusSlab(color: Colors.green, fontSize: 32),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    card1Selected = !card1Selected;
                    if (card1Selected) {
                      card1Selected = false;
                    }
                  },
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        card1Selected = !card1Selected;
                        if (card1Selected) {
                          card2Selected = false;
                        }
                      });
                    },
                    child: HolderCard(
                      path: 'assets/images/patient.png',
                      entity: 'I am a patient',
                      isSelected: card1Selected,
                    ),
                  ),
                ),
                Text(
                  '-or-',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      card2Selected = !card2Selected;
                      if (card2Selected) {
                        card1Selected = false;
                      }
                    });
                  },
                  child: HolderCard(
                    path: 'assets/images/doctor.png',
                    entity: 'I am a doctor',
                    isSelected: card2Selected,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomElevatedButton(
                    text: 'Next',
                    isEnabled: card1Selected || card2Selected ? true : false,
                    onPressed: () {
                      if (card1Selected) {
                        Navigator.pushNamed(
                          context,
                          PatientRegisterScreen.routName,
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
