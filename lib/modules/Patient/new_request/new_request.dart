import 'package:dawak_3lyna/localizations/applocal.dart';
import 'package:dawak_3lyna/modules/Patient/new_request/cubit/upload_cubit.dart';
import 'package:dawak_3lyna/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class NewRequest extends StatelessWidget {
  NewRequest({Key key}) : super(key: key);

  final medicineName = TextEditingController();

  final name = TextEditingController();

  final phoneNumber = TextEditingController();

  final age = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cubit = UploadCubit.get(context);
    return WillPopScope(
      onWillPop: () async {
        await cubit.auth.signOut();
        cubit.imageName = '';
        return true;
      },
      child: BlocConsumer<UploadCubit, UploadState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = UploadCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${getLang(context, 'addReq')}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                            label: '${getLang(context, 'fullName')}',
                            controller: name,
                            type: TextInputType.text,
                            prefix: Icons.person,
                            validate: (value) {
                              if (value.isEmpty) {
                                return '${getLang(context, 'meg1')}';
                              }
                              if (value.toString().length < 14) {
                                return '${getLang(context, 'meg11')}';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                            label: '${getLang(context, 'phone')}',
                            controller: phoneNumber,
                            type: TextInputType.number,
                            prefix: Icons.phone,
                            validate: (value) {
                              if (value.isEmpty) {
                                return '${getLang(context, 'meg3')}';
                              }
                              if (value.toString().length < 10) {
                                return '${getLang(context, 'meg33')}';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                            label: '${getLang(context, 'age')}',
                            controller: age,
                            type: TextInputType.number,
                            prefix: Icons.date_range,
                            validate: (value) {
                              if (value.isEmpty) {
                                return '${getLang(context, 'ageMeg')}';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                            label: '${getLang(context, 'mn')}',
                            controller: medicineName,
                            type: TextInputType.text,
                            prefix: Icons.medication,
                            validate: (value) {
                              if (value.isEmpty) {
                                return '${getLang(context, 'mnMeg')}';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 15,
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
                                items: cubit.lisItems.map((itemvalue) {
                                  return DropdownMenuItem(
                                    value: itemvalue,
                                    child: Text(itemvalue),
                                  );
                                }).toList(),
                                isExpanded: true,
                                hint: Text(
                                  '${getLang(context, 'city')}',
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
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
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
                                            phoneNumber,
                                            age,
                                            medicineName,
                                            cubit.valuechoose,
                                            cubit.downloadUrl,
                                          )
                                          .whenComplete(
                                            () => {
                                              cubit.loadingOf(),
                                              showToast(
                                                text:
                                                    'Your Request uploaded Successfully',
                                                state: ToastStates.SUCCESS,
                                              ),
                                            },
                                          );
                                    } catch (e) {
                                      print(e);
                                    }
                                  } else {
                                    showToast(
                                      text: 'Please Pick Prescription',
                                      state: ToastStates.ERROR,
                                    );
                                  }
                                } else {
                                  showToast(
                                    text: 'Select Your City',
                                    state: ToastStates.ERROR,
                                  );
                                }
                              }
                            },
                            text: '${getLang(context, 'submit')}',
                            radius: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
