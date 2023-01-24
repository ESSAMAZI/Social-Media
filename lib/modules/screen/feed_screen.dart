// ignore_for_file: sized_box_for_whitespace

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/cubits/Layout/cubit.dart';
import 'package:media/cubits/Layout/state.dart';
import 'package:media/model/post_model.dart';
import 'package:media/shared/styles/iconBroken.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MediaCubit, MediaStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
            condition: MediaCubit.get(context).posts.isNotEmpty,
            builder: (context) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // Card(
                    //   clipBehavior: Clip.antiAliasWithSaveLayer,
                    //   elevation: 5.0,
                    //   margin: const EdgeInsets.all(8.0),
                    //   child: Stack(
                    //     alignment: AlignmentDirectional.bottomEnd,
                    //     children: [
                    //       const Image(
                    //         image: NetworkImage(
                    //             'https://img.freepik.com/premium-photo/image-content-student-guy-denim-clothes-smiling-while-holding-exercise-books-isolated-yellow-wall_171337-110534.jpg?w=1380'),
                    //         fit: BoxFit.cover,
                    //         height: 200.0,
                    //         width: double.infinity,
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.all(8.0),
                    //         child: Text(
                    //           'communticate with friends',
                    //           style: Theme.of(context)
                    //               .textTheme
                    //               .subtitle1
                    //               ?.copyWith(color: Colors.white),
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    ListView.separated(
                      itemBuilder: (context, index) => buildPost(
                          MediaCubit.get(context).posts[index], context),
                      itemCount: MediaCubit.get(context).posts.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 8.0),
                    ),
                    const SizedBox(height: 8.0)
                  ],
                ),
              );
            },
            fallback: (context) => const Center(
                  child: CircularProgressIndicator(),
                ));
      },
    );
  }

  Widget buildPost(PostModel postModel, context) => //معلومات صاحب المنشور
      Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5.0,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //صاحب المنشور image
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage('${postModel.image}'),
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
                            '${postModel.name}',
                            style: const TextStyle(height: 1.5),
                          ),
                          const SizedBox(width: 7),
                          const Icon(
                            Icons.check_circle,
                            size: 15,
                            color: Colors.blue,
                          )
                        ],
                      ),
                      Text(
                        '${postModel.dataTime}',
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
            Text('${postModel.text}',
                style: Theme.of(context).textTheme.subtitle1),
            //التاجات التابعات النمتشور
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 10, top: 5.0),
            //   child: Container(
            //     width: double.infinity,
            //     child: Wrap(
            //       children: [
            //         Padding(
            //           padding: const EdgeInsetsDirectional.only(end: 7),
            //           child: Container(
            //             height: 25.0,
            //             child: MaterialButton(
            //               onPressed: () {},
            //               //height: 25.0,
            //               minWidth: 1.0,
            //               padding: EdgeInsets.zero,
            //               child: Text(
            //                 "#sofware",
            //                 style: Theme.of(context)
            //                     .textTheme
            //                     .caption!
            //                     .copyWith(color: Colors.blue),
            //               ),
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsetsDirectional.only(end: 7),
            //           child: Container(
            //             height: 25.0,
            //             child: MaterialButton(
            //               onPressed: () {},
            //               //height: 25.0,
            //               minWidth: 1.0,
            //               padding: EdgeInsets.zero,
            //               child: Text(
            //                 "#sofware_Flutter_end",
            //                 style: Theme.of(context)
            //                     .textTheme
            //                     .caption!
            //                     .copyWith(color: Colors.blue),
            //               ),
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsetsDirectional.only(end: 10),
            //           child: Container(
            //             height: 25.0,
            //             child: MaterialButton(
            //               onPressed: () {},
            //               //height: 25.0,
            //               minWidth: 1.0,
            //               padding: EdgeInsets.zero,
            //               child: Text(
            //                 "#Sofware_Dart_end",
            //                 style: Theme.of(context)
            //                     .textTheme
            //                     .caption!
            //                     .copyWith(color: Colors.blue),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            //المنشور صوره
            if (postModel.image != '')
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 15.0),
                child: Container(
                    height: 140.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      image: DecorationImage(
                        image: NetworkImage('${postModel.postImage}'),
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
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
                            Text('0',
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
                            Text('0 comment',
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
                        CircleAvatar(
                          radius: 16.0,
                          backgroundImage: NetworkImage(
                              //صوره المستخدم الذي رح يعلق
                              '${MediaCubit.get(context).mediaUserModel!.image}'),
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
