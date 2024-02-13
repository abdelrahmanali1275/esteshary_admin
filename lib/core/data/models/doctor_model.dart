import 'package:naraakom/core/utils/app_strings.dart';

class DoctorModel {
  final String doctorId;
  final String name;
  final String email;
  final String password;
  final String photo;
  final String specialist;

  DoctorModel({
    required this.doctorId,
    required this.name,
    required this.email,
    required this.password,
    required this.photo,
    required this.specialist,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      AppStrings.emailEng: email,
      AppStrings.doctorId: doctorId,
      AppStrings.nameEng: name,
      AppStrings.passwordEng: password,
      AppStrings.specialistEng: specialist,
      AppStrings.photo: photo,
    };
  }

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      doctorId: json['doctorId'],
      name: json['name'],
      password: json["password"],
      photo: json['photo'],
      email: json["email"],
      specialist: json["specialist"],
    );
  }
}
