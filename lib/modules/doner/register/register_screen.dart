import 'package:dawak_3lyna/localizations/applocal.dart';
import 'package:dawak_3lyna/modules/Verify%20Email%20Page/verifyEmail.dart';
import 'package:dawak_3lyna/modules/doner/login/login_screen.dart';
import 'package:dawak_3lyna/modules/doner/register/cubit/signup_cubit.dart';
import 'package:dawak_3lyna/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
 const RegisterScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignupCubit(),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = SignupCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${getLang(context, 'REGISTER NOW')}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                            hint: '${getLang(context, 'fullName')}',
                            fill: Colors.white,
                            controller: cubit.namecontroller,
                            type: TextInputType.name,
                            prefix: Icons.person,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return '${getLang(context, 'meg1')}';
                              }
                              if (value.toString().length < 14) {
                                return '${getLang(context, 'meg11')}';
                              }
                            }),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                          hint: '${getLang(context, 'Email')}',
                          fill: Colors.white,
                          controller: cubit.emailcontroller,
                          type: TextInputType.emailAddress,
                          prefix: Icons.email,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return '${getLang(context, 'meg2')}';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                          hint: '${getLang(context, 'phone')}',
                          fill: Colors.white,
                          controller: cubit.numbercontroller,
                          type: TextInputType.number,
                          prefix: Icons.phone,
                          validate: (String value) {
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
                          hint: '${getLang(context, 'Password')}',
                          fill: Colors.white,
                          controller: cubit.passwordcontroller,
                          type: TextInputType.visiblePassword,
                          prefix: Icons.lock,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return'${getLang(context, 'meg4')}';
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
                                    cubit.changeCity(newValue);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultButton(
                          function: () async {
                            if (cubit.formKey.currentState.validate()) {
                              if (cubit.valuechoose != null) {
                                await cubit.signUp_User(
                                    cubit.emailcontroller.text.trim(),
                                    cubit.passwordcontroller.text.trim(),
                                    cubit.namecontroller.text,
                                    cubit.numbercontroller.text,
                                    cubit.valuechoose);
                                navigatTo(context, const VerifyEmail());
                              } else {
                                showToast(
                                    text:  '${getLang(context, 'city')}',
                                    state: ToastStates.ERROR);
                              }
                            }
                          },
                          text: '${getLang(context, 'REGISTER NOW')}',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${getLang(context, 'account2?')}',
                            ),
                            TextButton(
                              onPressed: () {
                                navigatTo(
                                  context,
                                  LoginScreen(),
                                );
                              },
                              child: Text(
                                '${getLang(context, 'login')}',
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