import 'package:dawak_3lyna/localizations/applocal.dart';
import 'package:dawak_3lyna/modules/patient/cubit/upload_cubit.dart';
import 'package:dawak_3lyna/shared/components/Size_Config.dart';
import 'package:dawak_3lyna/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class NewRequest extends StatelessWidget {
  const NewRequest({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => UploadCubit(),
      child: BlocConsumer<UploadCubit, UploadState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = UploadCubit.get(context);
          SizeConfig().init(context);
          return WillPopScope(
            onWillPop: () async {
              await cubit.auth.signOut();
              cubit.imageName = '';
              return true;
            },
            child: cubit.loading
                ? const Loading()
                : Scaffold(
                    appBar: AppBar(),
                    body: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(getProportionateScreenWidth(18)),
                              child: Form(
                                key: cubit.formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${getLang(context, 'addReq')}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                    SizedBox(
                                      height: getProportionateScreenHeight(17),
                                    ),
                                    defaultFormField(
                                      label: '${getLang(context, 'fullName')}',
                                      controller: cubit.name,
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
                                    SizedBox(
                                      height: getProportionateScreenHeight(17),
                                    ),
                                    defaultFormField(
                                      label: '${getLang(context, 'phone')}',
                                      controller: cubit.phoneNumber,
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
                                    SizedBox(
                                      height: getProportionateScreenHeight(17),
                                    ),
                                    defaultFormField(
                                      label: '${getLang(context, 'age')}',
                                      controller: cubit.age,
                                      type: TextInputType.number,
                                      prefix: Icons.date_range,
                                      validate: (value) {
                                        if (value.isEmpty) {
                                          return '${getLang(context, 'ageMeg')}';
                                        }
                                      },
                                    ),
                                   SizedBox(
                                      height: getProportionateScreenHeight(17),
                                    ),
                                    defaultFormField(
                                      label: '${getLang(context, 'mn')}',
                                      controller: cubit.medicineName,
                                      type: TextInputType.text,
                                      prefix: Icons.medication,
                                      validate: (value) {
                                        if (value.isEmpty) {
                                          return '${getLang(context, 'mnMeg')}';
                                        }
                                      },
                                    ),
                                   SizedBox(
                                      height: getProportionateScreenHeight(17),
                                    ),
                                    Container(
                                      height: getProportionateScreenHeight(58),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding:  EdgeInsets.symmetric(
                                            horizontal: getProportionateScreenWidth(5)),
                                        child: DropdownButton(
                                          underline: Container(),
                                          items:
                                              cubit.lisItems.map((itemvalue) {
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
                                    SizedBox(
                                      height: getProportionateScreenHeight(17),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${getLang(context, 'prescription')}',
                                        ),
                                        const Spacer(),
//__________________________________ Change betwen Camera and Gallery___________
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: const CircleAvatar(
                                                backgroundColor: Colors.white,
                                                child: Icon(
                                                  Icons.camera_alt,
                                                ),
                                              ),
                                              onPressed: () async {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) {
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        ListTile(
                                                          leading: const Icon(
                                                            Icons.camera_alt,
                                                          ),
                                                          title: const Text(
                                                            'Camera',
                                                          ),
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                            cubit.pickImages(
                                                              ImageSource
                                                                  .camera,
                                                            );
                                                          },
                                                        ),
                                                        ListTile(
                                                          leading: const Icon(
                                                            Icons.image,
                                                          ),
                                                          title: const Text(
                                                            'Gallery',
                                                          ),
                                                          onTap: () {
                                                            Navigator.pop(
                                                              context,
                                                            );
                                                            cubit.pickImages(
                                                              ImageSource
                                                                  .gallery,
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
//______________________________________________________________________________
                                      ],
                                    ),
                                    Center(
                                      child: Text(
                                        cubit.imageName.split('/').last,
                                        style:  TextStyle(fontSize: getProportionateScreenWidth(12)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: getProportionateScreenHeight(17),
                                    ),
                                    defaultButton(
                                      function: () async {
                                        await cubit.validate_and_upload();
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
                    ),
                  ),
          );
        },
      ),
    );
  }
}
