import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mini_project/common/utils.dart';
void httpErrorHandler({
  required http.Response response,
  required BuildContext context,
  required Function onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
    case 201: // Created
      onSuccess();
      break;

    case 400: // Bad Request
      final message = jsonDecode(response.body)['msg'];
      showSnackBar(context, message ?? 'Bad Request');
      break;
    case 401: // Unauthorized
      showSnackBar(context, 'Unauthorized access');
      break;
    case 403: // Forbidden
      showSnackBar(context, 'Forbidden action');
      break;
    case 404: // Not Found
      showSnackBar(context, 'Resource not found');
      break;

    case 500: // Internal Server Error
    case 502: // Bad Gateway
    case 503: // Service Unavailable
      showSnackBar(context, 'Server error occurred');
      break;

    default:
      print('Unexpected status code: ${response.statusCode}');
      showSnackBar(context, 'An error occurred');
  }
}
