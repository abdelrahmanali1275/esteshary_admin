import 'package:naraakom/core/data/models/doctor_model.dart';
import 'package:naraakom/core/data/models/user_model.dart';

class RequestModel {
  final int id;
  final String date;
  final String day;
  final String notes;
  final String state;
  final String zoomLink;
  final String from;
  final String to;
  final int num;
  final DateTime createdAt;
  final DoctorModel doctor;
  final UserModel user;

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      id: json['id'],
      date: json['date'],
      day: json['day'],
      notes: json['notes'] ?? '',
      state: json['state'],
      from: json['from'] ?? '',
      to: json['to'] ?? '',
      zoomLink: json['zoomLink'] ?? '',
      createdAt: json['createAt'].toDate(),
      doctor: DoctorModel.fromJson(json['doctor']),
      user: UserModel.fromJson(json['user']), num: json["num"],
    );
  }

  RequestModel(
      {required this.id,
      required this.date,
      required this.day,
      required this.notes,
      required this.state,
      required this.zoomLink,
      required this.from,
      required this.to,
      required this.createdAt,
      required this.doctor,
      required this.user,
      required this.num,
      });
}
