import 'package:flutter/material.dart';
import 'package:naraakom/core/utils/app_strings.dart';
import 'package:naraakom/core/widgets/custom_app_bar.dart';
import 'package:naraakom/features/chat/presentation/widgets/chat_screen_body.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        text: AppStrings.needHelp,
      ),
      body: ChatScreenBody(),
    );
  }
}
