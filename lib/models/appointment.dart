import 'doctor.dart';

class Appointment {
  final String id;
  final DateTime date;
  final String prescription;
  final String remarks;
  final DateTime createdAt;
  final String doctor;
  final String doctorName;

  Appointment({
    required this.doctor,
    required this.doctorName,
    required this.id,
    required this.date,
    required this.prescription,
    required this.remarks,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      "doctorName": this.doctorName,
      "_id": this.id,
      "date": this.date.toIso8601String(),
      "prescription": this.prescription,
      "remarks": this.remarks,
      "createdAt": this.createdAt.toIso8601String(),
      "doctor": this.doctor,
    };
  }

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['_id'],
      doctor: json['doctor'],
      doctorName: json['doctorName'],
      date: DateTime.parse(json['date']),
      prescription: json['prescription'],
      remarks: json['remarks'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
