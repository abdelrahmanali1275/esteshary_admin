import 'package:flutter/material.dart';
import 'package:naraakom/core/utils/app_assets.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/features/chat/presentation/pages/chat_screen.dart';

import '../../../../../config/theme/custom_text_style.dart';
import '../../../../../core/utils/app_colors.dart';

class UsersItem extends StatelessWidget {
  const UsersItem({
    super.key, required this.name, required this.userId, required this.userName,
  });

  final String name;
  final String userId;
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cyan5002,
      child: InkWell(
        onTap: (){
          ChatScreen(userId: userId,userName:userName,).launch(context);
        },
        child: ListTile(
          title: Text(name,style: CustomTextStyles.bodyLargeBlack900Bold20),

          leading: CircleAvatar(
            backgroundImage: AssetImage(AppAssets.chat),
          ),
        ),
      ),
    ).paddingSymmetric(horizontal: 20);
  }
}