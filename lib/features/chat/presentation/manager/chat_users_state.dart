part of 'chat_users_cubit.dart';

@immutable
abstract class ChatUsersState {}

class ChatUsersInitial extends ChatUsersState {}
class GetAllUsersLoading extends ChatUsersState {}
class GetAllUsersLoaded extends ChatUsersState {
  final List<UserModel> data;

  GetAllUsersLoaded({required this.data});
}
class GetAllUsersErr extends ChatUsersState {
  final String message;

  GetAllUsersErr({required this.message});
}
