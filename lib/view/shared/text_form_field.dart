import 'package:flutter/material.dart';
import 'package:gsg_final_social/const/colors.dart';
import 'package:gsg_final_social/const/styles.dart';



Widget drawTextFormField({TextEditingController controller, String text, IconData icon , bool isSecure , Function fun , TextInputType type }){
  return TextFormField(
    validator: fun ,
    controller: controller,
    obscureText: isSecure,
    keyboardType: type,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: MyColors.Main_Color, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: MyColors.Main_Color, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: MyColors.Main_Color, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: MyColors.Main_Color, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      hintText: text,
      hintStyle: MyStyles.White_Hint_Style,
      prefixIcon: Icon(
        icon,
        color: MyColors.Main_Color,
      ),
    ),
  );
}