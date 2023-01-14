// ignore_for_file: camel_case_types, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/cubits/Register/states.dart';
import 'package:media/model/media_user_model.dart';

class MediaRegisterCubit extends Cubit<MediaRegisterStates> {
  MediaRegisterCubit() : super(MediaRegisterInitialState());

  static MediaRegisterCubit get(context) => BlocProvider.of(context);

  //
  void userRegister({
    required String email,
    required String name,
    required String phone,
    required String password,
  }) {
    emit(MediaRegisterLoadinState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      //بعد نجاح انشاء المستخدم نقوم بانشاء له بياناته الخاصه
      // print(value.user!.email);
      //print(value.user!.uid);
      userCreate(
        email: value.user!.email.toString(),
        name: name,
        phone: phone,
        uId: value.user!.uid,
      );
      // emit(MediaRegisterSuccessState());
    }).catchError((error) {
      emit(MediaRegisterErrorState(error.toString()));
    });
  }

  //انشاء المستخدم
  void userCreate({
    required String email,
    required String name,
    required String phone,
    required String uId,
  }) {
    //انشاء مودل خاص بنا من اجل التعامل مع البيانات
    MediaUserModel userModel = MediaUserModel(
        emali: email,
        name: name,
        phone: phone,
        uId: uId,
        bio: 'write you bio',
        cover:
            'https://img.freepik.com/free-photo/standard-quality-control-concept-m_23-2150041853.jpg?w=1380&t=st=1673729257~exp=1673729857~hmac=206a013ecd676b582e1a7077cca39658a1dcb8154e60793555f73c663ee38a8a',
        image:
            'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg?w=996&t=st=1673729375~exp=1673729975~hmac=3462120eadd3474de6774397eb192bca74992dd7e38553e4c79d32c9d5a0e2e8',
        isEmailVerified: false);
    //انشاء بيانات المستخدم
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel.toMap())
        .then((value) {
      emit(MediaCreteUserSuccessState());
    }).catchError((onError) {
      emit(MediaCreteUserErrorState(onError.toString()));
    });
  }

  IconData suffixR = Icons.visibility_outlined;
  bool isPasswordShow = true;
  void changePasswordVisibility() {
    isPasswordShow = !isPasswordShow;
    suffixR = isPasswordShow
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;

    emit(MediaRegisterChangePasswordVisibilityState());
  }
}
