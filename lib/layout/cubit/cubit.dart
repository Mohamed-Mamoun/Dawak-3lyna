import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dawak_3lyna/modules/%20%20request/request_screen.dart';
import 'package:dawak_3lyna/modules/Dashboard/Doners%20Requests/Doners.dart';
import 'package:dawak_3lyna/modules/Dashboard/Patients%20Requests/Patients.dart';

import 'package:dawak_3lyna/modules/home/home_screen.dart';
import 'package:dawak_3lyna/modules/profile/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

part 'state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  final auth = FirebaseAuth.instance;

  final storage = FirebaseStorage.instance;
  final picker = ImagePicker();
  File image;
  String imageName = '';
  XFile pickedImage;
  final patient = FirebaseFirestore.instance.collection('patient');
  var downloadUrl;

  Future pickImageFromCamera() async {
    pickedImage = await picker.pickImage(source: ImageSource.camera);

    imageName = basename(pickedImage.path);
    emit(PickImageFromCameraState());
  }

  Future pickImageFromGallery() async {
    pickedImage = await picker.pickImage(source: ImageSource.gallery);
    image = File(pickedImage.path);
    imageName = basename(pickedImage.path);
    emit(PickImageFromGalleryState());
  }

  Future uploudImage() async {
    var ref = storage.ref().child('images/$imageName');
    await ref.putFile(image);
    downloadUrl = ref.getDownloadURL();

    emit(UploadImageState());
  }

  Future saveData(
    TextEditingController name,
    TextEditingController number,
    TextEditingController age,
    TextEditingController medicineName,
    String city,
    var imageUrl
    
  ) async {
    await patient.add({
      'Name':name.text,
      'Phone_Number':number.text,
      'Age':age.text,
      'Medicine_Name':medicineName.text,
      'City':city,
      'Image_url':image.toString()
    });
  }

  List<Widget> screens = [
    HomeScreen(),
    const RequesrScreen(),
    const ProfileScreen()
  ];

  List<String> titles = [
    'Home',
    'Request',
    'Profile',
  ];
  List<Widget> dashboard_screens = [
    const Donors(),
    const Patients(),
  ];

  int currentIndex = 0;

  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }
}
