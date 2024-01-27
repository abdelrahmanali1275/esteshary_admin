import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../manager/add_doctor_cubit.dart';
class AddDocSpecialist extends StatelessWidget {
  const AddDocSpecialist({
    super.key,
    required this.cubit,
  });

  final AddDoctorCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      textInputType: TextInputType.text,
      hintText: AppStrings.specialist,
      controller: cubit.specialist,
      validator: (value) {
        if (value!.isEmpty) {
          return AppStrings.specialist;
        }
        return null;
      },
    );
  }
}