import 'package:dawak_3lyna/shared/components/components.dart';
import 'package:flutter/material.dart';

class NewRequest extends StatelessWidget {
  NewRequest({Key key}) : super(key: key);
  final medicineName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add New Request',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 15,
            ),
            defaultFormField(
                controller: medicineName,
                type: TextInputType.text,
                prefix: Icons.medication,
                validate: (value) {
                  if(value.isEmpty){
                    return 'Enter a medicine Nmae';
                  }
                }),
                 SizedBox(
              height: 10,
            ),
                defaultFormField(
                type: TextInputType.text,
                prefix: Icons.upload,
                validate: (value) {
                  if(value.isEmpty){
                  }
                }),
                 SizedBox(
              height: 15,
            ),
              defaultButton(function: (){}, text: 'Submit', radius: 15)
          ],
        ),
      ),
    );
  }
}
