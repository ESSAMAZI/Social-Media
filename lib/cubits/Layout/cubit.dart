import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/cubits/Layout/state.dart';
import 'package:media/model/media_user_model.dart';
import 'package:media/modules/screen/chat_screen.dart';
import 'package:media/modules/screen/feed_screen.dart';
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
    'Users',
    'Settings',
  ];
  //create Bottom Navigation Bar Item
  int currentIndex = 0;
  List<Widget> screens = const [
    FeedScreen(),
    ChatScreen(),
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
      icon: Icon(IconBroken.Location),
      label: 'Location',
    ),
    const BottomNavigationBarItem(
      icon: Icon(IconBroken.Setting),
      label: 'Setting',
    ),
  ];
  void changeBottomNav(int index) {
    currentIndex = index;
    emit(MedaiChangeBottomNavState());
  }
  // end create Bottom Navigation Bar Item
}
