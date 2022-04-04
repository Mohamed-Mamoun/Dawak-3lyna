import 'package:dawak_3lyna/modules/Verify%20Email%20Page/verifyEmail.dart';
import 'package:dawak_3lyna/modules/doner/login/login_screen.dart';
import 'package:dawak_3lyna/modules/doner/register/cubit/signup_cubit.dart';
import 'package:dawak_3lyna/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  var namecontroller = TextEditingController();
  var numbercontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  List lisItems = ['Khartoum', 'Omdourman', 'Bahri'];

  String valuechoose;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignupCubit(),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = SignupCubit();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
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
                        Text(
                          'SIGN UP',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
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
                              if (value.toString().length < 14) {
                                return 'Enter Your Full Name';
                              }
                            }),
                        const SizedBox(
                          height: 15,
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
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                          hint: 'Phone ',
                          fill: Colors.white,
                          controller: numbercontroller,
                          type: TextInputType.number,
                          prefix: Icons.phone,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Please Enter your Phone Number';
                            }
                            if (value.toString().length < 10) {
                              return 'Enter a correct Phone Number';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 15,
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
                                ' Select Your City',
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
                        const SizedBox(
                          height: 20,
                        ),
                        defaultButton(
                          function: () async {
                            if (formKey.currentState.validate()) {
                              if (valuechoose != null) {
                                await cubit.signUp_User(
                                    emailcontroller.text.trim(),
                                    passwordcontroller.text.trim(),
                                    namecontroller.text,
                                    numbercontroller.text,
                                    valuechoose);
                                navigatTo(context, const VerifyEmail());
                              } else {
                                showToast(
                                    text: 'Select Your City',
                                    state: ToastStates.ERROR);
                              }
                            }
                          },
                          text: 'Sign Up',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already Have an account?',
                            ),
                            TextButton(
                              onPressed: () {
                                navigatTo(
                                  context,
                                  LoginScreen(),
                                );
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
              ),
            ),
          );
        },
      ),
    );
  }
}
