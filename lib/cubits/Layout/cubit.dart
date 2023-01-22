// ignore_for_file: avoid_print, deprecated_member_use, non_constant_identifier_names

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
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class MediaCubit extends Cubit<MediaStates> {
  MediaCubit() : super(MediaInitialState());
  static MediaCubit get(context) => BlocProvider.of(context);
  MediaUserModel? mediaUserModel;

  //جلب بيانات
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

//image in screen
  File? profileImage;
  var picker = ImagePicker();
  Future<void> getProFileImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(MedaiProfileImagePickedSuccessState());
    } else {
      print('No iamge selected');
      emit(MedaiProfileImagePickedErrorState());
    }
  }
  //end image

  //Caver image
  File? caverImage;

  Future<void> getCaverImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      caverImage = File(pickedFile.path);
      emit(MedaiCaverImagePickedSuccessState());
    } else {
      print('No iamge selected');
      emit(MedaiCaverImagePickedErrorState());
    }
  }
  //end caver image

  //رفع الصوره

  void uploadProfileImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(MedaiUsersUpdateLoadingState());
    //الاتصال
    firebase_storage.FirebaseStorage.instance
        .ref()
        //ان شاء مجلد
        //جلب مسار الصوره كامله
        //تقسيم المسار الصوره ثم يجلب اخر مسار اي اسم الصوره مع الامتداد
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        //ابدء رفع الصوره
        .putFile(profileImage!)
        .then((value) {
      //جلب الرابط الخاص الصوره عند الرفع
      value.ref.getDownloadURL().then((value) {
        //emit(MedaiUploadProfileImageSuccessState());
        //اخذ الرابط
        updateUser(name: name, phone: phone, bio: bio, profile: value);
      }).catchError((onError) {
        emit(MedaiUploadProfileImageErrorState());
      });
    }).catchError((onError) {
      emit(MedaiUploadProfileImageErrorState());
    });
  }

//رفع الصوره

  void uploadCoverImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(MedaiUsersUpdateLoadingState());
    //الاتصال
    firebase_storage.FirebaseStorage.instance
        .ref()
        //ان شاء مجلد
        //جلب مسار الصوره كامله
        //تقسيم المسار الصوره ثم يجلب اخر مسار اي اسم الصوره مع الامتداد
        .child('users/${Uri.file(caverImage!.path).pathSegments.last}')
        //ابدء رفع الصوره
        .putFile(caverImage!)
        .then((value) {
      //جلب الرابط الخاص الصوره عند الرفع
      value.ref.getDownloadURL().then((value) {
        //emit(MedaiUploadProfileImageSuccessState());
        updateUser(name: name, phone: phone, bio: bio, cover: value);
        //اخذ الرابط
      }).catchError((onError) {
        emit(MedaiUploadProfileImageErrorState());
      });
    }).catchError((onError) {
      emit(MedaiUploadProfileImageErrorState());
    });
  }

  // void updateUserImages({
  //   required String name,
  //   required String phone,
  //   required String bio,
  // }) {
  //   emit(MedaiUsersUpdateSuccessState());
  //   if (caverImage != null) {
  //     uploadCoverImage();
  //   } else if (profileImage != null) {
  //     uploadProfileImage();
  //   } else if (profileImage != null && caverImage != null) {
  //   } else {
  //     updateUser(name: name, bio: bio, phone: phone);
  //   }
  // }

  void updateUser({
    required String name,
    required String phone,
    required String bio,
    String? cover,
    String? profile,
  }) {
    emit(MedaiUsersUpdateLoadingState());
    MediaUserModel userModel = MediaUserModel(
      name: name,
      phone: phone,
      bio: bio,
      cover: cover ?? mediaUserModel!.cover,
      image: profile ?? mediaUserModel!.image,
      emali: mediaUserModel!.emali,
      uId: mediaUserModel!.uId,
      isEmailVerified: mediaUserModel!.isEmailVerified,
    );
    //updolad
    FirebaseFirestore.instance
        .collection('users')
        .doc(mediaUserModel!.uId)
        .update(userModel.toMap())
        .then((value) {
      getUserData();
    }).catchError((onError) {
      emit(MedaiUsersUpdateErrorState(onError));
    });
  }
}
