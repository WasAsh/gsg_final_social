import 'package:flutter/material.dart';
import 'package:gsg_final_social/const/colors.dart';
import 'package:gsg_final_social/provider/post_provider.dart';
import 'file:///C:/Users/wass/AndroidStudioProjects/gsg_final_social/lib/view/post/add_post_screen.dart';
import 'package:gsg_final_social/view/home_screen.dart';
import 'file:///C:/Users/wass/AndroidStudioProjects/gsg_final_social/lib/view/news/news_screen.dart';
import 'package:gsg_final_social/view/profile_screen.dart';
import 'package:gsg_final_social/view/shared/app_bar.dart';
import 'package:provider/provider.dart';



class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> with SingleTickerProviderStateMixin{

  TabController tabController;
  int tabIndex = 0 ;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    Provider.of<PostProvider>(context).getUserData();
    Provider.of<PostProvider>(context).getCurrentUserPost();


    return Scaffold(
      appBar: myAppBar('ShareApp' , context),
      body: TabBarView(
        controller: tabController,
        children: [
          NewsScreen(),
          HomeScreen(),
          AddPostScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: TabBar(
        labelColor: MyColors.Main_Color,
        indicatorColor: MyColors.Main_Black,
        controller: tabController,
        tabs: [
          Tab(
            child: Icon(Icons.featured_play_list , color: MyColors.Main_Black,),
          ),
          Tab(
            child: Icon(Icons.home , color: MyColors.Main_Black,),
          ),
          Tab(
            child: Icon(Icons.add , color: MyColors.Main_Black,),
          ),
          Tab(
            child: Icon(Icons.account_box , color: MyColors.Main_Black,),
          )
        ],
      ),
    );
  }
}
