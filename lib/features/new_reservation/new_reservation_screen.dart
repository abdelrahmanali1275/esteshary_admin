import 'package:flutter/material.dart';
import 'package:naraakom/core/data/models/user_model.dart';
import 'package:naraakom/core/utils/app_strings.dart';
import '../../core/widgets/custom_app_bar.dart';
import 'presentation/widgets/new_reservation_body.dart';

class NewReservationScreen extends StatelessWidget {
  const NewReservationScreen({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: AppStrings.timeAvailable,
      ),
      body: NewReservationBody(
        userModel: userModel,
      ),
    );
  }
}
