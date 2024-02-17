import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/config/theme/custom_text_style.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/core/widgets/data_empty.dart';
import 'package:naraakom/features/doctor_request/presentation/manager/doctor_request_cubit.dart';
import 'package:naraakom/features/doctor_request/presentation/widgets/request_card.dart';

class DoctorRequestScreenBody extends StatelessWidget {
  const DoctorRequestScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorRequestCubit, DoctorRequestState>(
      builder: (context, state) {
        if (state is ConfirmRequestsLoaded) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return state.data.isNotEmpty
                  ? RequestCard(
                      index: index,
                      data: state.data,
                    ).paddingSymmetric(horizontal: 10)
                  : DataEmpty(txt: "");
            },
            itemCount: state.data.isEmpty?1:state.data.length,
          );
        }
        if (state is ConfirmRequestsErr) {
          return Container(
            child: Text(
              state.message,
              style: CustomTextStyles.bodyLargeBlack900Bold20,
            ),
          );
        }
        context.read<DoctorRequestCubit>().confirmRequests();
        return Center(child: CircularProgressIndicator());

      },
    );
  }
}
