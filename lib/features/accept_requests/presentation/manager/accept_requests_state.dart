part of 'accept_requests_cubit.dart';

@immutable
abstract class AcceptRequestsState {}

class AcceptRequestsInitial extends AcceptRequestsState {}
class AcceptRequestsLoading extends AcceptRequestsState {}
class AcceptRequestsErr extends AcceptRequestsState {
  final String message;

  AcceptRequestsErr({required this.message});
}
class AcceptRequestsLoaded extends AcceptRequestsState {
  final List<RequestModel> data;

  AcceptRequestsLoaded({required this.data});
}
class AddRoomLoading extends AcceptRequestsState {}
class AddRoomErr extends AcceptRequestsState {
  final String message;

  AddRoomErr({required this.message});
}
class AddRoomLoaded extends AcceptRequestsState {
  final String message;

  AddRoomLoaded({required this.message});
}
