// ignore_for_file: non_constant_identifier_names, void_checks, avoid_types_as_parameter_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:media/shared/styles/iconBroken.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 0.0,
  double height = 40,
  required VoidCallback onPressed,
  required String text,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );

Widget defaultTextFormFiled(
        {required TextEditingController controller,
        required TextInputType type,
        //required Function onSubmit, //Add question mark
        void Function(String)? onSubmit,
        void Function(String)? onChange,
        void Function()? onTap,
        // required Function onChange, //Add question mark
        required Function validate,
        required String labelText,
        bool isPassword = false,
        required IconData prefixIcon,
        IconData? suffixIcon,
        void Function()? suffixPressed}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      //onFieldSubmitted: onSubmit != null ? onSubmit() : null, //do null checking
      // onChanged: onChange != null ? onChange() : null, //do null checking
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      onTap: onTap,

      // validator: (data) {
      //   if (data!.isEmpty) {
      //     return 'Filed is required';
      //   }
      //   return null;
      // },
      validator: (value) {
        return validate(value);
      },
      obscureText: isPassword,
      decoration: InputDecoration(
        //hintText: 'Email Address',
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffixIcon),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

//داله الانتقال من شاشة الى اخرى
//فقط نرسل لها الشاشة
void navigateTo(context, Widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Widget,
    ));

//تنهي الشاشة التي قبلها
void navigateAndFinish(context, Widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => Widget,
    ),
    //الغاء الصفحة السابقة
    (Route<dynamic> roue) => false);

Widget DefaulteTextButton(
        {required VoidCallback onPressed, required String text}) =>
    TextButton(
      onPressed: onPressed,
      child: Text(text),
    );

/// برمجه الاشعارات الرسائل الصغيرة السفليه
void ShowToast({required String text, required ToastStates states}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(states),
        textColor: Colors.white,
        fontSize: 16.0);

// ignore: constant_identifier_names
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates states) {
  Color color;
  switch (states) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

// //
PreferredSizeWidget defaultAppBar({
  required BuildContext context,
  required String title,
  List<Widget>? actions,
}) =>
    AppBar(
      title: Text(title),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(IconBroken.Arrow___Left_2)),
      titleSpacing: 5.0,
      actions: actions,
    );
