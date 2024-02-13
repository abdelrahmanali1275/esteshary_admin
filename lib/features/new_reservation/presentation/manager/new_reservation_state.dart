part of 'new_reservation_cubit.dart';

@immutable
abstract class NewReservationState {}

class NewReservationInitial extends NewReservationState {}

class NewReservationLoading extends NewReservationState {}
class GetDayTimerLoading extends NewReservationState {}

class GetDayTimerLoaded extends NewReservationState {
  final List<Timer> timer;

  GetDayTimerLoaded({required this.timer});
}

class GetDayTimerErr extends NewReservationState {
  final String message;

  GetDayTimerErr({required this.message});
}

class AddRequestLoading extends NewReservationState {}

class AddRequestErr extends NewReservationState {
  final String message;

  AddRequestErr({required this.message});
}
class AddRequestLoaded extends NewReservationState {
  final String message;

  AddRequestLoaded({required this.message});
}

