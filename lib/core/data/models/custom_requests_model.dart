import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:naraakom/core/data/models/user_model.dart';

class CustomRequestsModel {
  final String audioLink;
  final String text;
  final DateTime time;
  final UserModel user;

  CustomRequestsModel(
      {required this.audioLink,
      required this.text,
      required this.time,
      required this.user});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "audioLink": audioLink,
      "text": text,
      "time": time,
      "user": user,
    };
  }

  factory CustomRequestsModel.fromJson(Map<String, dynamic> json) {
    return CustomRequestsModel(
      audioLink: json["audioLink"] ?? '',
      text: json["text"] ?? '',
      time: (json['time'] as Timestamp).toDate(),
      user: UserModel.fromJson(json["user"]),
    );
  }
}
