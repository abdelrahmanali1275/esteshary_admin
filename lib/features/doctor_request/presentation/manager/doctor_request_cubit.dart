import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:naraakom/core/data/firebase/firebase_requests.dart';
import 'package:naraakom/core/data/models/request_model.dart';
import 'package:naraakom/core/utils/app_strings.dart';

import '../../../chat/presentation/pages/widgets/class_notifaction_api.dart';

part 'doctor_request_state.dart';

class DoctorRequestCubit extends Cubit<DoctorRequestState> {
  DoctorRequestCubit() : super(DoctorRequestInitial());

  FireBaseRequests fireBaseRequests = FireBaseRequests();

  confirmRequests() async {
    emit(ConfirmRequestsLoading());
    var res = await fireBaseRequests.getRequestsWaiting();
    res.fold((l) => emit(ConfirmRequestsErr(message: l.message)),
        (r) {
NotificationApi.notificationsDetails(body: "body", title: "title", payload: "payload");
          emit(ConfirmRequestsLoaded(data: r));
        });
  }
  acceptRequest(data, index, ) {
    FirebaseFirestore.instance
        .collection("Requests")
        .doc('${data[index].id}')
        .update({
      "state": AppStrings.accept,
    });
    emit(RefuseRequestsState());
  }
  cancelRequest(id,doctorId,num )async {
    FirebaseFirestore.instance
        .collection("Requests")
        .doc('$id')
        .update({
      "state": AppStrings.cancel,
    });
   await FirebaseFirestore.instance.collection("Doctors").doc(doctorId).collection("Timer").doc("$num").update({
      "active":true
    });
    emit(RefuseRequestsState());
  }

  TextEditingController controller = TextEditingController();

  addNotes(idd) async {
    emit(AddNotesLoading());
    var res = await fireBaseRequests.addNotes(controller.text, idd);

    res.fold((l) => emit(AddNotesErr(message: l.message)), (r) {
      emit(AddNotesLoaded(message: r));
      controller.clear();
    });
  }
}
