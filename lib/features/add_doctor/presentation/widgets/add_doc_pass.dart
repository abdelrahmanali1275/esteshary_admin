import 'package:flutter/material.dart';
import 'package:naraakom/core/utils/extension/widget.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../manager/add_doctor_cubit.dart';

class AddDocPass extends StatelessWidget {
  const AddDocPass({
    super.key,
    required this.cubit,
  });

  final AddDoctorCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      textInputType: TextInputType.visiblePassword,
      hintText: AppStrings.password,
      controller: cubit.pass,
      suffix: cubit.lookPass
          ? Icon(Icons.remove_red_eye_outlined).onTap(() {
              cubit.lookPassChange();
            })
          : Icon(Icons.visibility_off_outlined).onTap(() {
              cubit.lookPassChange();
            }),
      obscureText: cubit.lookPass,
      validator: (value) {
        if (value!.isEmpty) {
          return AppStrings.pleasePassword;
        } else if (value.length < 6) {
          return AppStrings.shortPassword;
        }
        return null;
      },
    );
  }
}
