// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:media/model/media_user_model.dart';
import 'package:media/shared/styles/iconBroken.dart';

class ChatDetailsScreen extends StatelessWidget {
  const ChatDetailsScreen({Key? key, required this.userModel})
      : super(key: key);

  final MediaUserModel userModel;

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: const BorderRadiusDirectional.only(
                      bottomEnd: Radius.circular(10.0),
                      topEnd: Radius.circular(10.0),
                    )),
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: Text('data ggdfkk'),
              ),
            ),
            //شاشات الطرف الاخر
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: const BorderRadiusDirectional.only(
                      bottomStart: Radius.circular(10.0),
                      topStart: Radius.circular(10.0),
                    )),
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: Text('data kdfvkdf'),
              ),
            ),
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
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'type your message here....'),
                    ),
                  )),
                  Container(
                    height: 50.0,
                    color: Theme.of(context).backgroundColor,
                    child: MaterialButton(
                      onPressed: () {},
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
      ),
    );
  }
}
