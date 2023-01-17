// ignore_for_file: avoid_print, deprecated_member_use

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:media/cubits/Layout/state.dart';
import 'package:media/model/media_user_model.dart';
import 'package:media/modules/screen/chat_screen.dart';
import 'package:media/modules/screen/feed_screen.dart';
import 'package:media/modules/screen/new_post_screen.dart';
import 'package:media/modules/screen/setting_screen.dart';
import 'package:media/modules/screen/users_screen.dart';
import 'package:media/shared/components/constants.dart';
import 'package:media/shared/styles/iconBroken.dart';

class MediaCubit extends Cubit<MediaStates> {
  MediaCubit() : super(MediaInitialState());
  static MediaCubit get(context) => BlocProvider.of(context);
  MediaUserModel? mediaUserModel;
  void getUserData() {
    emit(MediaGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      // value.data();
      //جلب البيانات المستخدم من اجل عمليه التحقق
      mediaUserModel = MediaUserModel.fromJson(value.data()!);
      emit(MediaGetUserSuccessState());
    }).catchError((onError) {
      emit(MediaGetUserErrorState(onError.toString()));
    });
  }

  //title
  List<String> titles = [
    'Home',
    'Chats',
    'Post',
    'Users',
    'Settings',
  ];
  //create Bottom Navigation Bar Item
  int currentIndex = 0;
  List<Widget> screens = const [
    FeedScreen(),
    ChatScreen(),
    NewPostScreen(),
    UsersScreen(),
    SettingScreen(),
  ];
  //عناصر الشاشة
  List<BottomNavigationBarItem> bottomitems = [
    const BottomNavigationBarItem(
      icon: Icon(IconBroken.Home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(IconBroken.Chat),
      label: 'Chat',
    ),
    const BottomNavigationBarItem(
      icon: Icon(IconBroken.Paper_Upload),
      label: 'Post',
    ),
    const BottomNavigationBarItem(
      icon: Icon(IconBroken.Location),
      label: 'Location',
    ),
    const BottomNavigationBarItem(
      icon: Icon(IconBroken.Setting),
      label: 'Setting',
    ),
  ];
  void changeBottomNav(int index) {
    if (index == 2) {
      emit(MedaiNewPostState());
    } else {
      currentIndex = index;
      emit(MedaiChangeBottomNavState());
    }
  }
  // end create Bottom Navigation Bar Item

//image
  File? image;
  var picker = ImagePicker();
  Future<void> getProFileImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {
      print('No iamge selected');
    }
  }
  //end image

}
