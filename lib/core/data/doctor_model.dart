class DoctorModel {
  final String doctorId;
  final String name;
  final String email;
  final String password;
  final String photo;
  final String specialist;

  DoctorModel(
      {required this.doctorId,
      required this.name,
      required this.email,
      required this.password,
      required this.photo,
      required this.specialist});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'doctorId': doctorId,
      'name': name,
      'password': password,
      'specialist': specialist,
      'photo':photo,
    };
  }
}
