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
                    return const Center(child: CircularProgressIndicator(color: myColor,));
                  }
                  if(snapshot.connectionState == ConnectionState.none){
                    return const Center(
                      child: Text('No Internet Connection',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    );
                  }
                var data = snapshot.requireData;
                return ListView.builder(
                   itemCount: data.size,
                  itemBuilder: (snapshot, index){
                  return ListTile(
                    title: Text(data.docs[index]['Full_Name']),
                  );}
                );
              }
            ),
          );
        });
  }
}
