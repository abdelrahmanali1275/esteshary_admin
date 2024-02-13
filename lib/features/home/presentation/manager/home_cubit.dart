import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:naraakom/core/data/firebase/firebase_requests.dart';
import 'package:naraakom/core/utils/extension/widget.dart';

import '../../../../core/data/models/doctor_model.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../accept_requests/presentation/accept_request.dart';
import '../../../add_doctor/presentation/doctor_screen.dart';
import '../../../all_request/all_request_screen.dart';
import '../../../chat/presentation/chat_users_screen.dart';
import '../../../custom_requests/presentation/custom_requests_screen.dart';
import '../../../doctor_request/presentation/doctor_request_screen.dart';
import '../../../new_reservation/enter_doctor.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  HomeCubit get(context) => BlocProvider.of(context);

// List images = [
//   AppAssets.chat,
//   AppAssets.hagz,
//   AppAssets.hagz
//   AppAssets.hagz,
//   AppAssets.hagz,
//   AppAssets.hagz,
//   AppAssets.hagz,
// ];
// List text = [
//   AppStrings.needHelp,
//   AppStrings.talabat,
//   AppStrings.all,
//   AppStrings.addRoom,
//   AppStrings.addDoctor,
//   AppStrings.newReservation,
//   AppStrings.customRequests,
// ];
// List func = [
//   ChatUsersScreen,
//   DoctorRequestScreen,
//   AllRequestsScreen,
//   AcceptRequestsScreen,
//   AddDoctorScreen,
//   EnterDoctor,
//   CustomRequestsScreen,
// ];
}
