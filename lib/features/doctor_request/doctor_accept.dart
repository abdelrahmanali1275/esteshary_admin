import 'package:flutter/material.dart';
import 'package:naraakom/features/doctor_request/presentation/widgets/doctor_accept_history.dart';

import '../../../core/widgets/custom_app_bar.dart';

class DoctorAcceptHistoryScreen extends StatelessWidget {
  const DoctorAcceptHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        text: "الحجز المؤكد",
      ),
      body: DoctorAcceptHistoryBody(),
    );
  }
}
