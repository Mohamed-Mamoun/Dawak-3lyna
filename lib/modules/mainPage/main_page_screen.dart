import 'package:dawak_3lyna/localizations/applocal.dart';
import 'package:dawak_3lyna/modules/doner/login/login_screen.dart';
import 'package:dawak_3lyna/modules/patient/cubit/upload_cubit.dart';
import 'package:dawak_3lyna/modules/patient/new_request_screen.dart';
import 'package:dawak_3lyna/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPageScreen extends StatelessWidget {
  MainPageScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadCubit, UploadState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = UploadCubit.get(context);
          final hieght = MediaQuery.of(context).size.height;
          final width = MediaQuery.of(context).size.width;
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: cubit.loading
                ? const Loading()
                : Scaffold(
                    appBar: AppBar(
                      automaticallyImplyLeading: false,
                    ),
                    body: SafeArea(
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: hieght * 0.05,
                            ),
                            CircleAvatar(
                              backgroundImage: const NetworkImage(
                                  'https://www.onlinelogomaker.com/blog/wp-content/uploads/2017/06/medical-logo.jpg'),
                              radius: width * 0.20,
                            ),
                            SizedBox(
                              height: hieght * 0.09,
                            ),
                            Text(
                              "${getLang(context, "choses")}",
                              style: TextStyle(
                                fontSize: width * 0.070,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: hieght * 0.03,
                            ),
                            defaultButton(
                              width: width * 0.40,
                              function: () async {
                                await cubit.signIn_Anounumasly();
                                navigatTo(
                                  context,
                                  const NewRequest(),
                                );
                              },
                              text: "${getLang(context, "Patient")}",
                            ),
                            SizedBox(
                              height: hieght * 0.03,
                            ),
                            defaultButton(
                              width: width * 0.40,
                              function: () {
                                navigatTo(
                                  context,
                                  LoginScreen(),
                                );
                              },
                              text: "${getLang(context, "donation")}",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          );
        });
  }
}
