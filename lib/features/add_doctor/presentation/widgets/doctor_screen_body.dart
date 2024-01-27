import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/utils/app_colors.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/features/add_doctor/presentation/manager/add_doctor_cubit.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_app_bottom.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/show_toast.dart';
import 'add_doc_email.dart';
import 'add_doc_name.dart';
import 'add_doc_pass.dart';
import 'add_doc_specialist.dart';

class DoctorScreenBody extends StatelessWidget {
  const DoctorScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocConsumer<AddDoctorCubit, AddDoctorState>(
          listener: (context, state) {
            if (state is AddDoctorErrState) {
              showToast(text: state.message, state: ToastStates.error);
            }
            if (state is AddDoctorSuccessState) {
              showToast(text: state.message, state: ToastStates.success);
            }
            if (state is ImageErr) {
              showToast(text: state.message, state: ToastStates.error);
            }
          },
          builder: (context, state) {
            var cubit = AddDoctorCubit.get(context);
            return Form(
              key: cubit.key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.height,
                  Row(
                    children: [
                      Text(
                        AppStrings.addPhoto,
                        style: CustomTextStyles.bodyMediumGrey600,
                      ),
                      20.width,
                      CircleAvatar(
                        backgroundColor: AppColors.primary,
                        radius: 30,
                        child: cubit.url != null
                            ? state is ImageLoading
                                ? Center(child: CircularProgressIndicator())
                                : CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      cubit.url!,
                                    ),
                                    radius: 30,
                                  )
                            : CircleAvatar(
                                backgroundImage: AssetImage(
                                  AppAssets.hagz,
                                ),
                                radius: 30,
                              ),
                      ).onTap(() {
                        cubit.getImage();
                      }),
                    ],
                  ),
                  10.height,
                  Text(
                    AppStrings.email,
                    style: CustomTextStyles.bodyMediumGrey600,
                  ),
                  10.height,
                  AddDocEmail(cubit: cubit),
                  10.height,
                  Text(
                    AppStrings.password,
                    style: CustomTextStyles.bodyMediumGrey600,
                  ),
                  10.height,
                  AddDocPass(cubit: cubit),
                  10.height,
                  Text(
                    AppStrings.name,
                    style: CustomTextStyles.bodyMediumGrey600,
                  ),
                  10.height,
                  AddDocName(cubit: cubit),
                  10.height,
                  Text(
                    AppStrings.specialist,
                    style: CustomTextStyles.bodyMediumGrey600,
                  ),
                  10.height,
                  AddDocSpecialist(cubit: cubit),
                  20.height,
                  state is AddDoctorLoadingState
                      ? const Center(child: CircularProgressIndicator())
                      : CustomAppBottom(
                          label: AppStrings.save,
                          onPressed: () {
                            if (cubit.key.currentState!.validate()) {
                              cubit.addDoctor(context);
                            }
                          },
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
