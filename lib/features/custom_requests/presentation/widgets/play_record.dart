import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/utils/extension/widget.dart';

import '../../../../core/data/models/custom_requests_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../manager/record_cubit/record_cubit.dart';

class PlayRecord extends StatefulWidget {
  const PlayRecord({
    super.key,
    required this.index,
    required this.data,
  });

  final int index;
  final List<CustomRequestsModel> data;

  @override
  State<PlayRecord> createState() => _PlayRecordState();
}

class _PlayRecordState extends State<PlayRecord> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecordCubit(),
      child: BlocBuilder<RecordCubit, RecordState>(
        builder: (context, state) {
          var c = context.read<RecordCubit>();
          return c.selectedIndex == widget.index
              ? ElevatedButton(
              onPressed: ()  {
                  c.stop(widget.index);
                  setState(() {
                  });
              },
              child: Icon(Icons.stop,
                  color: AppColors.whiteA700)
                  .paddingSymmetric(vertical: 5))
              : ElevatedButton(
              onPressed: ()  {
                 c.play(
                  widget.data[widget.index].audioLink,widget.index
                );
                 setState(() {
                 });
              },
              child: Icon(Icons.play_arrow,
                  color: AppColors.whiteA700)
                  .paddingSymmetric(vertical: 5));
        },
      ),
    );
  }
}