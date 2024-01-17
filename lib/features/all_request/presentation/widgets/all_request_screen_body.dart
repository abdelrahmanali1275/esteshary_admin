import 'package:flutter/material.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/features/all_request/presentation/widgets/all_request_card.dart';

class AllRequestsScreenBody extends StatelessWidget {
  const AllRequestsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => AllRequestCard(index: index+1,
      ).paddingSymmetric(horizontal: 10),
      itemCount: 10,
    );
  }
}
