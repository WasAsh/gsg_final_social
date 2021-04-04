import 'package:flutter/material.dart';
import 'package:gsg_final_social/const/styles.dart';
import 'package:gsg_final_social/models/news.dart';
import 'package:gsg_final_social/view/shared/app_bar.dart';


class SingleNewsScreen extends StatefulWidget {
  final News news;
  SingleNewsScreen(this.news);

  @override
  _SingleNewsScreenState createState() => _SingleNewsScreenState();
}

class _SingleNewsScreenState extends State<SingleNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Description'),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
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
                image: NetworkImage(widget.news.urlToImage),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('TechCrunch', style: MyStyles.App_Bar_Style),
                    Text(widget.news.publishedAt, style: MyStyles.Hint_Style),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(widget.news.title, style: MyStyles.Section_Name_Style),
                SizedBox(
                  height: 20,
                ),
                Text(widget.news.description, style: MyStyles.User_Name_Style),
              ],
            ),
          )
        ],
      ),
    );
  }
}
