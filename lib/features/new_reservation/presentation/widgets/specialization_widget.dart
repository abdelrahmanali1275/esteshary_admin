import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/features/new_reservation/new_reservation_screen.dart';

import '../../../../config/theme/custom_text_style.dart';
import '../../../../core/data/models/doctor_model.dart';
import '../../../../core/data/models/user_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../new_reservation/presentation/manager/new_reservation_cubit.dart';

class SpecializationWidget extends StatelessWidget {
  const SpecializationWidget({
    super.key,
    required this.name,
    required this.specialist,
    required this.url,
    required this.data, required this.userModel,
  });

  final String name;
  final String specialist;
  final String url;
  final DoctorModel? data;
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cyan5002,
      child: InkWell(
        onTap: () {
          context.read<NewReservationCubit>().doctorModel = data;
          NewReservationScreen(userModel: userModel,).launch(context);
        },
        child: ListTile(
          title: Text(name, style: CustomTextStyles.bodyLargeBlack900Bold20),
          trailing:Text(specialist, style: CustomTextStyles.bodyLargeBlack900),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(url),
          ),
        ),
      ),
    ).paddingSymmetric(horizontal: 20);
  }
}
