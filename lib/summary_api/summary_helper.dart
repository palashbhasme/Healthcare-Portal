import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mini_project/common/global_variables.dart';
class SummaryHelper {
  static Future<void> upload(String id, File image) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$uri2/upload'),
      );
      request.fields['personId'] = id;
      var multipartFile = await http.MultipartFile.fromPath('file', image.path);
      request.files.add(multipartFile);
      var response = await request.send();

      // Handle response (check status code, etc.)

      print(response);
    } catch (e) {
      print('Error uploading image: $e');
      // Handle upload error (show user message, etc.)
    }

  }
  static Future<dynamic> getSummary(String id) async {
    Summary summary;
    try {
     var response = await http.post(Uri.parse('$uri2/extractAndAnalyze/${id}'), body:{});
     print(response.body);
     summary = jsonDecode(response.body);
     return summary;
      // Handle response (check status code, etc.)

      print(response);
    } catch (e) {
      print('Error uploading image: $e');
      // Handle upload error (show user message, etc.)
    }
  }

}