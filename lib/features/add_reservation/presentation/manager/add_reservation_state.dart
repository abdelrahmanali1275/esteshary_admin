part of 'add_reservation_cubit.dart';

@immutable
abstract class AddReservationState {}

class AddReservationInitial extends AddReservationState {}
class GetAllUsersLoading extends AddReservationState {}
class GetAllUsersLoaded extends AddReservationState {
  final List<UserModel> data;

  GetAllUsersLoaded({required this.data});
}
class GetAllUsersErr extends AddReservationState {
  final String message;

  GetAllUsersErr({required this.message});
}
