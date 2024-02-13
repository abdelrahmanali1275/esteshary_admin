import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/features/all_request/presentation/manager/all_requests_cubit.dart';
import 'package:naraakom/features/all_request/presentation/widgets/all_request_card.dart';

import '../../../../config/theme/custom_text_style.dart';

class AllRequestsScreenBody extends StatelessWidget {
  const AllRequestsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllRequestsCubit, AllRequestsState>(
      builder: (context, state) {
        if(state is AllRequestsLoaded) {
          return ListView.builder(
            itemBuilder: (context, index) =>
                AllRequestCard(
                  index: index , data: state.data,
                ).paddingSymmetric(horizontal: 10),
            itemCount: state.data.length,
          );
        }if(state is AllRequestsErr){
          return Container(
            child: Text(state.message,style: CustomTextStyles.bodyLargeBlack900Bold20,),
          );
        }
        else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
