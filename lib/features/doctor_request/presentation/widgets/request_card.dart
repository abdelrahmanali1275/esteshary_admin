import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/utils/extension/int.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/features/doctor_request/presentation/manager/doctor_request_cubit.dart';

import '../../../../../config/theme/custom_text_style.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../core/data/models/request_model.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../accept_requests/presentation/accept_request.dart';
import 'notes_dialog.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({
    super.key,
    this.widget,
    required this.index,
    required this.data,
  });

  final Widget? widget;
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("طلب حجز جديد   ",
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
                Text("حجز جديد من  ",
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
            10.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                data[index].notes != ''
                    ? Text("اضفت ملاحظاتك هنا",
                    style: CustomTextStyles.bodyMediumBlack20001)
                    : SizedBox(),
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            NotesDialog(data: data, index: index),
                      );
                    },
                    child: Text(
                      "اضف ملاحظاتك",
                      style: CustomTextStyles.bodyLargeWhiteA700,
                    ).paddingAll(5)),
              ],
            ),
            10.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Chip(
                  label: const Text("تأكيد"),
                  backgroundColor: AppColors.primary.withOpacity(1),
                ).onTap(() {
                  context
                      .read<DoctorRequestCubit>()
                      .stateRequest(data, index, "طلب مؤكد");
                }),
                10.width,
                const Chip(
                  label: Text("الغاء"),
                ).onTap(() {
                  context
                      .read<DoctorRequestCubit>()
                      .stateRequest(data, index, "طلب ملغي");
                }),
              ],
            ),
          ],
        ),
      ),
    ).animate().shimmer().animate().flip();
  }
}
