import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/utils/app_colors.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/features/add_doctor/presentation/manager/add_doctor_cubit.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_app_bottom.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

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
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: Text(state.message).paddingAll(10),
                ),
              );
            }
            if (state is AddDoctorSuccessState) {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: Text(state.message).paddingAll(10),
                ),
              );
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
                                ? CircleAvatar(
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
                      CustomTextFormField(
                        hintText: AppStrings.email,
                        textInputType: TextInputType.emailAddress,
                        controller: cubit.email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.pleaseEmail;
                          }
                          return null;
                        },
                      ),
                      10.height,
                      Text(
                        AppStrings.password,
                        style: CustomTextStyles.bodyMediumGrey600,
                      ),
                      10.height,
                      CustomTextFormField(
                        textInputType: TextInputType.visiblePassword,
                        hintText: AppStrings.password,
                        controller: cubit.pass,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.pleasePassword;
                          }
                          return null;
                        },
                      ),
                      10.height,
                      Text(
                        AppStrings.name,
                        style: CustomTextStyles.bodyMediumGrey600,
                      ),
                      10.height,
                      CustomTextFormField(
                        hintText: AppStrings.name,
                        textInputType: TextInputType.text,
                        controller: cubit.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.pleaseName;
                          }
                          return null;
                        },
                      ),
                      10.height,
                      Text(
                        AppStrings.specialist,
                        style: CustomTextStyles.bodyMediumGrey600,
                      ),
                      10.height,
                      CustomTextFormField(
                        textInputType: TextInputType.text,
                        hintText: AppStrings.specialist,
                        controller: cubit.specialist,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.specialist;
                          }
                          return null;
                        },
                      ),
                      20.height,
                      state is AddDoctorLoadingState
                          ? const Center(child: CircularProgressIndicator())
                          : CustomAppBottom(
                        label: AppStrings.save,
                        onPressed: () {
                          cubit.addDoctor(context);
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
