import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/features/chat/presentation/manager/chat_cubit.dart';
import '../../../../../core/utils/app_colors.dart';

class SelectedFileWidget extends StatelessWidget {
  const SelectedFileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        if (state is FileImageLoading) {
          return const Center(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: CircularProgressIndicator(),
          ));
        }
        return Container(
          color: AppColors.primary,
          child: Stack(
            children: [
              Container(
                width: double.maxFinite,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(.9),
                    borderRadius: BorderRadius.circular(15)),
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    visualDensity: VisualDensity.compact,
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    minVerticalPadding: 0,
                    leading: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: AppColors.blueGray900,
                      ),
                      child: Text(
                        context
                            .read<ChatCubit>()
                            .file!
                            .path
                            .split('/')
                            .last
                            .split(".")
                            .last,
                        style:  TextStyle(color: AppColors.primary.withOpacity(.9), fontSize: 16),
                      ),
                    ),
                    title: Text(
                      context
                          .read<ChatCubit>()
                          .file!
                          .path
                          .split('/')
                          .last
                          .split(".")
                          .first,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    subtitle: Text(
                      context.read<ChatCubit>().formatBytes(
                          context.read<ChatCubit>().file!.lengthSync()),
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    context.read<ChatCubit>().removeFile();
                  },
                  icon:  Icon(
                    Icons.close,
                    color: AppColors.primary.withOpacity(.9),
                  ))
            ],
          ),
        ).paddingOnly(top: 5);
      },
    );
  }
}
