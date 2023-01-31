// ignore_for_file: file_names

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/cubits/Layout/cubit.dart';
import 'package:media/cubits/Layout/state.dart';
import 'package:media/model/media_user_model.dart';
import 'package:media/model/message_model.dart';
import 'package:media/shared/styles/iconBroken.dart';

class ChatDetailsScreen extends StatelessWidget {
  const ChatDetailsScreen({Key? key, required this.userModel})
      : super(key: key);

  final MediaUserModel userModel;

  @override
  Widget build(BuildContext context) {
    var textController = TextEditingController();
    return Builder(
      builder: (context) {
        MediaCubit.get(context).getMessages(receiverId: userModel.uId!);
        return BlocConsumer<MediaCubit, MediaStates>(
          listener: (context, state) {
            if (state is MediaSendMessageLoadingState) textController.text = '';
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                titleSpacing: 0.0,
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(userModel.image!),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Text(userModel.name!)
                  ],
                ),
              ),
              body: ConditionalBuilder(
                  condition: MediaCubit.get(context).messages.isNotEmpty,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  var message =
                                      MediaCubit.get(context).messages[index];
                                  return MediaCubit.get(context)
                                              .mediaUserModel!
                                              .uId ==
                                          message.senderId
                                      ? buildMyMessage(message)
                                      : buildMessage(message);
                                },
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 13.0),
                                itemCount:
                                    MediaCubit.get(context).messages.length),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey[300]!,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  child: TextFormField(
                                    controller: textController,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'type your message here....'),
                                  ),
                                )),
                                Container(
                                  height: 50.0,
                                  color: Theme.of(context).backgroundColor,
                                  child: MaterialButton(
                                    onPressed: () {
                                      MediaCubit.get(context).sendMessage(
                                          receiverId: userModel.uId!,
                                          dataTime: DateTime.now().toString(),
                                          text: textController.text);
                                    },
                                    minWidth: 1.0,
                                    child: const Icon(
                                      IconBroken.Send,
                                      size: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  fallback: (context) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 260),
                                child: const Center(child: Text('No Message'))),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey[300]!,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
                                    child: TextFormField(
                                      controller: textController,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText:
                                              'type your message here....'),
                                    ),
                                  )),
                                  Container(
                                    height: 50.0,
                                    color: Theme.of(context).backgroundColor,
                                    child: MaterialButton(
                                      onPressed: () {
                                        MediaCubit.get(context).sendMessage(
                                            receiverId: userModel.uId!,
                                            dataTime: DateTime.now().toString(),
                                            text: textController.text);
                                      },
                                      minWidth: 1.0,
                                      child: const Icon(
                                        IconBroken.Send,
                                        size: 16.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
            );
          },
        );
      },
    );
  }

  Widget buildMessage(MessageModle messageModle) => Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(10.0),
                topEnd: Radius.circular(10.0),
              )),
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Text('${messageModle.text}'),
        ),
      );

  Widget buildMyMessage(MessageModle messageModle) => //شاشات الطرف الاخر
      Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: const BorderRadiusDirectional.only(
                bottomStart: Radius.circular(10.0),
                topStart: Radius.circular(10.0),
              )),
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Text('${messageModle.text}'),
        ),
      );
}
