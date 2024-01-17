import 'package:flutter/material.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/utils/app_strings.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import '../../../add_doctor/presentation/doctor_screen.dart';
import '../../../all_request/all_request_screen.dart';
import '../../../chat/chat_screen.dart';
import '../../../doctor_request/presentation/doctor_request_screen.dart';
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
              ChatScreen().launch(context);
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
              AddZoomRoomScreen().launch(context);
            },
          ),
          HomeScreenWidget(
            image: AppAssets.chat,
            text: AppStrings.addDoctor,
            function: () {
              AddDoctorScreen().launch(context);
            },
          ),
        ],
      ).paddingAll(10),
    );
  }
}
