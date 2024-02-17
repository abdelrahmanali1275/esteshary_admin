import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/show_toast.dart';
import '../../../chat/presentation/pages/widgets/users_item.dart';
import '../manager/add_reservation_cubit.dart';
import 'all_users.dart';

class AddReservationBody extends StatelessWidget {
  const AddReservationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddReservationCubit, AddReservationState>(
      builder: (context, state) {
        if(state is GetAllUsersLoaded){
          return  ListView.builder(
            itemBuilder: (context, index) {
              return AllUsers(data: state.data, index: index,);
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
