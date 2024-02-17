import 'package:flutter/material.dart';
import 'package:naraakom/core/utils/app_strings.dart';
import 'package:naraakom/features/accept_requests/presentation/widgets/doctor_accept_body.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class AcceptRequestsScreen extends StatelessWidget {
  const AcceptRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        text: AppStrings.addRoom,
      ),
      body: AcceptRequestsBody(),
    );
  }
}
