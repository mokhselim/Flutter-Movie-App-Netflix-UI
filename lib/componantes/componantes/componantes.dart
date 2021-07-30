import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neo_old_movies/style/colors.dart';
import 'package:neo_old_movies/style/text_styles.dart';

void navigateTo(context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void navigateToAndRemove(context, Widget widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}

Widget defaultTextFormField({
  required String hint,
  required TextInputType inputType,
  required TextEditingController textEditingController,
  bool isPassword = false,
  required Icon perfixIcon,
  IconButton? suffixIcon,
}) {
  return TextFormField(
    onFieldSubmitted: (value) {
      textEditingController.text = value;
    },
    controller: textEditingController,
    style: arabicStyle,
    obscureText: isPassword,
    // inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'[0-9]'))],
    textInputAction: TextInputAction.next,
    cursorColor: Colors.white,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      prefixIcon: perfixIcon,
      suffixIcon: suffixIcon,
      hintText: hint,
      hintStyle: arabicStyle.copyWith(color: Colors.white54),
      isCollapsed: false,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade800),
          borderRadius: BorderRadius.circular(8)),
      contentPadding: EdgeInsets.all(5),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade800),
          borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: userColor),
      ),
    ),
  );
}