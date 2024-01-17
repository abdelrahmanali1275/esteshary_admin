import 'package:flutter/material.dart';
import 'package:naraakom/features/doctor_request/presentation/widgets/doctor_request_screen_body.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../core/utils/app_strings.dart';

class DoctorRequestScreen extends StatelessWidget {
  const DoctorRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        text: AppStrings.talabat,
      ),
      body: DoctorRequestScreenBody(
      ),
    );
  }
}
