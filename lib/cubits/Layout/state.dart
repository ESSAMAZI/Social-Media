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
