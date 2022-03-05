import 'package:dawak_3lyna/modules/Signup/cubit/signup_cubit.dart';
import 'package:dawak_3lyna/modules/Verify%20Email%20Page/verifyEmail.dart';
import 'package:dawak_3lyna/modules/login/login_screen.dart';
import 'package:dawak_3lyna/shared/components/components.dart';
import 'package:dawak_3lyna/shared/cubit/cubit.dart';
import 'package:dawak_3lyna/shared/cubit/states.dart';
import 'package:dawak_3lyna/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var formKey = GlobalKey<FormState>();

  var namecontroller = TextEditingController();
  var numbercontroller = TextEditingController();
  var agecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var password2_controller = TextEditingController();
  var _value = 1;
  var genderValue;

  List lisItems = ['Khartoum', 'Omdourman', 'Bahri'];

  String valuechoose;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignupCubit(),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 80, bottom: 15, right: 280),
                      child: Text(
                        'SignUp',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
                            defaultFormField(
                                hint: 'Full Name',
                                fill: Colors.white,
                                controller: namecontroller,
                                type: TextInputType.name,
                                prefix: Icons.person,
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please Enter your Name';
                                  }
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    'Gender:',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Radio(
                                      value: 1,
                                      groupValue: _value,
                                      onChanged: (value) {
                                        setState(() {
                                          _value = 1;
                                        });
                                      }),
                                  const Text(
                                    'Male',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Radio(
                                      value: 2,
                                      groupValue: _value,
                                      onChanged: (value) {
                                        setState(() {
                                          _value = 2;
                                        });
                                      }),
                                  const Text(
                                    'Female',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            defaultFormField(
                                hint: 'Phone Number',
                                fill: Colors.white,
                                controller: numbercontroller,
                                type: TextInputType.number,
                                prefix: Icons.phone,
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please Enter your Phone Number';
                                  }
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: DropdownButton(
                                    items: lisItems.map((itemvalue) {
                                      return DropdownMenuItem(
                                          value: itemvalue,
                                          child: Text(itemvalue));
                                    }).toList(),
                                    isExpanded: true,
                                    hint: Text(' Select Your City'),
                                    value: valuechoose,
                                    onChanged: (newValue) {
                                      setState(() {
                                        valuechoose = newValue;
                                      });
                                    }),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            defaultFormField(
                                hint: 'Email',
                                fill: Colors.white,
                                controller: emailcontroller,
                                type: TextInputType.emailAddress,
                                prefix: Icons.email,
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please Enter your Email';
                                  }
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            defaultFormField(
                                hint: 'Password',
                                fill: Colors.white,
                                controller: passwordcontroller,
                                type: TextInputType.visiblePassword,
                                prefix: Icons.lock,
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please Enter your Password';
                                  }
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            defaultFormField(
                                hint: 'Confirm Password',
                                fill: Colors.white,
                                controller: password2_controller,
                                type: TextInputType.visiblePassword,
                                prefix: Icons.lock,
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please Confirm Your Password';
                                  }
                                }),
                            const SizedBox(
                              height: 20,
                            ),
                            defaultButton(
                                function: () async {
                                  if (formKey.currentState.validate()) {
                                    if (_value == 1) {
                                      genderValue = 'male';
                                    }
                                    if (_value == 2) {
                                      genderValue = 'female';
                                    }
                                    await SignupCubit().signUp_User(
                                      emailcontroller.text.trim(),
                                      passwordcontroller.text.trim(),
                                      namecontroller.text,
                                      genderValue,
                                      numbercontroller.text,
                                      agecontroller.text,
                                    );
                                    navigatAndFinish(
                                        context, const VerifyEmail());
                                  }
                                },
                                text: 'SignUp',
                                radius: 10)
                          ],
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already Have an account?',
                        ),
                        TextButton(
                          onPressed: () {
                            navigatTo(context, LoginScreen());
                          },
                          child: const Text(
                            'Login',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
