// ignore_for_file: non_constant_identifier_names

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
        var userModel = MediaCubit.get(context).mediaUserModel;
        var nameController = TextEditingController();
        var bioController = TextEditingController();

        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: 'Edit Profile',
            actions: [
              defaultButton(onPressed: () {}, text: 'Update'),
              const SizedBox(
                width: 15.0,
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // image profile
                Container(
                  height: 190.0,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Container(
                                height: 155.0,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage('${userModel!.cover}'),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: CircleAvatar(
                                  radius: 20.0,
                                  child: Icon(
                                    IconBroken.Camera,
                                    size: 16.0,
                                  ),
                                ))
                          ],
                        ),
                        alignment: AlignmentDirectional.topCenter,
                      ),
                      //image profile
                      //الصوره الشخصيه لتعديل
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
                              backgroundImage:
                                  NetworkImage('${userModel.image}'),
                            ),
                          ),
                          //ايقونه لتعديل
                          IconButton(
                              onPressed: () {},
                              icon: CircleAvatar(
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
                const SizedBox(height: 5.0),
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
              ],
            ),
          ),
        );
      },
    );
  }
}
