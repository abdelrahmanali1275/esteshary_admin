import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:naraakom/core/data/firebase/firebase_requests.dart';

import '../../../../core/data/models/user_model.dart';

part 'chat_users_state.dart';

class ChatUsersCubit extends Cubit<ChatUsersState> {
  ChatUsersCubit() : super(ChatUsersInitial());

  FireBaseRequests fireBaseRequests= FireBaseRequests();

  getAllUsers()async{
    emit(GetAllUsersLoading());
    var res=await fireBaseRequests.getUsers();

    res.fold((l) =>     emit(GetAllUsersErr(message: l.message))
        , (r) => emit(GetAllUsersLoaded(data: r)));
  }
}
