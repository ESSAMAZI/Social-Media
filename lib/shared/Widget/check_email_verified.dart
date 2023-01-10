import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:media/shared/components/components.dart';

class CheckEmailVerified extends StatelessWidget {
  const CheckEmailVerified({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber.withOpacity(.6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            const Icon(Icons.info_outline),
            const SizedBox(width: 10),
            const Expanded(
              child: Text('please verify your email'),
            ),
            const SizedBox(width: 20),
            DefaulteTextButton(
                onPressed: () {
                  //ارسل رابط تحقق البريد
                  FirebaseAuth.instance.currentUser!
                      .sendEmailVerification()
                      .then((value) {
                    ShowToast(
                        text: 'check your email', states: ToastStates.SUCCESS);
                  }).catchError((onError) {});
                },
                text: 'Send ')
          ],
        ),
      ),
    );
  }
}
