import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/cubits/Layout/state.dart';
import 'package:media/model/media_user_model.dart';
import 'package:media/shared/components/constants.dart';

class MediaCubit extends Cubit<MediaStates> {
  MediaCubit() : super(MediaInitialState());
  static MediaCubit get(context) => BlocProvider.of(context);
  MediaUserModel? mediaUserModel;
  void getUserData() {
    emit(MediaGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      // value.data();
      //جلب البيانات المستخدم من اجل عمليه التحقق
      mediaUserModel = MediaUserModel.fromJson(value.data()!);
      emit(MediaGetUserSuccessState());
    }).catchError((onError) {
      emit(MediaGetUserErrorState(onError.toString()));
    });
  }
}
