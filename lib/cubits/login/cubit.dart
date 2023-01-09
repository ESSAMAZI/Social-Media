// ignore_for_file: camel_case_types, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/cubits/login/states.dart';

class MediaLoginCubit extends Cubit<MediaLoginStates> {
  MediaLoginCubit() : super(MediaLoginInitialState());

  static MediaLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({required String email, required String password}) {
    emit(MediaLoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      emit(MediaLoginSuccessState(value.user!.uid));
    }).catchError((onError) {
      emit(MediaLoginErrorState(onError.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPasswordShow = true;

  void changePasswordVisibility() {
    isPasswordShow = !isPasswordShow;
    suffix = isPasswordShow
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;

    emit(MediaChangePasswordVisibilityState());
  }
}
