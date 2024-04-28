import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Future<File?> pickImages() async {
//   try {
//     final result = await FilePicker.platform.pickFiles(
//       allowMultiple: false, // Adjust as needed
//     );
//
//     if (result != null && result.files.isNotEmpty) {
//       final file = File(result.files.single.path!);
//       return file;
//     } else {
//       return null;
//     }
//   } catch (e) {
//     print('Error picking prescription: $e');
//     return null;
//   }
// }

Future<File?> pickImages() async {
  try {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
    );

    if (result != null && result.files.isNotEmpty) {
      final file = File(result.files.single.path!);
      return file;
    } else {
      return null;
    }
  } catch (e) {
    print('Error picking image: $e');
    return null;
  }
}

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
