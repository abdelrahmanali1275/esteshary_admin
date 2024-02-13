import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/features/custom_requests/presentation/manager/custom_request_cubit.dart';
import 'package:naraakom/features/custom_requests/presentation/widgets/custom_requests_card.dart';

import '../../../all_request/presentation/widgets/all_request_card.dart';

class CustomRequestsBody extends StatelessWidget {
  const CustomRequestsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomRequestCubit, CustomRequestState>(
      builder: (context, state) {
        print(state);
        if (state is GetCustomRequestLoaded) {
          return ListView.builder(
            itemBuilder: (context, index) => CustomRequestsCard(
              index: index,
              data: state.data,
            ).paddingSymmetric(horizontal: 10),
            itemCount: state.data.length,
          );
        }

        if (state is GetCustomRequestErr) {
          print(state.message);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
