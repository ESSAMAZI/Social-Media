abstract class MediaStates {}

class MediaInitialState extends MediaStates {}

class MediaGetUserLoadingState extends MediaStates {}

class MediaGetUserSuccessState extends MediaStates {}

class MediaGetUserErrorState extends MediaStates {
  final String error;

  MediaGetUserErrorState(this.error);
}
