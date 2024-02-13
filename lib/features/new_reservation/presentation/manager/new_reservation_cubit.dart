import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:naraakom/core/data/firebase/firebase_requests.dart';
import 'package:naraakom/core/data/models/user_model.dart';
import 'package:naraakom/core/utils/app_strings.dart';
import '../../../../core/data/models/doctor_model.dart';
import '../../Timer.dart';

part 'new_reservation_state.dart';

class NewReservationCubit extends Cubit<NewReservationState> {
  NewReservationCubit() : super(NewReservationInitial());

  NewReservationCubit get(context) => BlocProvider.of(context);

  DoctorModel? doctorModel;

  UserModel?userModel;
  List daysOfRequest = [
    AppStrings.monDay,
    AppStrings.tuesDay,
    AppStrings.wednesDay,
    AppStrings.thursDay,
    AppStrings.friDay,
    AppStrings.saturDay,
    AppStrings.sunDay,
  ];
  var day2;
  DateTime? addRequestDay;

  FireBaseRequests fireBaseRequests = FireBaseRequests();

  dayName() {
    day2 = daysOfRequest[addRequestDay!.weekday - 1];
    emit(NewReservationLoading());
  }

  getDayTimer() async {
    emit(NewReservationLoading());
    if(addRequestDay==null){
      addRequestDay=DateTime(1);
    }
    var res = await fireBaseRequests.getDayTimer(
        doctorModel!, addRequestDay!, daysOfRequest);
    res.fold((l) => emit(GetDayTimerErr(message: l.message)),
        (r) => emit(GetDayTimerLoaded(timer: r)));
  }

  addRequest(from, to,) async {
    emit(AddRequestLoading());
    var res = await fireBaseRequests.addRequest(
      day: addRequestDay,
      daysOfRequest: daysOfRequest,
      userModel: userModel!,
      doctorModel: doctorModel!,
      from: from,
      to: to,
    );
    res.fold((l) => emit(AddRequestErr(message: l.message)), (r) {
      emit(AddRequestLoaded(message: r));
    });
  }
}

// getDayTimer(day) async {
//   emit(NewReservationLoading());
//   try {
//     var res = await FirebaseFirestore.instance
//         .collection("Doctors")
//         .doc("${doctorModel!.doctorId}")
//         .collection("Timer")
//         .where("day", isEqualTo: day.toString())
//         .get();
//     res.docs.forEach((element) {
//       element.data();
//     });
//     emit(NewReservationLoaded(
//         timer:
//             res.docs.map<Timer>((e) => Timer.fromJson(e.data())).toList()));
//   } catch (e) {
//     emit(NewReservationErr(message: e.toString()));
//   }
// }
