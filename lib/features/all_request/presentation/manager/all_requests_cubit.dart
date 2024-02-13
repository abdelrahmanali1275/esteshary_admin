import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:naraakom/core/data/firebase/firebase_requests.dart';

import '../../../../core/data/models/request_model.dart';

part 'all_requests_state.dart';

class AllRequestsCubit extends Cubit<AllRequestsState> {
  AllRequestsCubit() : super(AllRequestsInitial());

  FireBaseRequests fireBaseRequests = FireBaseRequests();

  allRequests() async {
    emit(AllRequestsLoading());
    var res = await fireBaseRequests.getAllRequests();
    res.fold((l) {
      print(l.message);
      emit(AllRequestsErr(message: l.message));
    },
        (r) => emit(AllRequestsLoaded(data: r)));
  }
}
