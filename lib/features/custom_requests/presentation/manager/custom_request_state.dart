part of 'custom_request_cubit.dart';

@immutable
abstract class CustomRequestState {}

class CustomRequestInitial extends CustomRequestState {}

class GetCustomRequestLoading extends CustomRequestState {}

class GetCustomRequestLoaded extends CustomRequestState {
  final List<CustomRequestsModel> data;

  GetCustomRequestLoaded({required this.data});
}

class GetCustomRequestErr extends CustomRequestState {
  final String message;

  GetCustomRequestErr({required this.message});
}
