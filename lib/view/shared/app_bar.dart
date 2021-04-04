import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gsg_final_social/const/colors.dart';
import 'package:gsg_final_social/const/styles.dart';
import 'package:gsg_final_social/services/services.dart';
import 'package:gsg_final_social/view/messenger_screen.dart';



Widget myAppBar(String _title , BuildContext context){
  return AppBar(
    backgroundColor: MyColors.Main_Color,
    centerTitle: true,
    elevation: 1.0,
    title: Text(
      _title ,
      style: GoogleFonts.share(textStyle: MyStyles.App_Bar_Style),
    ),
    actions: [
      IconButton(
        icon: Icon(Icons.cancel , color: Colors.red,),
        onPressed: (){
          Services.services.signOut(context);
        },
      ),
      IconButton(
        icon: Icon(Icons.send , color: MyColors.Main_Black,),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => MessengerScreen()
          ));
        },
      ),
    ],
  );
}