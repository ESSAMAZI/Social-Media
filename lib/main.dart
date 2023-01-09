// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/cubits/Layout/cubit.dart';
import 'package:media/layout/media_layout.dart';
import 'package:media/modules/media_login_screen.dart';
import 'package:media/shared/Bloc_obServer.dart';
import 'package:media/shared/components/constants.dart';
import 'package:media/shared/network/local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
//////// start check open Layout /////

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
          create: (context) => MediaCubit()..getUserData(),
        ),
      ],
      child: MaterialApp(
        title: 'Media show',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //
        home: StartWidget,
      ),
    );
  }
}


/// code SHA1 (./gradlew app:signingReport)