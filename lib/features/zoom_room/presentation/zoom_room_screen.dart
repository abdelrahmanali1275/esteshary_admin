import 'package:flutter/material.dart';
import 'package:naraakom/core/utils/app_strings.dart';
import 'package:naraakom/features/zoom_room/presentation/widgets/zoom_room_screen_body.dart';
import '../../../core/widgets/custom_app_bar.dart';

class AddZoomRoomScreen extends StatelessWidget {
  const AddZoomRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        text: AppStrings.addRoom,
      ),
      body: AddZoomRoomScreenBody(),
    );
  }
}
