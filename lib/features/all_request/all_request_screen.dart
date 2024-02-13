import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/features/all_request/presentation/manager/all_requests_cubit.dart';
import 'package:naraakom/features/all_request/presentation/widgets/all_request_screen_body.dart';
import '../../core/widgets/custom_app_bar.dart';

class AllRequestsScreen extends StatelessWidget {
  const AllRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        text: "كل الحجوزات",
      ),
      body: BlocProvider(
        create: (context) => AllRequestsCubit()..allRequests(),
        child: AllRequestsScreenBody(),
      ),
    );
  }
}
