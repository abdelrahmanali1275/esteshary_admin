import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:naraakom/core/utils/extension/int.dart';
import 'package:naraakom/core/utils/extension/widget.dart';

import '../../../../../config/theme/custom_text_style.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../doctor_accept.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({
    super.key, this.widget,required this.index,
  });

  final Widget? widget;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: AppColors.primary.withOpacity(.9),
      color: AppColors.lightBlue50,
      margin: const EdgeInsets.only(bottom: 5,left: 10,right: 10,top: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
             children: [
               Text(
                    "طلب حجز جديد   ",
                    style: CustomTextStyles.bodyLargeBlack900Bold20
                ),
               Spacer(),
               Chip(
                 label: Text(
                      "$index",
                      style: CustomTextStyles.fontSize20
                  ),
                 backgroundColor: AppColors.primary.withOpacity(.9),
                 padding: EdgeInsets.all(1),
               ),
             ],
           ),
            10.height,
            Row(
              children: [
                Text("حجز جديد من  ",style: CustomTextStyles.bodyMediumBlack20001),
                 Text("محمد احمد علي",style: CustomTextStyles.bodyLargeBlack900Bold20),
                const Spacer(),
                ElevatedButton(
                    onPressed: (){}, child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                      "دكتور احمد علي",
                      style: CustomTextStyles.bodyLargeWhiteA700
                ),
                    )),

              ],
            ),
            10.height,
            Text("يوم الثلاثاء الساعة من 2:00 الى 2:30",style: CustomTextStyles.bodyMediumBlack20001),
            10.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Chip( label: const Text("تأكيد"),backgroundColor: AppColors.primary.withOpacity(1),).onTap((){
                  const DoctorAcceptHistoryScreen().launch(context);
                }),

                10.width,
                const Chip( label: Text("رفض"),).onTap((){
                  const DoctorAcceptHistoryScreen().launch(context);
                }),
              ],
            ),
          ],
        ),
      ),
    ).animate().shimmer().animate().flip();
  }
}