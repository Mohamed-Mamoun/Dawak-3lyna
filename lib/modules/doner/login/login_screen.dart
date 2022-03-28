import 'package:conditional_builder/conditional_builder.dart';
import 'package:dawak_3lyna/layout/layout_screen.dart';
import 'package:dawak_3lyna/modules/doner/login/cubit/cubit.dart';
import 'package:dawak_3lyna/modules/doner/login/cubit/states.dart';
import 'package:dawak_3lyna/modules/doner/register/register_screen.dart';
import 'package:dawak_3lyna/shared/components/components.dart';
import 'package:dawak_3lyna/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            showToast(
              text: state.error.toString(),
              state: ToastStates.ERROR,
            );
          }
          if (state is LoginSuccessState) {
            // print(state.uId);
            showToast(
              text: state.toString(),
              state: ToastStates.SUCCESS,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
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
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: emailController,
                          hint: 'Email',
                          type: TextInputType.emailAddress,
                          prefix: Icons.phone,
                          isReadOnly: false,
                          validate: (String valaue) {
                            if (valaue.isEmpty) {
                              return 'please enter your email address';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          hint: 'Password',
                          type: TextInputType.visiblePassword,
                          prefix: Icons.lock,
                          isPassword: LoginCubit.get(context).isPasswordShow,
                          suffix: LoginCubit.get(context).suffix,
                          suffixPressed: () {
                            LoginCubit.get(context).changePasswordVisib();
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
                        ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context) => defaultButton(
                            background: myColor,
                            radius: 15.0,
                            function: () async {
                              if (formKey.currentState.validate()) {
                               await LoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text);
                                    navigatTo(context, const LayoutScreen());
                              }
                            },
                            text: 'login',
                          ),
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account?',
                            ),
                            TextButton(
                              onPressed: () {
                                navigatTo(context,RegisterScreen()) ;
                              },
                              child: const Text(
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
