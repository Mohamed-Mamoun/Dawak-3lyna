import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dawak_3lyna/shared/components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
part 'upload_state.dart';

class UploadCubit extends Cubit<UploadState> {
  UploadCubit() : super(UploadInitial());

  static UploadCubit get(context) => BlocProvider.of(context);

  List lisItems = ['Khartoum', 'Omdourman', 'Bahri'];
  final auth = FirebaseAuth.instance;
  bool loading = false;
  String valuechoose;
  final storage = FirebaseStorage.instance;
  final picker = ImagePicker();
  File image;
  String imageName = '';
  XFile pickedImage;
  final medicineName = TextEditingController();

  final name = TextEditingController();

  final phoneNumber = TextEditingController();

  final age = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final patient = FirebaseFirestore.instance.collection('patient');
  var downloadUrl;

  // Function To Pick an image From Camera
  Future pickImageFromCamera() async {
    pickedImage = await picker.pickImage(source: ImageSource.camera);
    image = File(pickedImage.path);
    imageName = basename(pickedImage.path);
    emit(PickImageFromCameraState());
  } // ****************************************************

// Function To Pick an image From Gallery
  Future pickImageFromGallery() async {
    pickedImage = await picker.pickImage(source: ImageSource.gallery);
    image = File(pickedImage.path);
    imageName = basename(pickedImage.path);
    emit(PickImageFromGalleryState());
  } // ****************************************************

  // Function To Upload Image To Storage
  Future uploudImage() async {
    var ref = storage.ref().child('images/$imageName');
    await ref.putFile(image);
    downloadUrl = ref.getDownloadURL();

    emit(UploadImageState());
  } // ****************************************************

  // Function To call Loading State
  void loadingOn() {
    loading = true;
    emit(LoadingOnState());
  } // ****************************************************

  // Function To call Loaded State
  void loadingOf() {
    loading = false;
    emit(LoadingOfState());
  } // ****************************************************

  // Function To change the value of DropDownButton
  void changevalue(dynamic newValue) {
    valuechoose = newValue;
    emit(ChangeValueState());
  } // ****************************************************

  // Function To Save The Patient Data To FireStore
  Future saveData(
      TextEditingController name,
      TextEditingController number,
      TextEditingController age,
      TextEditingController medicineName,
      String city,
      var imageUrl) async {
    await patient.add({
      'Name': name.text,
      'Phone_Number': number.text,
      'Age': age.text,
      'Medicine_Name': medicineName.text,
      'City': city,
      'Image_url': image.toString()
    });
  } // ****************************************************

  // Function To Validate The Patient form and upload
  Future validate_and_upload() async {
    if (formKey.currentState.validate()) {
      return false;
    }

    if (valuechoose = null) {
      return showToast(
        text: 'Select Your City',
        state: ToastStates.ERROR,
      );
    }

    if (imageName == '') {
      return showToast(
        text: 'Please Pick Prescription',
        state: ToastStates.ERROR,
      );
    }
    try {
      emit(LoadingOnState());
      await uploudImage();
      await saveData(
        name,
        phoneNumber,
        age,
        medicineName,
        valuechoose,
        downloadUrl,
      ).whenComplete(
        () => {
          emit(LoadingOfState()),
          showToast(
            text: 'Your Request uploaded Successfully',
            state: ToastStates.SUCCESS,
          ),
          name.clear(),
          phoneNumber.clear(),
          age.clear(),
          medicineName.clear(),
          valuechoose = null,
          imageName = ''
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
