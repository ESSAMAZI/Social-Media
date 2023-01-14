// ignore_for_file: sort_child_properties_last, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/cubits/Layout/cubit.dart';
import 'package:media/cubits/Layout/state.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MediaCubit, MediaStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = MediaCubit.get(context).mediaUserModel;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //image profile and the frame
              Container(
                height: 190.0,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      child: Container(
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
                      alignment: AlignmentDirectional.topCenter,
                    ),
                    //image profile
                    CircleAvatar(
                      radius: 64.0,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage('${userModel.image}'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5.0),
              //Your name and information about you
              Text('${userModel.name}',
                  style: Theme.of(context).textTheme.bodyText1),
              Text('${userModel.bio}',
                  style: Theme.of(context).textTheme.caption),
              //Post icons and likes
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text('100',
                                style: Theme.of(context).textTheme.subtitle2),
                            Text('post',
                                style: Theme.of(context).textTheme.caption),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text('245',
                                style: Theme.of(context).textTheme.subtitle2),
                            Text('Photos',
                                style: Theme.of(context).textTheme.caption),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text('10K',
                                style: Theme.of(context).textTheme.subtitle2),
                            Text('Followers',
                                style: Theme.of(context).textTheme.caption),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text('67',
                                style: Theme.of(context).textTheme.subtitle2),
                            Text('Followings',
                                style: Theme.of(context).textTheme.caption),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                        onPressed: () {}, child: const Text('Add Photos')),
                  ),
                  const SizedBox(width: 10.0),
                  OutlinedButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.edit,
                        size: 14.0,
                      ))
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
