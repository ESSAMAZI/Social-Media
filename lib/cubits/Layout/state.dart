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

//update data
class MedaiUsersUpdateLoadingState extends MediaStates {}

class MedaiUsersUpdateSuccessState extends MediaStates {}

class MedaiUsersUpdateErrorState extends MediaStates {
  final String error;

  MedaiUsersUpdateErrorState(this.error);
}

///create post
class MedaiCreatePostLoadingState extends MediaStates {}

class MedaiCreatePostSuccessState extends MediaStates {}

class MedaiCreatePostErrorState extends MediaStates {
  final String error;

  MedaiCreatePostErrorState(this.error);
}

///end create post
// post get image

class MedaiPostImagePickedSuccessState extends MediaStates {}

class MedaiPostImagePickedErrorState extends MediaStates {}

class MedaiRemovePostImageState extends MediaStates {}
// endpost get image

//get All Post
class MediaGetPostLoadingState extends MediaStates {}

class MediaGetPostSuccessState extends MediaStates {}

class MediaGetPostErrorState extends MediaStates {
  final String error;

  MediaGetPostErrorState(this.error);
}
//end get All Post

//Posts Like
class MediaLikePostSuccessState extends MediaStates {}

class MediaLikePostErrorState extends MediaStates {
  final String error;

  MediaLikePostErrorState(this.error);
}
//end Posts Like

//get All users

class MediaGetAllUsersLoadingState extends MediaStates {}

class MediaGetAllUsersSuccessState extends MediaStates {}

class MediaGetAllUsersErrorState extends MediaStates {
  final String error;

  MediaGetAllUsersErrorState(this.error);
}
//end get All users
