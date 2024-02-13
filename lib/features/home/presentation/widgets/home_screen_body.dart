import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/utils/app_strings.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/features/accept_requests/presentation/accept_request.dart';
import 'package:naraakom/features/chat/presentation/chat_users_screen.dart';
import 'package:naraakom/features/custom_requests/presentation/custom_requests_screen.dart';
import 'package:naraakom/features/new_reservation/new_reservation_screen.dart';
import '../../../accept_requests/presentation/manager/accept_requests_cubit.dart';
import '../../../add_doctor/presentation/doctor_screen.dart';
import '../../../all_request/all_request_screen.dart';
import '../../../all_request/presentation/manager/all_requests_cubit.dart';
import '../../../doctor_request/presentation/doctor_request_screen.dart';
import '../../../new_reservation/enter_doctor.dart';
import '../../../new_reservation/presentation/manager/new_reservation_cubit.dart';
import '../../../zoom_room/presentation/zoom_room_screen.dart';
import 'home_screen_widget.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeScreenWidget(
            image: AppAssets.chat,
            text: AppStrings.needHelp,
            function: () {
              ChatUsersScreen().launch(context);
            },
          ),
          HomeScreenWidget(
            image: AppAssets.hagz,
            text: AppStrings.talabat,
            function: () {
              DoctorRequestScreen().launch(context);
            },
          ),
          HomeScreenWidget(
            image: AppAssets.chat,
            text: AppStrings.all,
            function: () {
              AllRequestsScreen().launch(context);
            },
          ),
          HomeScreenWidget(
            image: AppAssets.chat,
            text: AppStrings.addRoom,
            function: () {
              AcceptRequestsScreen().launch(context);
            },
          ),
          HomeScreenWidget(
            image: AppAssets.chat,
            text: AppStrings.addDoctor,
            function: () {
              AddDoctorScreen().launch(context);
            },
          ),

          HomeScreenWidget(
            image: AppAssets.chat,
            text: AppStrings.customRequests,
            function: () {
              CustomRequestsScreen().launch(context);
            },
          ),
        ],
      ).paddingAll(10),
    );
  }
}
