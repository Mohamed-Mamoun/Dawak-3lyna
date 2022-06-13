import 'package:dawak_3lyna/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';


 class Loading extends StatelessWidget {
   const Loading({ Key key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Container(
       color: Colors.white,
       child: const Center(
         child: SpinKitPouringHourGlass(
           size: 70.0,
           color: myColor,
         ),
       ),
     );
   }
}

Widget defaultButton({
  double width = double.infinity,
  Color background = myColor,
  bool isUpperCase = true,
  double radius = 15.0,
  @required Function function,
  @required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
    );

Widget defaultFormField(
        {@required TextEditingController controller,
        String label,
        String hint,
        @required TextInputType type,
        @required IconData prefix,
        IconData suffix,
        @required Function validate,
        Function onSubmitted,
        Function onTap,
        Function onChanged,
        bool isPassword = false,
        bool isReadOnly = false,
        Function suffixPressed,
        bool obscureText,
        double radius = 15.0,
        Color fill}) =>
    TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(
          prefix,
          color: myColor,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffix),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      keyboardType: type,
      obscureText: isPassword,
      // On Submitted Value
      onFieldSubmitted: onSubmitted,
      // On Chang Value
      onChanged: onChanged,
      validator: validate,
      onTap: onTap,
      readOnly: isReadOnly,
    );

// Text Button
Widget defaultTextButton({
  @required Function function,
  @required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
      ),
    );

void navigatTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

void navigatAndFinish(context, widget) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

void showToast({
  @required String text,
  @required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
