import 'dart:io';

import 'package:dawak_3lyna/layout/cubit/cubit.dart';
import 'package:dawak_3lyna/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

class NewRequest extends StatefulWidget {
  NewRequest({Key key}) : super(key: key);

  @override
  State<NewRequest> createState() => _NewRequestState();
}

class _NewRequestState extends State<NewRequest> {
  final medicineName = TextEditingController();

  final name = TextEditingController();

  final phone_number = TextEditingController();

  final age = TextEditingController();

  final formKey = GlobalKey<FormState>();

  List lisItems = ['Khartoum', 'Omdourman', 'Bahri'];

  String valuechoose;

  @override
  Widget build(BuildContext context) {
    final cubit =  HomeCubit.get(context);
    return WillPopScope(
      onWillPop: ()async{
        cubit.imageName = '';
        return true;
      },                     
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Add New Request',
                        style:
                            TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
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
                            if(value.toString().length < 14){
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
                             if(value.toString().length < 10){
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
                        padding: const EdgeInsets.symmetric(horizontal: 5),
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
                          value: valuechoose,
                          onChanged: (newValue) {
                            setState(
                              () {
                                valuechoose = newValue;
                              },
                            );
                          },
                        ),
                      ),
                    ),
                      ListTile(
                        leading: const Text(
                          'Prescription',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () async{
                                cubit.pickImageFromCamera();
                                setState(() {
                                  cubit.imageName = cubit.image.path; 
                                });
                                 
                                },
                                icon: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.camera_alt),
                                ),
                              ),
                               IconButton(
                                onPressed: () async{
                                  cubit.pickImageFromGallery();
                                   setState(() {
                                  cubit.imageName = cubit.image.path; 
                                });
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
                        child: Text(cubit.imageName.split('/').last,
                        style: const TextStyle(fontSize: 12),
                        ),
                      ),
                     
                      const SizedBox(
                        height: 15,
                      ),
                      defaultButton(
                          function: () async{
                            if (formKey.currentState.validate()) {
                              if(valuechoose != null){
                              if(cubit.imageName != ''){
                                    await cubit.uploudImage();
                                    cubit.saveData();
                              }else{
                                showToast(text: 'Please Pick Prescription', state: ToastStates.ERROR);
                              }
                              }else{
                                showToast(text: 'Select Your City', state: ToastStates.ERROR);
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
