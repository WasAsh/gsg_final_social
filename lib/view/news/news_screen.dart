import 'package:flutter/material.dart';
import 'package:gsg_final_social/provider/post_provider.dart';
import 'package:gsg_final_social/view/shared/news_widget.dart';
import 'file:///C:/Users/wass/AndroidStudioProjects/gsg_final_social/lib/view/news/single_news_screen.dart';
import 'package:provider/provider.dart';





class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(builder: (context , value , child){
      return Container(
        padding: EdgeInsets.symmetric(vertical: 20 , horizontal: 20),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: value.news.length,
          itemBuilder: (context , index){
            return NewsWidget(
              img: value.news[index].urlToImage,
              title: value.news[index].title,
              author: value.news[index].author,
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => SingleNewsScreen(value.news[index])
                ));
              },
            );
          },
        ),
      );
    },
    );
  }
}
