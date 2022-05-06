import 'package:dawak_3lyna/localizations/applocal.dart';
import 'package:dawak_3lyna/modules/patient/cubit/upload_cubit.dart';
import 'package:dawak_3lyna/shared/components/components.dart';
import 'package:dawak_3lyna/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var dateController = TextEditingController();
  var nameController = TextEditingController();
  var quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadCubit, UploadState>(
      listener: (context, state) {},
      builder: (context, state){
        final cubit = UploadCubit.get(context);
        return  Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${getLang(context, 'md')}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                defaultFormField(
                  controller: nameController,
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
                const SizedBox(
                  height: 15.0,
                ),
                defaultFormField(
                  controller: dateController,
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
                          dateController.text =
                              DateFormat.yMMMd().format(value),
                        });
                    ;
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                defaultFormField(
                  controller: quantityController,
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
                const SizedBox(height: 15,),
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
                  height: 20.0,
                ),
                defaultButton(
                  background: myColor,
                  radius: 15.0,
                  function: () {
                    if (formKey.currentState.validate()) {}
                  },
                  text: '${getLang(context, 'submit')}',
                ),
                const SizedBox(
                  height: 30.0,
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
