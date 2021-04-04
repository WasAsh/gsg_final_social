import 'package:flutter/material.dart';
import 'package:gsg_final_social/const/colors.dart';
import 'package:gsg_final_social/const/styles.dart';




class UserWidget extends StatelessWidget {

  String userFirst ;
  String userName ;
  String userEmail ;
  UserWidget({this.userFirst , this.userName , this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: MyColors.Main_Black,
          child: Text(
            userFirst,
            style: MyStyles.White_Hint_Style,
          ),
        ),
        title: Text(
          userName ,
          style: MyStyles.User_Name_Style,
        ),
        subtitle: Text(
          userEmail ,
          style: MyStyles.Hint_Style ,
        ),
        onTap: (){

        },
      ),
    );
  }
}
