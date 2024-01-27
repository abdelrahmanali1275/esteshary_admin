import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chat_users_state.dart';

class ChatUsersCubit extends Cubit<ChatUsersState> {
  ChatUsersCubit() : super(ChatUsersInitial());

}
