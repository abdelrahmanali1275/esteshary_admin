import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/utils/app_strings.dart';
import 'package:naraakom/core/widgets/custom_app_bar.dart';

import 'manager/add_reservation_cubit.dart';
import 'widgets/add_reservation_body.dart';

class AddReservationScreen extends StatelessWidget {
  const AddReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: AppStrings.addReservation,
      ),
      body: BlocProvider(
        create: (context) => AddReservationCubit()..getAllUsers(),
        child: AddReservationBody(),
      ),
    );
  }
}
