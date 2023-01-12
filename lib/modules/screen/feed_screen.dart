// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:media/shared/styles/iconBroken.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5.0,
            margin: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                const Image(
                  image: NetworkImage(
                      'https://img.freepik.com/premium-photo/image-content-student-guy-denim-clothes-smiling-while-holding-exercise-books-isolated-yellow-wall_171337-110534.jpg?w=1380'),
                  fit: BoxFit.cover,
                  height: 200.0,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'communticate with friends',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          ListView.separated(
            itemBuilder: (context, index) => buildPost(context),
            itemCount: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(height: 8.0),
          ),
          const SizedBox(height: 8.0)
        ],
      ),
    );
  }

  Widget buildPost(context) => //معلومات صاحب المنشور
      Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5.0,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            //صاحب المنشور
            Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/free-photo/young-surprised-man-yellow-sweater-white-shirt-black-bow-tie-pointing-right-with-his-finger-shouting-wow_295783-1510.jpg?w=1380&t=st=1673387784~exp=1673388384~hmac=59eeac78e640bfce629cd63141a41685f9c7c6e713c1bf42b1fd2864b28523ef'),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Essam EZI',
                            style: TextStyle(height: 1.5),
                          ),
                          SizedBox(width: 7),
                          Icon(
                            Icons.check_circle,
                            size: 15,
                            color: Colors.blue,
                          )
                        ],
                      ),
                      Text(
                        'Januery 21,2023 at 11:00 pm',
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(height: 1.5),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz,
                      size: 16.0,
                    )),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
            ),
            //المنشور
            Text(
                'We have already seen that Dart has a type called ‘bool’. The boolean literals ‘true’ and ‘false’ have type ‘bool’. They are compiled time constants',
                style: Theme.of(context).textTheme.subtitle1),
            //التاجات التابعات النمتشور
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 5.0),
              child: Container(
                width: double.infinity,
                child: Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 7),
                      child: Container(
                        height: 25.0,
                        child: MaterialButton(
                          onPressed: () {},
                          //height: 25.0,
                          minWidth: 1.0,
                          padding: EdgeInsets.zero,
                          child: Text(
                            "#sofware",
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 7),
                      child: Container(
                        height: 25.0,
                        child: MaterialButton(
                          onPressed: () {},
                          //height: 25.0,
                          minWidth: 1.0,
                          padding: EdgeInsets.zero,
                          child: Text(
                            "#sofware_Flutter_end",
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 10),
                      child: Container(
                        height: 25.0,
                        child: MaterialButton(
                          onPressed: () {},
                          //height: 25.0,
                          minWidth: 1.0,
                          padding: EdgeInsets.zero,
                          child: Text(
                            "#Sofware_Dart_end",
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //المنشور صوره
            Container(
                height: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://img.freepik.com/premium-photo/image-content-student-guy-denim-clothes-smiling-while-holding-exercise-books-isolated-yellow-wall_171337-110534.jpg?w=1380'),
                    fit: BoxFit.cover,
                  ),
                )),
            //عداد التعليقات والاعجابات
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          children: [
                            const Icon(IconBroken.Heart,
                                size: 17.0, color: Colors.red),
                            const SizedBox(width: 5.0),
                            Text('120',
                                style: Theme.of(context).textTheme.caption),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(IconBroken.Chart,
                                size: 17.0, color: Colors.amber),
                            const SizedBox(width: 5.0),
                            Text('120 comment',
                                style: Theme.of(context).textTheme.caption),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //الخط الفاصل
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
            ),
            Row(
              children: [
                //ايقونه لتعليق
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 16.0,
                          backgroundImage: NetworkImage(
                              'https://img.freepik.com/free-photo/young-surprised-man-yellow-sweater-white-shirt-black-bow-tie-pointing-right-with-his-finger-shouting-wow_295783-1510.jpg?w=1380&t=st=1673387784~exp=1673388384~hmac=59eeac78e640bfce629cd63141a41685f9c7c6e713c1bf42b1fd2864b28523ef'),
                        ),
                        const SizedBox(width: 15),
                        Text('write a comment ...',
                            style:
                                Theme.of(context).textTheme.caption!.copyWith())
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      const Icon(IconBroken.Heart,
                          size: 17.0, color: Colors.red),
                      const SizedBox(width: 5.0),
                      Text('Like', style: Theme.of(context).textTheme.caption),
                    ],
                  ),
                ),
              ],
            )
          ]),
        ),
      );
}
