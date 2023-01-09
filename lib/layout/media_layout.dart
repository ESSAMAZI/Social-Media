import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/cubits/Layout/cubit.dart';
import 'package:media/cubits/Layout/state.dart';
import 'package:media/shared/components/components.dart';

class MediaLayout extends StatelessWidget {
  const MediaLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MediaCubit, MediaStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text('Meida Home'),
            //backgroundColor: Colors.w,
          ),
          body: ConditionalBuilder(
              condition: MediaCubit.get(context).mediaUserModel != null,
              builder: (context) {
                // var modelUser = MediaCubit.get(context).mediaUserModel;

                return Column(
                  children: [
                    //التحقق من ان الايميل تم التحقق منه او لا
                    if (!FirebaseAuth.instance.currentUser!.emailVerified)
                      Container(
                        color: Colors.amber.withOpacity(.6),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              const Icon(Icons.info_outline),
                              const SizedBox(width: 10),
                              const Expanded(
                                child: Text('please verify your email'),
                              ),
                              const SizedBox(width: 20),
                              DefaulteTextButton(
                                  onPressed: () {
                                    //ارسل رابط تحقق البريد
                                    FirebaseAuth.instance.currentUser!
                                        .sendEmailVerification()
                                        .then((value) {
                                      ShowToast(
                                          text: 'check your email',
                                          states: ToastStates.SUCCESS);
                                    }).catchError((onError) {});
                                  },
                                  text: 'Send ')
                            ],
                          ),
                        ),
                      )
                  ],
                );
              },
              fallback: (context) =>
                  const Center(child: CircularProgressIndicator()))),
    );
  }
}
