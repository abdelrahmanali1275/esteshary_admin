import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/data/models/request_model.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/core/widgets/custom_app_bottom.dart';
import 'package:naraakom/core/widgets/custom_text_form_field.dart';
import 'package:naraakom/features/accept_requests/presentation/manager/accept_requests_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../accept_request.dart';
import 'add_room_dialog.dart';

class AcceptRequestCard extends StatelessWidget {
  const AcceptRequestCard({
    super.key,
    required this.index,
    required this.data,
  });

  final int index;
  final List<RequestModel> data;

  @override
  Widget build(BuildContext context) {
    return
      Card(
      elevation: 2,
      shadowColor: AppColors.primary.withOpacity(.9),
      color: AppColors.lightBlue50,
      margin: const EdgeInsets.only(bottom: 5, left: 10, right: 10, top: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("حجز رقم",
                    style: CustomTextStyles.bodyLargeBlack900Bold20),
                Spacer(),
                Chip(
                  label:
                      Text("${index + 1}", style: CustomTextStyles.fontSize20),
                  backgroundColor: AppColors.primary.withOpacity(.9),
                  padding: EdgeInsets.all(1),
                ),
              ],
            ),
            10.height,
            Row(
              children: [
                Text("حجز باسم  ",
                    style: CustomTextStyles.bodyMediumBlack20001),
                Text("${data[index].user.name}",
                    style: CustomTextStyles.bodyLargeBlack900Bold20),
                const Spacer(),
                ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${data[index].doctor.name}",
                          style: CustomTextStyles.bodyLargeWhiteA700),
                    )),
              ],
            ),
            10.height,
            Text(
                "يوم ${data[index].day} الساعة من ${data[index].from} الى ${data[index].to}",
                style: CustomTextStyles.bodyMediumBlack20001),
            data[index].zoomLink != ''
                ? Text("zoomLink : ${data[index].zoomLink}",
                    style: CustomTextStyles.bodyMediumBlack20001)
                : SizedBox(),
            10.height,
            AddRoomDialog(data: data, index: index),
          ],
        ),
      ),
    ).animate().shimmer().animate().flip();
  }
}
