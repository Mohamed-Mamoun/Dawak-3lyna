import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
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
  final patient = FirebaseFirestore.instance.collection('patient');
  var downloadUrl;

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
    downloadUrl = ref.getDownloadURL();

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
        await saveData(
          name,
          phoneNumber,
          age,
          medicineName,
          valuechoose,
          downloadUrl,
        ).whenComplete(
          () => {
            loadingOf(),
            showToast(
              text: 'Your Request uploaded Successfully',
              state: ToastStates.SUCCESS,
            ),
            name.clear(),
            phoneNumber.clear(),
            age.clear(),
            medicineName.clear(),
            valuechoose = null,
            imageName = '',
          },
        );
      } catch (e) {
        showToast(
            text: 'Check your Internet Connection', state: ToastStates.ERROR);
      }
    }
  }

  // Function To Sign in without account
  Future signIn_Anounumasly(BuildContext context) async {
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

  donorRequestForm() {}
}
