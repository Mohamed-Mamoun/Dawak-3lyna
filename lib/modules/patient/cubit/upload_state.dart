part of 'upload_cubit.dart';

@immutable
abstract class UploadState {}

class UploadInitial extends UploadState {}

class PickImageFromCameraState extends UploadState{}

class PickImageFromGalleryState extends UploadState{}

class UploadImageState extends UploadState{}

class LoadingOnState extends UploadState{}

class LoadingOfState extends UploadState{}

class ChangeValueState extends UploadState{}