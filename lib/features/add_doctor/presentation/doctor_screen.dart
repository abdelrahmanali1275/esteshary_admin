import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/widgets/custom_app_bar.dart';
import 'package:naraakom/features/add_doctor/presentation/manager/add_doctor_cubit.dart';
import '../../../core/utils/app_strings.dart';
import 'widgets/doctor_screen_body.dart';

class AddDoctorScreen extends StatelessWidget {
  const AddDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        text: AppStrings.addDoctor,
      ),
      body: BlocProvider(
        create: (context) => AddDoctorCubit(),
        child: const DoctorScreenBody(),
      ),
    );
  }
}
