part of 'all_requests_cubit.dart';

@immutable
abstract class AllRequestsState {}

class AllRequestsInitial extends AllRequestsState {}

class AllRequestsLoading extends AllRequestsState {}

class AllRequestsErr extends AllRequestsState {
  final String message;

  AllRequestsErr({required this.message});
}

class AllRequestsLoaded extends AllRequestsState {
  final List<RequestModel> data;

  AllRequestsLoaded({required this.data});
}
