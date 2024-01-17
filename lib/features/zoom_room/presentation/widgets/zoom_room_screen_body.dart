import 'package:flutter/material.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/features/zoom_room/presentation/widgets/zoom_room_card.dart';

class AddZoomRoomScreenBody extends StatelessWidget {
  const AddZoomRoomScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => AddZoomRoomCard(index: index+1,
      ).paddingSymmetric(horizontal: 10),
      itemCount: 10,
    );
  }
}
