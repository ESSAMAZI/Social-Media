// ignore_for_file: camel_case_types

abstract class MediaLoginStates {}

class MediaLoginInitialState extends MediaLoginStates {}

class MediaLoadingState extends MediaLoginStates {}

class MediaLoginSuccessState extends MediaLoginStates {}

class MediaChangePasswordVisibilityState extends MediaLoginStates {}

class MediaLoginErrorState extends MediaLoginStates {
  final String error;

  MediaLoginErrorState(this.error);
}
