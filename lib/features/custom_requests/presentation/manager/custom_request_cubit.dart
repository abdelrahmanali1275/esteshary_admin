import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:naraakom/core/data/firebase/firebase_requests.dart';

import '../../../../core/data/models/custom_requests_model.dart';

part 'custom_request_state.dart';

class CustomRequestCubit extends Cubit<CustomRequestState> {
  CustomRequestCubit() : super(CustomRequestInitial());

  FireBaseRequests fireBaseRequests = FireBaseRequests();
  allRequests()async{
    emit(GetCustomRequestLoading());
    var res = await fireBaseRequests.getCustomRequests();
    res.fold((l) => emit(GetCustomRequestErr(message: l.message)), (
        r) => emit(GetCustomRequestLoaded(data: r)));
  }


}
