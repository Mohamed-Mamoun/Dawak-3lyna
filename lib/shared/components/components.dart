import 'package:dawak_3lyna/shared/styles/colors.dart';
import 'package:flutter/material.dart';

// Button
Widget defaultButton({
  double width = double.infinity,
  Color background= myColor,
  bool isUpperCase = true,
  double radius = 0.0,
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

Widget defaultFormField({
  @required TextEditingController controller,
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
  Color fill
}) =>
    TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(prefix,color: Colors.black87),
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
