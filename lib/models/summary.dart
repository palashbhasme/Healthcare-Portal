import 'package:flutter/material.dart';

class Summary {
  final String patientName;
  final List<String> medications;
  final List<String> diagnosis;
  final String date;
  final String? nextReview;
  final List<String> investigations;

  Summary({
    required this.patientName,
    required this.medications,
    required this.diagnosis,
    required this.date,
    required this.nextReview,
    required this.investigations,
  });

  factory Summary.fromJson(Map<String, dynamic> json) {
    return Summary(
      patientName: json['patient'] ?? '',
      medications: List<String>.from(json['medications'] ?? []),
      diagnosis: List<String>.from(json['diagnosis'] ?? []),
      date: json['date'] ?? '',
      nextReview: json['next_review'],
      investigations: List<String>.from(json['investigations'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'patientName': patientName,
      'medications': medications,
      'diagnosis': diagnosis,
      'date': date,
      'nextReview': nextReview,
      'investigations': investigations,
    };
  }
}
