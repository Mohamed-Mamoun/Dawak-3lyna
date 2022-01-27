import 'package:dawak_3lyna/modules/Patient/Botom%20nav%20bar/bottomNav.dart';
import 'package:dawak_3lyna/modules/Patient/New%20Request/newRequest.dart';
import 'package:dawak_3lyna/shared/components/components.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
    );
  }
}