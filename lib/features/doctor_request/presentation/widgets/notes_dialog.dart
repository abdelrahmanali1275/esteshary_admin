
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/utils/extension/widget.dart';

import '../../../../core/data/models/request_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../manager/doctor_request_cubit.dart';

class NotesDialog extends StatelessWidget {
  const NotesDialog({super.key, required this.data, required this.index,});

 final List<RequestModel>data;
 final int index;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorRequestCubit, DoctorRequestState>(
      builder: (context, state) {
        return AlertDialog(
          backgroundColor: AppColors.whiteA700,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("اضافة ملاحظات",
                style: CustomTextStyles.bodyLargeBlack900,).center(),
              10.height,
              CustomTextFormField(
                maxLines: 3,
                controller: context.read<DoctorRequestCubit>().controller,
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: ()async {
                  await context
                      .read<DoctorRequestCubit>()
                      .addNotes(
                      data[index].id);
                  Navigator.pop(context);
                },
                child: Text("ارسال",
                    style: CustomTextStyles.bodyMediumPrimary)),
          ],
        );
      },
    );
  }
}

