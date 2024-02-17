import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/data/models/custom_requests_model.dart';
import 'package:naraakom/core/data/models/user_model.dart';
import 'package:naraakom/core/utils/app_strings.dart';
import '../models/Timer.dart';
import '../../helper/error/failure.dart';
import '../models/doctor_model.dart';
import '../models/request_model.dart';

class FireBaseRequests {
  Future<Either<ErrorFailure, List<RequestModel>>> getAllRequests() async {
    try {
      var res = await FirebaseFirestore.instance.collection("Requests").get();
      return Right(res.docs
          .map<RequestModel>((e) => RequestModel.fromJson(e.data()))
          .toList());
    } catch (e) {
      return Left(ErrorFailure(message: e.toString()));
    }
  }

  Future<Either<ErrorFailure, List<CustomRequestsModel>>>
      getCustomRequests() async {
    try {
      var res =
          await FirebaseFirestore.instance.collection("CustomRequest").get();
      return Right(res.docs
          .map<CustomRequestsModel>(
              (e) => CustomRequestsModel.fromJson(e.data()))
          .toList());
    } catch (e) {
      return Left(ErrorFailure(message: e.toString()));
    }
  }

  Future<Either<ErrorFailure, List<DoctorModel>>> getAllDoctor() async {
    try {
      var res = await FirebaseFirestore.instance.collection("Doctors").get();
      return Right(res.docs
          .map<DoctorModel>((e) => DoctorModel.fromJson(e.data()))
          .toList());
    } catch (e) {
      return Left(ErrorFailure(message: e.toString()));
    }
  }

  Future<Either<ErrorFailure, List<UserModel>>> getUsers() async {
    try {
      var res = await FirebaseFirestore.instance
          .collection(AppStrings.collectionUsers)
          .get();
      return Right(res.docs
          .map<UserModel>((e) => UserModel.fromJson(e.data()))
          .toList());
    } catch (e) {
      return Left(ErrorFailure(message: e.toString()));
    }
  }

  Future<Either<ErrorFailure, List<RequestModel>>> getRequestsWaiting() async {
    try {
      var res = await FirebaseFirestore.instance
          .collection(AppStrings.requestsCollection)
          .where("state", isEqualTo: AppStrings.waiting)
          .get();
      return Right(res.docs
          .map<RequestModel>((e) => RequestModel.fromJson(e.data()))
          .toList());
    } catch (e) {
      return Left(ErrorFailure(message: e.toString()));
    }
  }

  Future<Either<ErrorFailure, List<RequestModel>>> acceptRequests() async {
    try {
      var res = await FirebaseFirestore.instance
          .collection(AppStrings.requestsCollection)
          .where("state", isEqualTo: AppStrings.accept)
          .get();
      return Right(res.docs
          .map<RequestModel>((e) => RequestModel.fromJson(e.data()))
          .toList());
    } catch (e) {
      return Left(ErrorFailure(message: e.toString()));
    }
  }

  Future<Either<ErrorFailure, String>> addRoom(zoomLink, idd) async {
    try {
      var res = await FirebaseFirestore.instance
          .collection(AppStrings.requestsCollection)
          .doc("$idd")
          .update(
              {"zoomLink": zoomLink, "state": "تم التاكيد في انتظار الكشف"});
      return Right("تم اضافة الغرفة بنجاح");
    } catch (e) {
      return Left(ErrorFailure(message: e.toString()));
    }
  }

  Future<Either<ErrorFailure, String>> addRequest({
    required DateTime? day,
    required String from,
    required String to,
    required DoctorModel doctorModel,
    required UserModel userModel,
    required daysOfRequest,
    required int num,
  }) async {
    var id = Random().nextInt(99999);
    try {
      await FirebaseFirestore.instance.collection("Requests").doc("$id").set({
        "user": userModel.toJson(),
        "id": id,
        "from": from,
        "to": to,
        "num":num,
        "doctor": doctorModel.toJson(),
        "createAt": DateTime.now(),
        "state": "في انتظار الدفع",
        "day": daysOfRequest[day!.weekday - 1],
        "date": day.format(),
        "zoomLink": "",
        "notes": "",
      });
      await FirebaseFirestore.instance
          .collection("Doctors")
          .doc("${doctorModel.doctorId}")
          .collection("Timer")
          .doc("$num")
          .update({
        "active": false,
      });
      return Right("تم حجز الميعاد بنجاح برجاء الدفع لتاكيد الحجز");
    } catch (e) {
      return Left(ErrorFailure(message: e.toString()));
    }
  }

  Future<Either<ErrorFailure, List<Timer>>> getDayTimer(
      DoctorModel doctorModel, DateTime addRequestDay, daysOfRequest) async {
    try {
      var res = await FirebaseFirestore.instance
          .collection("Doctors")
          .doc("${doctorModel.doctorId}")
          .collection("Timer")
          .where("date", isEqualTo: addRequestDay.format())
          .get();
      res.docs.forEach((element) {
        element.data();
      });
      return Right(
          res.docs.map<Timer>((e) => Timer.fromJson(e.data())).toList());
    } catch (e) {
      return Left(ErrorFailure(message: e.toString()));
    }
  }

  Future<Either<ErrorFailure, String>> addNotes(notes, idd) async {
    try {
      await FirebaseFirestore.instance
          .collection(AppStrings.requestsCollection)
          .doc("$idd")
          .update({
        "notes": notes,
      });
      return Right("تم اضافة الملاحظات بنجاح");
    } catch (e) {
      return Left(ErrorFailure(message: e.toString()));
    }
  }
}
