// String? token;
// //
// void singOut(context) {
//   //print('token$token');
//   CacheHelper.clearData(key: 'token').then((value) {
//     if (value) {
//       // print()
//       navigateAndFinish(context, ShopLoginScreen());
//     }
//   });
// }

// ignore_for_file: avoid_print
String? uId;
//ترجع النص طويل بدون مايقتص
void printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
