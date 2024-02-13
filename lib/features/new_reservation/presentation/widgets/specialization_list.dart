import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/data/models/user_model.dart';
import 'package:naraakom/features/new_reservation/presentation/manager/new_reservation_cubit.dart';
import '../../../../core/data/models/doctor_model.dart';
import 'specialization_widget.dart';

class SpecializationList extends StatelessWidget {
  const SpecializationList({super.key, required this.data, required this.userModel});

  final List<DoctorModel> data;
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<NewReservationCubit, NewReservationState>(
        builder: (context, state) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return SpecializationWidget(
                  name: data[index].name,
                  specialist: data[index].specialist,
                  url: data[index].photo,
                  data: data[index], userModel: userModel,);
            },
            itemCount: data.length,
            scrollDirection: Axis.vertical,
          );
        },
      ),
    );
  }
}
