import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/data/firebase/firebase_requests.dart';
import '../../../../core/data/models/user_model.dart';

part 'add_reservation_state.dart';

class AddReservationCubit extends Cubit<AddReservationState> {
  AddReservationCubit() : super(AddReservationInitial());
  FireBaseRequests fireBaseRequests= FireBaseRequests();

  getAllUsers()async{
    emit(GetAllUsersLoading());
    var res=await fireBaseRequests.getUsers();

    res.fold((l) =>     emit(GetAllUsersErr(message: l.message))
        , (r) => emit(GetAllUsersLoaded(data: r)));
  }
}
