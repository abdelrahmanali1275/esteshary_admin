import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:naraakom/core/utils/app_strings.dart';
import 'package:naraakom/features/chat/presentation/pages/widgets/users_item.dart';

class ChatUsersScreenBody extends StatelessWidget {
  const ChatUsersScreenBody({super.key, required this.users});

  final List<QueryDocumentSnapshot> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return UsersItem(
          name: users[index][AppStrings.nameEng],
          userId: users[index][AppStrings.userId],
          userName: users[index][AppStrings.nameEng],
        );
      },
      itemCount: users.length,
      scrollDirection: Axis.vertical,
    );
  }
}
