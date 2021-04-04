import 'package:flutter/material.dart';
import 'package:gsg_final_social/const/colors.dart';
import 'package:gsg_final_social/const/styles.dart';



class NewsWidget extends StatelessWidget {

  String img ;
  String title ;
  String author ;
  Function onTap ;
  NewsWidget({this.img , this.title , this.author , this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 130,
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: MyColors.Main_White,
            boxShadow: [
              BoxShadow(
                color: MyColors.Main_Grey,
                blurRadius: 2,
                spreadRadius: 0,
                offset: Offset(3, 3),
              )
            ]),
        child: Row(
          children: [
            Container(
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(img),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "TechCrunch",
                      style: MyStyles.Section_Name_Style
                    ),
                    Text(
                      title,
                      maxLines: 2,
                      style: MyStyles.User_Name_Style
                    ),
                    Text(
                      author,
                      style: MyStyles.Hint_Style
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
