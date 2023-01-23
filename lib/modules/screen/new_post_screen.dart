import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/cubits/Layout/cubit.dart';
import 'package:media/cubits/Layout/state.dart';
import 'package:media/shared/components/components.dart';
import 'package:media/shared/styles/iconBroken.dart';

class NewPostScreen extends StatelessWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userModel = MediaCubit.get(context).mediaUserModel;
    var textController = TextEditingController();
    return BlocConsumer<MediaCubit, MediaStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar:
              defaultAppBar(context: context, title: 'Create Post', actions: [
            DefaulteTextButton(
                onPressed: () {
                  var nowDateTime = DateTime.now();
                  if (MediaCubit.get(context).postImage == null) {
                    MediaCubit.get(context).createPost(
                        dateTime: nowDateTime.toString(),
                        text: textController.text);
                  } else {
                    MediaCubit.get(context).uploadPostImage(
                        dateTime: nowDateTime.toString(),
                        text: textController.text);
                  }
                },
                text: 'Post'),
          ]),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if (state is MedaiCreatePostLoadingState)
                  const LinearProgressIndicator(),
                if (state is MedaiCreatePostLoadingState)
                  const SizedBox(height: 10.0),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage('${userModel!.image}'),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        '${userModel.name}',
                        style: const TextStyle(height: 1.5),
                      ),
                    ),
                    const SizedBox(width: 15),
                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: const InputDecoration(
                        hintText: 'What is on your mind,',
                        border: InputBorder.none),
                  ),
                ),
                const SizedBox(height: 20.0),
                if (MediaCubit.get(context).postImage != null)
                  Stack(
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
                                height: 140.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  image: DecorationImage(
                                    image: FileImage(
                                        MediaCubit.get(context).postImage!),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            IconButton(
                                onPressed: () {
                                  MediaCubit.get(context).removePostImage();
                                },
                                icon: const CircleAvatar(
                                  radius: 20.0,
                                  child: Icon(
                                    IconBroken.Close_Square,
                                    size: 16.0,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      //       //image profile
                      //       //الصوره الشخصيه لتعديل
                    ],
                  ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            MediaCubit.get(context).getpostImage();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(IconBroken.Image),
                              SizedBox(width: 5.0),
                              Text('Add Post'),
                            ],
                          )),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('# tage'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
