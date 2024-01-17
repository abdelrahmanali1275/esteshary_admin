import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:naraakom/core/data/firebase/add_doctor.dart';

import '../../helper/error/failure.dart';


class AuthHelper {
  FirebaseDoctor firebaseDoctor= FirebaseDoctor();


Future<Either<ErrorFailure,String>> register(
    email,password
    )async{
  try {
    var res = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    return Right(res.user!.uid);
  }  catch (e) {
   return Left(ErrorFailure(message: e.toString()),);
  }
}
}
