import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../manager/add_doctor_cubit.dart';
class AddDocName extends StatelessWidget {
  const AddDocName({
    super.key,
    required this.cubit,
  });

  final AddDoctorCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: AppStrings.name,
      textInputType: TextInputType.text,
      controller: cubit.name,
      validator: (value) {
        if (value!.isEmpty) {
          return AppStrings.pleaseName;
        }
        return null;
      },
    );
  }
}
