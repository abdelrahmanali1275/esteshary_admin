part of 'add_doctor_cubit.dart';

@immutable
abstract class AddDoctorState {}

class AddDoctorInitial extends AddDoctorState {}
class AddDoctorLoadingState extends AddDoctorState {}

class AddDoctorSuccessState extends AddDoctorState {
  final String message;

  AddDoctorSuccessState(this.message);
}

class AddDoctorErrState extends AddDoctorState {
  final String message;

  AddDoctorErrState(this.message);
}
class ImageSuccess extends AddDoctorState{

}
class RemoveController extends AddDoctorState{

}