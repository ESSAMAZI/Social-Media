// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/cubits/Layout/cubit.dart';
import 'package:media/layout/media_layout.dart';
import 'package:media/modules/media_login_screen.dart';
import 'package:media/shared/Bloc_obServer.dart';
import 'package:media/shared/components/components.dart';
import 'package:media/shared/components/constants.dart';
import 'package:media/shared/network/local.dart';
import 'package:media/shared/styles/themes.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  //التعامل مع الاشعارات
  print('onMessageOpenedApp');
  print(message.data.toString());
  ShowToast(text: 'onMessageOpenedApp', states: ToastStates.SUCCESS);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
//////// start check open Layout /////
/////خاص التعامل مع الاشعارات
  var token = await FirebaseMessaging.instance.getToken();
  print('rtootgm $token');
  //االتعامل مع الاشعار وانت فاتح التطبيق
  FirebaseMessaging.onMessage.listen((event) {
    print('onMessage');
    print(event.data.toString());
    ShowToast(text: 'on Message', states: ToastStates.SUCCESS);
  });
  // في حاله الضغط على الاشعار رح ينقلنا الى اي مكان نريده
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print('onMessageOpenedApp');
    print(event.data.toString());
    ShowToast(text: 'onMessageOpenedApp', states: ToastStates.SUCCESS);
  });
  // Backend الاشعارات
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  ///end الاشعارات

  await CacheHelper.init();
  uId = CacheHelper.getData(key: 'uId');

  ///نرن على تصميم
  Widget widget;
  if (uId != null) {
    widget = const MediaLayout();
  } else {
    widget = const MediaLoginScreen();
  }

////////end check open Layout /////

  runApp(MyApp(
    StartWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, this.StartWidget}) : super(key: key);
  final Widget? StartWidget;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          //جلب البيانات  التحقق من ان الايميل محقق وصحيح
          create: (context) => MediaCubit()
            ..getPosts()
            ..getUserData(),
        ),
      ],
      child: MaterialApp(
        title: 'Media show',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: StartWidget,
      ),
    );
  }
}


/// code SHA1 (./gradlew app:signingReport)