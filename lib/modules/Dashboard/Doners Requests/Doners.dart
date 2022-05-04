import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dawak_3lyna/modules/Dashboard/cubit/dashboard_cubit.dart';
import 'package:dawak_3lyna/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Donors extends StatelessWidget {
  const Donors({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = DashboardCubit.get(context);
          return Scaffold(
            body: StreamBuilder<QuerySnapshot>(
                stream: cubit.donors,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: myColor,
                    ));
                  }
                  if (snapshot.connectionState == ConnectionState.none) {
                    return const Center(
                      child: Text(
                        'No Internet Connection',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    );
                  }
                  var data = snapshot.requireData;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      itemCount: data.size,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration:  BoxDecoration(
                              color: myColor[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data.docs[index]['Full_Name'],
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
          );
        });
  }
}
