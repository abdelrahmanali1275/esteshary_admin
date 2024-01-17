import 'package:flutter/material.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/features/doctor_request/presentation/widgets/request_card.dart';

class DoctorRequestScreenBody extends StatelessWidget {
  const DoctorRequestScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => RequestCard(index: index+1,
      ).paddingSymmetric(horizontal: 10),
      itemCount: 10,
    );
  }
}
