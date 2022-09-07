import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dawak_3lyna/models/doner_model.dart';
import 'package:dawak_3lyna/models/patient_model.dart';
import 'package:dawak_3lyna/modules/patient/new_request_screen.dart';
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
  ValueNotifier<bool> loading = ValueNotifier(false);
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
  final nameController = TextEditingController();
  final dateController = TextEditingController();
  final quantityController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final patientCollection = FirebaseFirestore.instance.collection('patient');
  final donersCollection = FirebaseFirestore.instance.collection('Doners');
  String downloadUrl;

  Future<bool> checkInternetConnnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  // Function To Pick an image
  Future pickImages(ImageSource source) async {
    pickedImage = await picker.pickImage(source: source);
    image = File(pickedImage.path);
    imageName = basename(pickedImage.path);
    emit(PickImageFromCameraState());
  } // ****************************************************

  // Function To Upload Image To Storage
  Future uploudImage() async {
    var ref = storage.ref().child('images/$imageName');
    await ref.putFile(image);
    await ref.getDownloadURL().then((value) => downloadUrl = value);
    emit(UploadImageState());
  } // ****************************************************

  // Function To call Loading State
  void loadingOn() {
    loading.value = true;
    emit(LoadingOnState());
  } // ****************************************************

  // Function To call Loaded State
  void loadingOf() {
    loading.value = false;
    emit(LoadingOfState());
  } // ****************************************************

  // Function To change the value of DropDownButton
  void changevalue(dynamic newValue) {
    valuechoose = newValue;
    emit(ChangeValueState());
  } // ****************************************************

  // Function To Save Patient Data To Database
  Future savePatientData(PatientModel patientModel) async {
    await patientCollection.add(patientModel.toJson());
  } // ****************************************************

  // Function To Save Doner Data To Database
  Future saveDonerData(DonerModel donerModel) async {
    await donersCollection.add(donerModel.toJson());
  } // ****************************************************

  // Function To Validate The Patient form and upload
  Future validateAndUpload() async {
    if (!formKey.currentState.validate()) {
      return false;
    }

    if (valuechoose == null) {
      showToast(
        text: 'Select Your City',
        state: ToastStates.ERROR,
      );
      return false;
    }

    if (imageName == '') {
      showToast(
        text: 'Please Pick Prescription',
        state: ToastStates.ERROR,
      );
      return false;
    } else {
      try {
        loadingOn();
        await uploudImage();
        await savePatientData(PatientModel(
                name: name.text,
                phoneNumber: phoneNumber.text,
                age: int.parse(age.text),
                medicineName: medicineName.text,
                city: valuechoose.toString(),
                imageUrl: downloadUrl))
            .whenComplete(
          () {
            loadingOf();
            showToast(
              text: 'Your Request uploaded Successfully',
              state: ToastStates.SUCCESS,
            );
            name.clear();
            phoneNumber.clear();
            age.clear();
            medicineName.clear();
            valuechoose = null;
            imageName = '';
          },
        );
      } catch (e) {
        loadingOf();
        print(e.toString());
        showToast(
            text: 'Check your Internet Connection', state: ToastStates.ERROR);
      }
    }
  }

  // Function To Sign in without account
  Future signInAnounumasly(BuildContext context) async {
    loadingOn();
    checkInternetConnnection().then((value) => {
          if (value == true)
            {
              FirebaseAuth.instance.signInAnonymously().then(
                (v) {
                  loadingOf();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewRequest()));
                },
              )
            }
          else
            {
              loadingOf(),
              showToast(
                  text: 'Check your Internet Connection',
                  state: ToastStates.ERROR)
            }
        });
  }

  // Function To Validate The Doner form and upload
  donorRequestForm() async {
    if (!formKey.currentState.validate()) {
      return false;
    }
    if (imageName == '') {
      showToast(
        text: 'Please Pick Prescription',
        state: ToastStates.ERROR,
      );
      return false;
    } else {
      try {
        loadingOn();
        await uploudImage();
        await saveDonerData(DonerModel(
                medicineName: nameController.text,
                date: dateController.text,
                qantity: int.parse(quantityController.text),
                imageUrl: downloadUrl))
            .whenComplete(
          () {
            loadingOf();
            showToast(
              text: 'Your Request uploaded Successfully',
              state: ToastStates.SUCCESS,
            );
            nameController.clear();
            dateController.clear();
            quantityController.clear();
            imageName = '';
          },
        );
      } catch (e) {
        loadingOf();
        print(e.toString());
        showToast(
            text: 'Check your Internet Connection', state: ToastStates.ERROR);
      }
    }
  }
}
