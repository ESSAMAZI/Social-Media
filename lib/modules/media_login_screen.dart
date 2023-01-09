// ignore_for_file: non_constant_identifier_names

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/cubits/login/cubit.dart';
import 'package:media/cubits/login/states.dart';
import 'package:media/layout/media_layout.dart';
import 'package:media/modules/media_register_screen.dart';
import 'package:media/shared/components/components.dart';
import 'package:media/shared/network/local.dart';

class MediaLoginScreen extends StatelessWidget {
  const MediaLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final controllerEmail = TextEditingController();
    final controllerPassword = TextEditingController();

    return BlocProvider(
      create: (context) => MediaLoginCubit(),
      child: BlocConsumer<MediaLoginCubit, MediaLoginStates>(
          listener: (context, state) {
        if (state is MediaLoginErrorState) {
          ShowToast(
            text: state.error.toString(),
            states: ToastStates.ERROR,
          );
        }
        if (state is MediaLoginSuccessState) {
          CacheHelper.saveDatas(
            key: 'uId',
            value: state.uId,
          ).then((value) {
            // token = state.loginmodel.data!.token;
            navigateAndFinish(context, const MediaLayout());
          });
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LOGIN',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Login now to communicate with friends',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.grey),
                      ),
                      const SizedBox(height: 30),

                      defaultTextFormFiled(
                          controller: controllerEmail,
                          type: TextInputType.emailAddress,
                          validate: (String Value) {
                            if (Value.isEmpty) {
                              return 'please enter your email Address';
                            }
                          },
                          labelText: 'EMAIL Address',
                          prefixIcon: Icons.email),
                      const SizedBox(height: 20),
                      //كلمه
                      defaultTextFormFiled(
                        controller: controllerPassword,
                        suffixIcon: MediaLoginCubit.get(context).suffix,
                        suffixPressed: () {
                          MediaLoginCubit.get(context)
                              .changePasswordVisibility();
                        },
                        isPassword: MediaLoginCubit.get(context).isPasswordShow,
                        type: TextInputType.visiblePassword,
                        validate: (String Value) {
                          if (Value.isEmpty) {
                            return 'Password is too short  ';
                          }
                        },
                        labelText: 'Password',
                        onSubmit: (vlue) {
                          if (formKey.currentState!.validate()) {
                            //print('object');
                            // MediaLoginCubit.get(context).userLogin(
                            //     email: controllerEmail.text,
                            //     password: controllerPassword.text);
                          }
                        },
                        prefixIcon: Icons.lock_outline,
                      ),
                      const SizedBox(height: 10),
                      ConditionalBuilder(
                        //حيث تكون حاله الاستيت
                        condition: state is! MediaLoginLoadingState,
                        //انها لم تجلب البيانات رح تكون دائره الانتظار
                        //tru
                        builder: (context) => defaultButton(
                          radius: 7,
                          //height: 42,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              //print('object');
                              // String psss = controllerPassword.text;
                              MediaLoginCubit.get(context).userLogin(
                                  email: controllerEmail.text,
                                  password: controllerPassword.text);
                            }
                          },
                          text: 'login',
                          isUpperCase: true,
                        ),
                        //false
                        fallback: (context) =>
                            //نوضع دائره في حل تنفيذ
                            const Center(child: CircularProgressIndicator()),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an account?'),
                          DefaulteTextButton(
                              onPressed: () {
                                navigateTo(context, MediaRegisterScreen());
                              },
                              text: 'Register')
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
