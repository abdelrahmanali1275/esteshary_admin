part of 'doctor_request_cubit.dart';

@immutable
abstract class DoctorRequestState {}

class DoctorRequestInitial extends DoctorRequestState {}
class ConfirmRequestsLoading extends DoctorRequestState {}
class ConfirmRequestsErr extends DoctorRequestState {
  final String message;

  ConfirmRequestsErr({required this.message});
}
class ConfirmRequestsLoaded extends DoctorRequestState {
  final List<RequestModel> data;

  ConfirmRequestsLoaded({required this.data});
}
class RefuseRequestsState extends DoctorRequestState {}
class AddNotesLoading extends DoctorRequestState {}
class AddNotesLoaded extends DoctorRequestState {
  final String message;

  AddNotesLoaded({required this.message});
}
class AddNotesErr extends DoctorRequestState {
  final String message;

  AddNotesErr({required this.message});
}
