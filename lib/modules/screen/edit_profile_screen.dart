// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/cubits/Layout/cubit.dart';
import 'package:media/cubits/Layout/state.dart';
import 'package:media/shared/components/components.dart';
import 'package:media/shared/styles/iconBroken.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MediaCubit, MediaStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var nameController = TextEditingController();
        var bioController = TextEditingController();
        var phoneController = TextEditingController();
        var userModel = MediaCubit.get(context).mediaUserModel;

        //state image
        dynamic profileImage = MediaCubit.get(context).profileImage;
        dynamic caverImage = MediaCubit.get(context).caverImage;

        //end image

        //
        nameController.text = userModel!.name!;
        bioController.text = userModel.bio!;
        phoneController.text = userModel.phone!;
        return Scaffold(
          appBar:
              defaultAppBar(context: context, title: 'Edit Profile', actions: [
            DefaulteTextButton(
              onPressed: () {
                MediaCubit.get(context).updateUser(
                    name: nameController.text,
                    bio: bioController.text,
                    phone: phoneController.text);
              },
              text: 'Update',
            ),
            const SizedBox(width: 15.0)
          ]),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if (state is MedaiUsersUpdateSuccessState)
                    const LinearProgressIndicator(),
                  const SizedBox(height: 10.0),

                  ///image profile
                  SizedBox(
                    height: 190.0,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          //موضع الصورعه
                          alignment: AlignmentDirectional.topCenter,
                          child: Stack(
                            //اتجاه ايقونه التعديل الاطار
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(

                                  ///مقدار تمدد الاطار
                                  height: 155.0,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                    image: DecorationImage(
                                      image: caverImage == null
                                          ? NetworkImage('${userModel.cover}')
                                          : FileImage(caverImage)
                                              as ImageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                              IconButton(
                                  onPressed: () {
                                    MediaCubit.get(context).getCaverImage();
                                  },
                                  icon: const CircleAvatar(
                                    radius: 20.0,
                                    child: Icon(
                                      IconBroken.Camera,
                                      size: 16.0,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        //       //image profile
                        //       //الصوره الشخصيه لتعديل
                        Stack(
                          //موقع ايقونه لتعديل
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 64.0,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: profileImage == null
                                    ? NetworkImage('${userModel.image}')
                                    : FileImage(profileImage) as ImageProvider,
                              ),
                            ),
                            //           //ايقونه لتعديل
                            IconButton(
                                onPressed: () {
                                  MediaCubit.get(context).getProFileImage();
                                },
                                icon: const CircleAvatar(
                                  radius: 20.0,
                                  child: Icon(
                                    IconBroken.Camera,
                                    size: 16.0,
                                  ),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  defaultTextFormFiled(
                      controller: nameController,
                      type: TextInputType.name,
                      validate: (String Value) {
                        if (Value.isEmpty) {
                          return 'name must not be empty';
                        }
                        null;
                      },
                      labelText: 'Name',
                      prefixIcon: IconBroken.User),
                  const SizedBox(height: 10.0),
                  defaultTextFormFiled(
                      controller: bioController,
                      type: TextInputType.text,
                      validate: (String Value) {
                        if (Value.isEmpty) {
                          return 'bio must not be empty';
                        }
                        null;
                      },
                      labelText: 'bio',
                      prefixIcon: IconBroken.User),
                  const SizedBox(height: 10.0),
                  defaultTextFormFiled(
                      controller: phoneController,
                      type: TextInputType.phone,
                      validate: (String Value) {
                        if (Value.isEmpty) {
                          return 'phone must not be empty';
                        }
                        null;
                      },
                      labelText: 'phone',
                      prefixIcon: IconBroken.Call),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
