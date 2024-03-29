import 'package:flutter/material.dart';
import 'package:naraakom/core/utils/app_assets.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/features/chat/presentation/pages/chat_screen.dart';

import '../../../../../config/theme/custom_text_style.dart';
import '../../../../../core/data/models/user_model.dart';
import '../../../../../core/utils/app_colors.dart';

class UsersItem extends StatelessWidget {
  const UsersItem({
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
          ChatScreen(userId: data[index].userId,userName:data[index].name,).launch(context);
        },
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