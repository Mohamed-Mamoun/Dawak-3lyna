import 'package:dawak_3lyna/localizations/applocal.dart';
import 'package:dawak_3lyna/modules/patient/cubit/upload_cubit.dart';
import 'package:dawak_3lyna/shared/components/Size_Config.dart';
import 'package:dawak_3lyna/shared/components/components.dart';
import 'package:dawak_3lyna/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadCubit, UploadState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = UploadCubit.get(context);
        SizeConfig().init(context);
        return cubit.loading.value
            ? const Loading()
            : Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(getProportionateScreenWidth(18)),
                    child: Form(
                      key: cubit.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${getLang(context, 'md')}',
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(22),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(17),
                          ),
                          defaultFormField(
                            controller: cubit.nameController,
                            hint: '${getLang(context, 'mn')}',
                            type: TextInputType.text,
                            prefix: Icons.medication,
                            isReadOnly: false,
                            validate: (String valaue) {
                              if (valaue.isEmpty) {
                                return '${getLang(context, 'mnMeg')}';
                              }
                            },
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(17),
                          ),
                          defaultFormField(
                            controller: cubit.dateController,
                            hint: '${getLang(context, 'ex')}',
                            type: TextInputType.text,
                            prefix: Icons.date_range,
                            isReadOnly: false,
                            validate: (String valaue) {
                              if (valaue.isEmpty) {
                                return '${getLang(context, 'exMeg')}';
                              }
                            },
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse('2050-11-03'),
                              ).then((value) => {
                                    // dateController.text = value.
                                    print(DateFormat.yMMMd().format(value)),
                                    cubit.dateController.text =
                                        DateFormat.yMMMd().format(value),
                                  });
                              ;
                            },
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(17),
                          ),
                          defaultFormField(
                            controller: cubit.quantityController,
                            hint: '${getLang(context, 'q')}',
                            type: TextInputType.number,
                            prefix: Icons.add,
                            isReadOnly: false,
                            validate: (String valaue) {
                              if (valaue.isEmpty) {
                                return '${getLang(context, 'qMeg')}';
                              }
                            },
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
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              ListTile(
                                                leading: const Icon(
                                                  Icons.camera_alt,
                                                ),
                                                title: const Text(
                                                  'Camera',
                                                ),
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  cubit.pickImages(
                                                    ImageSource.camera,
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
                                                    ImageSource.gallery,
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
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(12)),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          defaultButton(
                            background: myColor,
                            radius: 15.0,
                            function: () async {
                              await cubit.donorRequestForm();
                            },
                            text: '${getLang(context, 'submit')}',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
