part of 'cubit.dart';

@immutable
abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class ChangeBottomNavState extends HomeStates{}

class PickImageFromCameraState extends HomeStates{}

class PickImageFromGalleryState extends HomeStates{}

class UploadImageState extends HomeStates{}
