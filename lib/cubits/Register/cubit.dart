// ignore_for_file: camel_case_types, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/cubits/Register/states.dart';

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
      print(value.user!.email);
      print(value.user!.uid);
      emit(MediaRegisterSuccessState());
    }).catchError((error) {
      emit(MediaRegisterErrorState(error.toString()));
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
