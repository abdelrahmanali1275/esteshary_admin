import 'package:flutter/material.dart';
import 'package:naraakom/core/app_export.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../manager/add_doctor_cubit.dart';

class AddDocEmail extends StatelessWidget {
  const AddDocEmail({
    super.key,
    required this.cubit,
  });

  final AddDoctorCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: AppStrings.email,
      textInputType: TextInputType.emailAddress,
      controller: cubit.email,
      validator: (value) {
        if (value!.isEmpty) {
          return AppStrings.pleaseEmail;
        } else if (value.validateEmail == false) {
          return AppStrings.pleaseEmailTrue;
        }
        return null;
      },
    );
  }
}