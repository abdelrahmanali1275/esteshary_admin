import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:naraakom/core/data/models/request_model.dart';
import 'package:naraakom/core/utils/app_strings.dart';

import '../../helper/error/failure.dart';
import '../models/doctor_model.dart';

class FirebaseDoctor {
  Future<Either<ErrorFailure, String>> setDoctorData(
      DoctorModel doctorModel,
      ) async {
    try {
       await FirebaseFirestore.instance
          .collection(AppStrings.doctorsCollection)
          .doc(doctorModel.doctorId)
          .set(doctorModel.toJson());

      return Right(AppStrings.addDoctorDataSuccess);
    } catch (e) {
      return Left(ErrorFailure(message: e.toString()));
    }
  }


}


