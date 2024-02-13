import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:naraakom/core/data/firebase/firebase_requests.dart';

import '../../../../core/data/models/request_model.dart';

part 'accept_requests_state.dart';

class AcceptRequestsCubit extends Cubit<AcceptRequestsState> {
  AcceptRequestsCubit() : super(AcceptRequestsInitial());

  FireBaseRequests fireBaseRequests = FireBaseRequests();
  TextEditingController controller = TextEditingController();

  acceptRequests() async {
    emit(AcceptRequestsLoading());
    var res = await fireBaseRequests.acceptRequests();
    res.fold((l) => emit(AcceptRequestsErr(message: l.message)),
        (r) => emit(AcceptRequestsLoaded(data: r)));
  }

  addRoom(idd) async {
    emit(AddRoomLoading());
    var res = await fireBaseRequests.addRoom("${controller.text}",idd);
    res.fold((l) => emit(AddRoomErr(message: l.message)),
        (r) => emit(AddRoomLoaded(message: r)));
    controller.clear();
  }
}
