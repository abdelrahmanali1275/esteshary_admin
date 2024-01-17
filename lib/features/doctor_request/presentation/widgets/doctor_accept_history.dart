import 'package:flutter/material.dart';
import 'package:naraakom/features/doctor_request/presentation/widgets/request_card.dart';

class DoctorAcceptHistoryBody extends StatelessWidget {
  const DoctorAcceptHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => RequestCard(
        widget: const SizedBox(),
        index: index+1,
      ),
      itemCount: 10,
    );
  }
}
