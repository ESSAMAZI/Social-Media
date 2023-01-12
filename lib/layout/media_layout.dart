import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/cubits/Layout/cubit.dart';
import 'package:media/cubits/Layout/state.dart';
import 'package:media/modules/screen/new_post_screen.dart';
import 'package:media/shared/components/components.dart';
import 'package:media/shared/styles/iconBroken.dart';

class MediaLayout extends StatelessWidget {
  const MediaLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MediaCubit, MediaStates>(listener: (context, state) {
      if (state is MedaiNewPostState) {
        navigateTo(context, const NewPostScreen());
      }
    }, builder: (context, state) {
      var cubit = MediaCubit.get(context);
      return Scaffold(
        appBar: AppBar(
          title: Text(cubit.titles[cubit.currentIndex]),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(IconBroken.Notification)),
            IconButton(onPressed: () {}, icon: const Icon(IconBroken.Search)),
          ],
          //backgroundColor: Colors.w,
        ),
        body: cubit.screens[cubit.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            items: cubit.bottomitems),
      );
    });
  }
}

/*
 ConditionalBuilder(
              condition: MediaCubit.get(context).mediaUserModel != null,
              builder: (context) {
                // var modelUser = MediaCubit.get(context).mediaUserModel;

                return Column(
                  children: [
                    //التحقق من ان الايميل تم التحقق منه او لا
                    // if (!FirebaseAuth.instance.currentUser!.emailVerified)
                    // const CheckEmailVerified(),
                  ],
                );
              },
              fallback: (context) =>
                  const Center(child: CircularProgressIndicator()))),
   
*/