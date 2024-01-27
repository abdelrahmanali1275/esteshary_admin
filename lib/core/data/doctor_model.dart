import 'package:naraakom/core/utils/app_strings.dart';

class DoctorModel {
  final String doctorId;
  final String name;
  final String email;
  final String password;
  final String photo;
  final String specialist;
  final String? saturDay;
  final String? sunDay;
  final String? monDay;
  final String? tuesDay;
  final String? wendesDay;
  final String? thursDay;
  final String? friDay;

  DoctorModel(
      {required this.doctorId,
      required this.name,
      required this.email,
      required this.password,
      required this.photo,
      required this.specialist,
       this.saturDay,
       this.sunDay,
       this.monDay,
       this.tuesDay,
       this.wendesDay,
       this.thursDay,
       this.friDay});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      AppStrings.emailEng: email,
      AppStrings.doctorId: doctorId,
      AppStrings.nameEng: name,
      AppStrings.passwordEng: password,
      AppStrings.specialistEng: specialist,
      AppStrings.photo: photo,
      AppStrings.saturDay:saturDay,
      AppStrings.sunDay:sunDay,
      AppStrings.monDay:monDay,
      AppStrings.tuesDay:tuesDay,
      AppStrings.wednesDay:wendesDay,
      AppStrings.thursDay:thursDay,
      AppStrings.friDay:friDay,
    };
  }
}
