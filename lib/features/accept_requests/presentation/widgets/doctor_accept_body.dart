import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/core/widgets/show_toast.dart';
import 'package:naraakom/features/accept_requests/presentation/manager/accept_requests_cubit.dart';

import '../../../../config/theme/custom_text_style.dart';
import '../../../../core/widgets/data_empty.dart';
import 'accept_request_card.dart';

class AcceptRequestsBody extends StatelessWidget {
  const AcceptRequestsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AcceptRequestsCubit, AcceptRequestsState>(
      builder: (context, state) {
        if (state is AcceptRequestsLoaded) {
          return ListView.builder(
            itemBuilder: (context, index) => state.data.isNotEmpty
                ? AcceptRequestCard(
                    index: index,
                    data: state.data,
                  ).paddingSymmetric(horizontal: 10)
                : DataEmpty(txt: 'مؤكدة'),
            itemCount: state.data.isEmpty ? 1 : state.data.length,
          );
        }
        if (state is AcceptRequestsErr) {
          return Container(
            child: Text(
              state.message,
              style: CustomTextStyles.bodyLargeBlack900Bold20,
            ),
          );
        } else {
          context.read<AcceptRequestsCubit>().acceptRequests();
          return Center(child: CircularProgressIndicator());
        }
      },
      listener: (BuildContext context, AcceptRequestsState state) {
        if (state is AddRoomErr) {
          showToast(text: state.message, state: ToastStates.error);
        }
        if (state is AddRoomLoaded) {
          showToast(text: state.message, state: ToastStates.success);
        }
      },
    );
  }
}
