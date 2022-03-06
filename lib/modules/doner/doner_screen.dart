import 'package:dawak_3lyna/modules/mainPage/main_page_screen.dart';
import 'package:dawak_3lyna/shared/components/components.dart';
import 'package:dawak_3lyna/shared/styles/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DonerScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        showToast(text: 'Log Out', state: ToastStates.ERROR);
    return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('  Medicine Donation'),
           actions: [
            IconButton(onPressed: () async{
              await FirebaseAuth.instance.signOut;
              navigatAndFinish(context, const MainPageScreen());
            }, icon: const Icon(Icons.exit_to_app, color: Colors.black,size: 30,))
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    defaultFormField(
                      controller: emailController,
                      hint: 'Full Name',
                      type: TextInputType.name,
                      prefix: Icons.person,
                      isReadOnly: false,
                      validate: (String valaue) {
                        if (valaue.isEmpty) {
                          return 'please enter your Full Name';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    defaultFormField(
                      controller: emailController,
                      hint: 'Phone',
                      type: TextInputType.phone,
                      prefix: Icons.phone,
                      isReadOnly: false,
                      validate: (String valaue) {
                        if (valaue.isEmpty) {
                          return 'please enter your phone';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    defaultFormField(
                      controller: emailController,
                      hint: 'Medicine Name',
                      type: TextInputType.text,
                      prefix: Icons.medication,
                      isReadOnly: false,
                      validate: (String valaue) {
                        if (valaue.isEmpty) {
                          return 'please enter your Medicine Name';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    defaultFormField(
                      controller: emailController,
                      hint: 'Expiration',
                      type: TextInputType.text,
                      prefix: Icons.date_range,
                      isReadOnly: false,
                      validate: (String valaue) {
                        if (valaue.isEmpty) {
                          return 'please enter your Expiration';
                        }
                      },
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.parse('2025-11-03'),
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
                      controller: emailController,
                      hint: 'Quantity',
                      type: TextInputType.number,
                      prefix: Icons.add,
                      isReadOnly: false,
                      validate: (String valaue) {
                        if (valaue.isEmpty) {
                          return 'please enter your Quantity';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    defaultFormField(
                      controller: emailController,
                      hint: 'Location',
                      type: TextInputType.text,
                      prefix: Icons.add_location,
                      isReadOnly: false,
                      validate: (String valaue) {
                        if (valaue.isEmpty) {
                          return 'please enter your Location';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
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
                      text: 'submit',
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
