import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../helper/error/failure.dart';
import '../doctor_model.dart';

class FirebaseDoctor {


  Future<Either<ErrorFailure, String>> setDoctorData(
      DoctorModel doctorModel,
      ) async {
    try {
      final res = await FirebaseFirestore.instance
          .collection("Doctors")
          .doc(doctorModel.doctorId)
          .set(doctorModel.toJson());

      return Right("تم اضافة البيانات بنجاح");
    } catch (e) {
      return Left(ErrorFailure(message: e.toString()));
    }
  }
}


