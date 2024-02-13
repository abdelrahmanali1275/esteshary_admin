import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/utils/app_strings.dart';
import 'package:naraakom/core/widgets/custom_app_bar.dart';
import 'package:naraakom/features/custom_requests/presentation/manager/custom_request_cubit.dart';
import 'widgets/custom_requests_body.dart';

class CustomRequestsScreen extends StatelessWidget {
  const CustomRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: AppStrings.customRequests,
      ),
      body: BlocProvider(
        create: (context) => CustomRequestCubit()..allRequests(),
        child: CustomRequestsBody(),
      ),
    );
  }
}
