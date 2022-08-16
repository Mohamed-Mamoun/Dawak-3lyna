import 'package:dawak_3lyna/localizations/applocal.dart';
import 'package:dawak_3lyna/modules/doner/login/login_screen.dart';
import 'package:dawak_3lyna/modules/patient/cubit/upload_cubit.dart';
import 'package:dawak_3lyna/modules/patient/new_request_screen.dart';
import 'package:dawak_3lyna/shared/components/Size_Config.dart';
import 'package:dawak_3lyna/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPageScreen extends StatelessWidget {
  const MainPageScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadCubit, UploadState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = UploadCubit.get(context);
          SizeConfig().init(context);
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: cubit.loading.value
                ? const Loading()
                : Scaffold(
                    appBar: AppBar(
                      automaticallyImplyLeading: false,
                    ),
                    body: SafeArea(
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: getProportionateScreenHeight(25)),
                            CircleAvatar(
                              backgroundImage: const NetworkImage(
                                  'https://www.onlinelogomaker.com/blog/wp-content/uploads/2017/06/medical-logo.jpg'),
                              radius: getProportionateScreenWidth(75),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(70),
                            ),
                            Text(
                              "${getLang(context, "choses")}",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(25),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(23)),
                            defaultButton(
                              width: getProportionateScreenWidth(150),
                              function: () async {
                                await cubit.signIn_Anounumasly(context);
                              },
                              text: "${getLang(context, "Patient")}",
                            ),
                            SizedBox(height: getProportionateScreenHeight(23)),
                            defaultButton(
                              width: getProportionateScreenWidth(150),
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
