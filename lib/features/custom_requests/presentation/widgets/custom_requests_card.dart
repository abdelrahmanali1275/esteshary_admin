import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/data/models/custom_requests_model.dart';
import 'package:naraakom/core/utils/app_strings.dart';
import 'package:naraakom/core/utils/extension/int.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/core/widgets/custom_app_bottom.dart';
import 'package:naraakom/features/custom_requests/presentation/manager/record_cubit/record_cubit.dart';
import 'package:naraakom/features/custom_requests/presentation/widgets/play_record.dart';
import 'package:naraakom/features/new_reservation/enter_doctor.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../config/theme/custom_text_style.dart';

class CustomRequestsCard extends StatelessWidget {
  const CustomRequestsCard({
    super.key,
    required this.index,
    required this.data,
  });

  final int index;
  final List<CustomRequestsModel> data;

  // AudioPlayer audio=AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: AppColors.primary.withOpacity(.9),
      color: AppColors.lightBlue50,
      margin: const EdgeInsets.only(bottom: 5, left: 10, right: 10, top: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("الحجز رقم   ",
                    style: CustomTextStyles.bodyLargeBlack900Bold20),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("حجز باسم ",
                        style: CustomTextStyles.bodyMediumBlack20001),
                    Text("${data[index].user.name}",
                        style: CustomTextStyles.bodyLargeBlack900Bold20),
                  ],
                ),
                data[index].audioLink.isNotEmpty
                    ? PlayRecord(index: index, data: data)
                    : SizedBox(),
              ],
            ),
            10.height,
            Text("${data[index].time.format()}",
                style: CustomTextStyles.bodyMediumBlack20001),
            10.height,
            data[index].text.isNotEmpty
                ? Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("${data[index].text}",
                        style: CustomTextStyles.bodyMediumBlack20001),
                  )
                : SizedBox(),
            10.height,
            CustomAppBottom(
              label: AppStrings.newHagz,
              onPressed: () {
                EnterDoctor(
                  userModel: data[index].user,
                ).launch(context);
              },
            )
          ],
        ),
      ),
    ).animate().flip().animate().shimmer();
  }
}


