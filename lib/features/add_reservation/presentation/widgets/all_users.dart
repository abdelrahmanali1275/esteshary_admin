import 'package:flutter/material.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import '../../../../config/theme/custom_text_style.dart';
import '../../../../core/data/models/user_model.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../new_reservation/enter_doctor.dart';

class AllUsers extends StatelessWidget {
  const AllUsers({
    super.key, required this.data, required this.index,
  });

  final List<UserModel>data;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cyan5002,
      child: InkWell(
        onTap: (){
          EnterDoctor(
            userModel: data[index],
          ).launch(context);        },
        child: ListTile(
          title: Text(data[index].name,style: CustomTextStyles.bodyLargeBlack900Bold20),

          leading: CircleAvatar(
            backgroundImage: AssetImage(AppAssets.chat),
          ),
        ),
      ),
    ).paddingSymmetric(horizontal: 20);
  }
}