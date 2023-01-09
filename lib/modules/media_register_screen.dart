// ignore_for_file: camel_case_types, must_be_immutable, non_constant_identifier_names

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/cubits/Register/cubit.dart';
import 'package:media/cubits/Register/states.dart';
import 'package:media/modules/media_login_screen.dart';
import 'package:media/shared/components/components.dart';

class MediaRegisterScreen extends StatelessWidget {
  MediaRegisterScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var controllerEmail = TextEditingController();
    var controllerPassword = TextEditingController();
    var controllerPhone = TextEditingController();
    var controllerName = TextEditingController();
    return BlocProvider(
      create: (context) => MediaRegisterCubit(),
      child: BlocConsumer<MediaRegisterCubit, MediaRegisterStates>(
        listener: (context, state) {
          if (state is MediaCreteUserSuccessState) {
            // navigateAndFinish(context, const MediaLayout());
            ShowToast(text: 'Success State', states: ToastStates.SUCCESS);
          }
        },
        builder: (context, state) {
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
                          'REGISTER',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'REGISTER now to communicate with friends',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.grey),
                        ),
                        const SizedBox(height: 30),
                        // الاسم
                        defaultTextFormFiled(
                            controller: controllerName,
                            type: TextInputType.name,
                            validate: (String Value) {
                              if (Value.isEmpty) {
                                return 'please enter your name';
                              }
                            },
                            labelText: 'Users Name',
                            prefixIcon: Icons.person),
                        const SizedBox(height: 20),
                        // الهاتف
                        defaultTextFormFiled(
                            controller: controllerPhone,
                            type: TextInputType.phone,
                            validate: (String Value) {
                              if (Value.isEmpty) {
                                return 'please enter your phone number';
                              }
                            },
                            labelText: 'Phone Number',
                            prefixIcon: Icons.phone),
                        const SizedBox(height: 20),
                        //الايميل
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
                          suffixIcon: MediaRegisterCubit.get(context).suffixR,
                          suffixPressed: () {
                            MediaRegisterCubit.get(context)
                                .changePasswordVisibility();
                          },
                          isPassword:
                              MediaRegisterCubit.get(context).isPasswordShow,
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
                              // MediaRegisterCubit.get(context).userRegister(
                              //     email: controllerEmail.text,
                              //     name: controllerName.text,
                              //     phone: controllerPhone.text,
                              //     password: controllerPassword.text);
                            }
                          },
                          prefixIcon: Icons.lock_outline,
                        ),
                        const SizedBox(height: 10),
                        ConditionalBuilder(
                          //حيث تكون حاله الاستيت
                          condition: state is! MediaRegisterLoadinState,
                          //انها لم تجلب البيانات رح تكون دائره الانتظار
                          //tru
                          builder: (context) => defaultButton(
                            radius: 7,
                            //height: 42,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                //print('object');
                                // String psss = controllerPassword.text;
                                MediaRegisterCubit.get(context).userRegister(
                                    email: controllerEmail.text,
                                    name: controllerName.text,
                                    phone: controllerPhone.text,
                                    password: controllerPassword.text);
                              }
                            },
                            text: 'REGISTER',
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
                            const Text('Do  have an account?'),
                            DefaulteTextButton(
                                onPressed: () {
                                  navigateTo(context, const MediaLoginScreen());
                                },
                                text: 'Login')
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
