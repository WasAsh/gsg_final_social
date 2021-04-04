import 'package:flutter/material.dart';
import 'package:gsg_final_social/const/colors.dart';
import 'package:gsg_final_social/const/styles.dart';



class PostWidget extends StatelessWidget {

  String postUserFirst ;
  String postUserName ;
  String imgUrl ;
  String postDes ;
  Widget icon ;
  Function likeFun ;
  Function commentNav ;
  String likeCount ;
  String currentUserFirst ;
  TextEditingController controller ;
  Function commentFun ;
  String postTime ;

  PostWidget({this.postUserFirst , this.postUserName , this.imgUrl , this.postDes , this.icon , this.likeFun , this.commentNav , this.likeCount , this.currentUserFirst , this.controller , this.commentFun , this.postTime});


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: MyColors.Main_Black,
                    child: Text(
                      postUserFirst,
                      style: MyStyles.White_Hint_Style,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    postUserName,
                    style: MyStyles.User_Name_Style,
                  )
                ],
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              )
            ],
          ),
        ),
        Container(
          height: 300,
          child: Image.network(
            imgUrl,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(16.0, 7, 8.0, 0),
          child: Text(
            postDes ,
            style: MyStyles.Hint_Style,
            maxLines: 2,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: icon,
                    onPressed: likeFun
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    icon: Icon(Icons.comment),
                    onPressed: commentNav
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(likeCount,
            style: MyStyles.User_Name_Style,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 0, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                radius: 20,
                backgroundColor: MyColors.Main_Black,
                child: Text(currentUserFirst,
                  style: MyStyles.White_Hint_Style,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Add a comment...",
                    hintStyle: MyStyles.Hint_Style,
                    suffixIcon: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: commentFun ,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(postTime,
              style: MyStyles.Hint_Style),
        ),
        Divider(),
      ],
    );
  }
}
