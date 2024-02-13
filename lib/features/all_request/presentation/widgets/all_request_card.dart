import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:naraakom/core/data/models/request_model.dart';
import 'package:naraakom/core/utils/extension/int.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../config/theme/custom_text_style.dart';

class AllRequestCard extends StatelessWidget {
  const AllRequestCard({
    super.key,
    required this.index,
    required this.data,
  });

  final int index;
  final List<RequestModel> data;

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text("الحجز رقم   ",
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
                Text("حجز باسم ", style: CustomTextStyles.bodyMediumBlack20001),
                Text("${data[index].user.name}",
                    style: CustomTextStyles.bodyLargeBlack900Bold20),
                Spacer(),
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
            data[index].state == "تم التاكيد في انتظار الكشف"
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        ": Zoom Link",
                        style: CustomTextStyles.bodyMediumBlack20001,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "${data[index].zoomLink}",
                        style: CustomTextStyles.bodyMediumBlack20001,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )
                : SizedBox(),
            Text(
                "يوم ${data[index].day} الساعة من${data[index].from}الى ${data[index].to}",
                style: CustomTextStyles.bodyMediumBlack20001),
            Chip(
              label: Text("${data[index].state}",
                  style: CustomTextStyles.fontCairo),
              backgroundColor: data[index].state == 'في انتظار الدفع'
                  ? AppColors.blueGray400
                  : data[index].state == 'طلب مؤكد'
                      ? AppColors.primary.withOpacity(.9)
                      : data[index].state == "تم التاكيد في انتظار الكشف"
                          ? AppColors.green600
                          : data[index].state == "تم الانتهاء"
                              ? AppColors.black900
                              : AppColors.redA700,
              padding: EdgeInsets.all(1),
            ),
          ],
        ),
      ),
    ).animate().flip().animate().shimmer();
  }
}
