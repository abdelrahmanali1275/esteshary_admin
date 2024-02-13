import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/app_export.dart';

import '../../../../config/theme/custom_text_style.dart';
import '../../../../core/data/models/request_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_app_bottom.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../manager/accept_requests_cubit.dart';

class AddRoomDialog extends StatelessWidget {
  const AddRoomDialog({
    super.key,
    required this.data,
    required this.index,
  });

  final List<RequestModel> data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CustomAppBottom(
      label: AppStrings.addOneRoom,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) =>
              BlocBuilder<AcceptRequestsCubit, AcceptRequestsState>(
            builder: (context, state) {
              return AlertDialog(
                backgroundColor: AppColors.whiteA700,
                title: Column(
                  children: [
                    Center(
                        child: Text(
                      "اضف لينك الغرفة",
                      style: CustomTextStyles.bodyLargeBlack900,
                    )),
                    10.height,
                    CustomTextFormField(
                      controller:
                          context.read<AcceptRequestsCubit>().controller,
                    ),
                    10.height,
                    state is AcceptRequestsLoading
                        ? const Center(child: CircularProgressIndicator())
                        : CustomAppBottom(
                            label: AppStrings.save,
                            onPressed: () async {
                              await context
                                  .read<AcceptRequestsCubit>()
                                  .addRoom(data[index].id);
                              Navigator.pop(context);
                            }),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
