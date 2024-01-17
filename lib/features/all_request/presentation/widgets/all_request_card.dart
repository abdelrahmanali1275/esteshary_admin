import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:naraakom/core/utils/extension/int.dart';
import 'package:naraakom/core/utils/extension/widget.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../config/theme/custom_text_style.dart';

class AllRequestCard extends StatelessWidget {
  const AllRequestCard({
    super.key,
    required this.index,
  });

  final int index;
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
          children: [
            Row(
              children: [
                Text("الحجز رقم   ", style: CustomTextStyles.bodyLargeBlack900Bold20),
                Spacer(),
                Chip(
                  label: Text("$index", style: CustomTextStyles.fontSize20),
                  backgroundColor: AppColors.primary.withOpacity(.9),
                  padding: EdgeInsets.all(1),
                ),
              ],
            ),
            10.height,
            Row(
              children: [
                 Text("محمد احمد علي",
                    style: CustomTextStyles.bodyLargeBlack900Bold20),
                Spacer(),
                ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("دكتور احمد علي",
                          style: CustomTextStyles.bodyLargeWhiteA700),
                    )),
              ],
            ),
            10.height,
             Text("يوم الثلاثاء الساعة من 2:00 الى 2:30",
                style: CustomTextStyles.bodyMediumBlack20001),
          ],
        ),
      ),
    ).animate().flip().animate().shimmer();
  }
}
