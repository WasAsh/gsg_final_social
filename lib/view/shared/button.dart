import 'package:flutter/material.dart';
import 'package:gsg_final_social/const/colors.dart';
import 'package:gsg_final_social/const/styles.dart';





Widget drawBtn({Function function , String text}){
  return Container(
    width: 200,
    child: RaisedButton(
      onPressed: function,
      child: Text(
        text ,
        style: MyStyles.Hint_Style,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: MyColors.Main_Black,
    ),
  );
}