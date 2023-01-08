// ignore_for_file: camel_case_types

abstract class MediaRegisterStates {}

class MediaRegisterInitialState extends MediaRegisterStates {}

class MediaRegisterLoadinState extends MediaRegisterStates {}

class MediaRegisterSuccessState extends MediaRegisterStates {}

class MediaRegisterErrorState extends MediaRegisterStates {
  final String error;

  MediaRegisterErrorState(this.error);
}

class MediaRegisterChangePasswordVisibilityState extends MediaRegisterStates {}

class MediaCreteUserSuccessState extends MediaRegisterStates {}

class MediaCreteUserErrorState extends MediaRegisterStates {
  final String errorUser;

  MediaCreteUserErrorState(this.errorUser);
}
