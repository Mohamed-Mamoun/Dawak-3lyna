import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());
  static DashboardCubit get(context) => BlocProvider.of(context);

  Stream<QuerySnapshot> donors = FirebaseFirestore.instance.collection('users').snapshots();
  Stream<QuerySnapshot> patients = FirebaseFirestore.instance.collection('Patient').snapshots();

}
