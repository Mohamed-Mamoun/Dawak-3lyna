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
    return Scaffold(
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
                            return 'Enter a medicine Nmae';
                          }
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    defaultFormField(
                        type: TextInputType.text,
                        prefix: Icons.upload,
                        validate: (value) {
                          if (value.isEmpty) {}
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    defaultButton(
                        function: () {
                          if (formKey.currentState.validate()) {}
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
    );
  }
}
