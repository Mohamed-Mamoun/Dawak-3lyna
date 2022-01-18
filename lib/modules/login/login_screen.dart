import 'package:dawak_3lyna/modules/Signup/Signup_Screen.dart';
import 'package:dawak_3lyna/shared/components/components.dart';
import 'package:dawak_3lyna/shared/cubit/cubit.dart';
import 'package:dawak_3lyna/shared/cubit/states.dart';
import 'package:dawak_3lyna/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              // 
             // backgroundColor: Colors.white,
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
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline4.copyWith(
                                color: Colors.black,
                              ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: emailController,
                          hint: 'Email',
                          type: TextInputType.emailAddress,
                          prefix: Icons.email_outlined,
                          isReadOnly: false,
                          validate: (String valaue) {
                            if (valaue.isEmpty) {
                              return 'please enter your email address';
                            }
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          hint: 'Password',
                          type: TextInputType.visiblePassword,
                          prefix: Icons.lock,
                          isPassword: AppCubit.get(context).isPassword,
                          suffix: AppCubit.get(context).suffix,
                          suffixPressed: () {
                            AppCubit.get(context).changePassword();
                          },
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'password must not be empty';
                            }
                          },
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
                          text: 'login',
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                            ),
                            TextButton(
                              onPressed: () {
                                navigatTo(context, SignupScreen());
                              },
                              child: Text(
                                'REGISTER NOW',
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
