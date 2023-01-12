// ignore_for_file: sort_child_properties_last, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:media/shared/components/components.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://img.freepik.com/premium-photo/image-content-student-guy-denim-clothes-smiling-while-holding-exercise-books-isolated-yellow-wall_171337-110534.jpg?w=1380'),
                          fit: BoxFit.cover,
                        ),
                      )),
                  alignment: AlignmentDirectional.topCenter,
                ),
                CircleAvatar(
                  radius: 64.0,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'https://img.freepik.com/free-photo/young-surprised-man-yellow-sweater-white-shirt-black-bow-tie-pointing-right-with-his-finger-shouting-wow_295783-1510.jpg?w=1380&t=st=1673387784~exp=1673388384~hmac=59eeac78e640bfce629cd63141a41685f9c7c6e713c1bf42b1fd2864b28523ef',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5.0),
          //Your name and information about you
          Text('ESSAM EZI', style: Theme.of(context).textTheme.bodyText1),
          Text('Bio ......', style: Theme.of(context).textTheme.caption),
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
                        Text('100',
                            style: Theme.of(context).textTheme.subtitle2),
                        Text('post',
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
                  child: defaultButton(onPressed: () {}, text: 'Edit Profile'))
            ],
          )
        ],
      ),
    );
  }
}
