import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../../core/data/doctor_model.dart';
import '../../../../core/data/firebase/add_doctor.dart';
import '../../../../core/data/firebase/auth.dart';
import 'package:path/path.dart';

part 'add_doctor_state.dart';

class AddDoctorCubit extends Cubit<AddDoctorState> {
  AddDoctorCubit() : super(AddDoctorInitial());

  static AddDoctorCubit get(context) => BlocProvider.of(context);
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController specialist = TextEditingController();
  File? file;
  String? url;
  getImage() async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? imageGallery =
        await picker.pickImage(source: ImageSource.gallery);

    file = File(imageGallery!.path);
    var imageName = basename(imageGallery.path);
    var refStorage = FirebaseStorage.instance.ref(imageName);
    await refStorage.putFile(file!);
    print(imageGallery.path);
    url = await refStorage.getDownloadURL();
    emit(ImageSuccess());
  }

  String gender = "";
  var key = GlobalKey<FormState>();
  AuthHelper authHelper = AuthHelper();
  FirebaseDoctor firebaseDoctor = FirebaseDoctor();
  addDoctor(context) async {
    // if (key.currentState!.validate()) {
    //   // message validate
    //   AddDoctorErrState("l.message")
    //   return;
    // }
    emit(
      AddDoctorLoadingState(),
    );
    final res = await authHelper.register(
      email.text,
      pass.text,
    );

    res.fold(
      (l) => emit(
        AddDoctorErrState('برجاء ادخال بيانات صحيحة'),
      ),
      (r) async {
        var set = await firebaseDoctor.setDoctorData(DoctorModel(
          doctorId: r,
          name: name.text,
          email: email.text,
          password: pass.text,
          specialist: specialist.text,
          photo: url!,
        ));
        set.fold((l) {
          AddDoctorErrState(l.message);
        }, (r) {
          emit(
            AddDoctorSuccessState("تم التسجيل بنجاح"),
          );
        });
      },
    );
  }
}
