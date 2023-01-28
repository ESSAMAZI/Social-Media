import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/cubits/Layout/cubit.dart';
import 'package:media/cubits/Layout/state.dart';
import 'package:media/model/media_user_model.dart';
import 'package:media/modules/screen/chat_details_Screen.dart';
import 'package:media/shared/components/components.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MediaCubit, MediaStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: MediaCubit.get(context).users.isNotEmpty,
          builder: (context) {
            return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return buildChatItem(
                      MediaCubit.get(context).users[index], context);
                },
                separatorBuilder: (context, index) {
                  return myDivider();
                },
                itemCount: MediaCubit.get(context).users.length);
          },
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

Widget buildChatItem(MediaUserModel mediaUserModel, context) => InkWell(
      onTap: () {
        navigateTo(context, ChatDetailsScreen(userModel: mediaUserModel));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage('${mediaUserModel.image}'),
            ),

            const SizedBox(width: 15),

            //usre name post

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${mediaUserModel.name}',
                        style: const TextStyle(height: 1.5),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
