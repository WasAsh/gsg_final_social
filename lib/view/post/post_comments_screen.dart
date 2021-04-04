import 'package:flutter/material.dart';
import 'package:gsg_final_social/const/styles.dart';
import 'package:gsg_final_social/models/post.dart';



class PostCommentsScreen extends StatelessWidget {

  final Post post ;
  PostCommentsScreen(this.post);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Comments'),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(post.postImgUrl),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: post.postComments.length,
            itemBuilder: (context , index){
              return Container(
                padding: EdgeInsets.symmetric(vertical: 5 , horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        post.postComments[index] ,
                      style: MyStyles.User_Name_Style,
                    ),
                    Divider(),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
