import 'package:dawak_3lyna/modules/login/login_screen.dart';
import 'package:dawak_3lyna/shared/components/components.dart';
import 'package:dawak_3lyna/shared/cubit/cubit.dart';
import 'package:dawak_3lyna/shared/cubit/states.dart';
import 'package:dawak_3lyna/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var namecontroller = TextEditingController();
  var gendercontroller = TextEditingController();
  var citycontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var password2_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
         
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60, bottom: 20, right: 240),
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
                                SizedBox(height: 10,),
                            defaultFormField(
                                hint: 'Gender',
                                fill: Colors.white,
                                controller: gendercontroller,
                                type: TextInputType.text,
                                prefix: Icons.male,
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please Enter your Gender';
                                  }
                                }),
                                SizedBox(height: 10,),
                            defaultFormField(
                                hint: 'City',
                                fill: Colors.white,
                                controller: citycontroller,
                                type: TextInputType.text,
                                prefix: Icons.location_on,
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please Enter your City';
                                  }
                                }),
                                SizedBox(height: 10,),
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
                                SizedBox(height: 10,),
                            defaultFormField(
                                hint: 'Password',
                                fill: Colors.white,
                                controller: passwordcontroller,
                                type: TextInputType.visiblePassword,
                                isPassword: AppCubit.get(context).isPassword,
                                suffix: AppCubit.get(context).suffix,
                                suffixPressed: () {
                                  AppCubit.get(context).changePassword();
                                },
                                prefix: Icons.lock,
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please Enter your Password';
                                  }
                                }),
                                SizedBox(height: 10,),
                                 defaultFormField(
                                hint: 'Confirm Password',
                                fill: Colors.white,
                                controller: password2_controller,
                                type: TextInputType.visiblePassword,
                                isPassword: AppCubit.get(context).isPassword,
                                suffix: AppCubit.get(context).suffix,
                                suffixPressed: () {
                                  AppCubit.get(context).changePassword();
                                },
                                prefix: Icons.lock,
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please Confirm Your Password';
                                  }
                                  if(value != passwordcontroller){
                                    return 'Password Dont match';
                                  }
                                }),
                                SizedBox(height: 20,),
                                defaultButton(function: (){}, text: 'SignUp', radius: 10)
                          ],
                        )),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already Have an account?',
                            ),
                            TextButton(
                              onPressed: () {
                                navigatTo(context, LoginScreen());
                              },
                              child: Text(
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
