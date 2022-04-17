import 'dart:io';

import 'package:dawak_3lyna/layout/cubit/cubit.dart';
import 'package:dawak_3lyna/modules/Patient/New%20Request/cubit/upload_cubit.dart';
import 'package:dawak_3lyna/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

class NewRequest extends StatelessWidget {
  NewRequest({Key key}) : super(key: key);

  @override

  final medicineName = TextEditingController();

  final name = TextEditingController();

  final phone_number = TextEditingController();

  final age = TextEditingController();

  final formKey = GlobalKey<FormState>();

  List lisItems = ['Khartoum', 'Omdourman', 'Bahri'];

  @override
  Widget build(BuildContext context) {
    final cubit = UploadCubit.get(context);
    return WillPopScope(
      onWillPop: () async {
        await cubit.auth.signOut();
        cubit.imageName = '';
        return true;
      },
      child: cubit.loading
          ? Loaing()
          : Scaffold(
              appBar: AppBar(),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 15, right: 15),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Add New Request',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            defaultFormField(
                                label: 'Full Name',
                                controller: name,
                                type: TextInputType.text,
                                prefix: Icons.person,
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return 'Enter Your Name';
                                  }
                                  if (value.toString().length < 14) {
                                    return 'Enter Your Full Name';
                                  }
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            defaultFormField(
                                label: 'Phone Number',
                                controller: phone_number,
                                type: TextInputType.number,
                                prefix: Icons.phone,
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return 'Enter Your Phone Number';
                                  }
                                  if (value.toString().length < 10) {
                                    return 'Enter a correct Phone Number';
                                  }
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            defaultFormField(
                                label: 'Age',
                                controller: age,
                                type: TextInputType.number,
                                prefix: Icons.date_range,
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return 'Enter Your Age';
                                  }
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            defaultFormField(
                                label: 'Medicine Name',
                                controller: medicineName,
                                type: TextInputType.text,
                                prefix: Icons.medication,
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return 'Enter a medicine Name';
                                  }
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: DropdownButton(
                                  underline: Container(),
                                  items: lisItems.map((itemvalue) {
                                    return DropdownMenuItem(
                                      value: itemvalue,
                                      child: Text(itemvalue),
                                    );
                                  }).toList(),
                                  isExpanded: true,
                                  hint: const Text(
                                    '   Select Your City',
                                  ),
                                  value: cubit.valuechoose,
                                  onChanged: (newValue) {
                                    cubit.changevalue(newValue);
                                  },
                                ),
                              ),
                            ),
                            ListTile(
                              leading: const Text(
                                'Prescription',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              trailing: SizedBox(
                                width: 100,
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () async {
                                        cubit.pickImageFromCamera();
                                       
                                      },
                                      icon: const CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: Icon(Icons.camera_alt),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        cubit.pickImageFromGallery();
                                      
                                      },
                                      icon: const CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: Icon(Icons.image),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                cubit.imageName.split('/').last,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            defaultButton(
                                function: () async {
                                  if (formKey.currentState.validate()) {
                                    if (cubit.valuechoose != null) {
                                      if (cubit.imageName != '') {
                                        try {
                                         cubit.loadingOn();
                                          await cubit.uploudImage();
                                          await cubit
                                              .saveData(
                                                  name,
                                                  phone_number,
                                                  age,
                                                  medicineName,
                                                  cubit.valuechoose,
                                                  cubit.downloadUrl)
                                              .whenComplete(() => {
                                                cubit.loadingOf(),
                                                 showToast(
                                                  text:
                                                      'Your Request uploaded Successfully',
                                                  state: ToastStates.SUCCESS)
                                              });
                                              
                                         
                                        } catch (e) {
                                          print(e);
                                        }
                                      } else {
                                        showToast(
                                            text: 'Please Pick Prescription',
                                            state: ToastStates.ERROR);
                                      }
                                    } else {
                                      showToast(
                                          text: 'Select Your City',
                                          state: ToastStates.ERROR);
                                    }
                                  }
                                },
                                text: 'Submit',
                                radius: 15)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
