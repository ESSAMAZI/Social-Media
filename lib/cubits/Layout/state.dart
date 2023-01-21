abstract class MediaStates {}

class MediaInitialState extends MediaStates {}

class MediaGetUserLoadingState extends MediaStates {}

class MediaGetUserSuccessState extends MediaStates {}

class MediaGetUserErrorState extends MediaStates {
  final String error;

  MediaGetUserErrorState(this.error);
}

class MedaiChangeBottomNavState extends MediaStates {}

//اضافة منشور جديد
class MedaiNewPostState extends MediaStates {}

//اضافة صوره
class MedaiProfileImagePickedSuccessState extends MediaStates {}

class MedaiProfileImagePickedErrorState extends MediaStates {}

class MedaiCaverImagePickedSuccessState extends MediaStates {}

class MedaiCaverImagePickedErrorState extends MediaStates {}
//رفع الصوره الى الموقع

class MedaiUploadProfileImageSuccessState extends MediaStates {}

class MedaiUploadProfileImageErrorState extends MediaStates {}

class MedaiUploadCaverImageSuccessState extends MediaStates {}

class MedaiUploadCaverImageErrorState extends MediaStates {}

class MedaiUsersUpdateSuccessState extends MediaStates {}

class MedaiUsersUpdateErrorState extends MediaStates {
  final String error;

  MedaiUsersUpdateErrorState(this.error);
}
