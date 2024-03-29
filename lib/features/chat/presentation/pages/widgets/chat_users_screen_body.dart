import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/utils/app_strings.dart';
import 'package:naraakom/core/widgets/show_toast.dart';
import 'package:naraakom/features/chat/presentation/manager/chat_users_cubit.dart';
import 'package:naraakom/features/chat/presentation/pages/widgets/users_item.dart';

class ChatUsersScreenBody extends StatelessWidget {
  const ChatUsersScreenBody({super.key,});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatUsersCubit, ChatUsersState>(
      builder: (context, state) {
        if(state is GetAllUsersLoaded){
          return  ListView.builder(
            itemBuilder: (context, index) {
              return UsersItem(data: state.data, index: index,
              );
            },
            itemCount: state.data.length,
            scrollDirection: Axis.vertical,
          );
        }
        if(state is GetAllUsersErr){
          showToast(text: state.message, state: ToastStates.error);
        }
        return  Center(child: CircularProgressIndicator());
      },
    );
  }
}
