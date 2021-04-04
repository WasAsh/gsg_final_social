import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gsg_final_social/const/colors.dart';
import 'package:gsg_final_social/provider/post_provider.dart';
import 'package:gsg_final_social/view/auth/login_screen.dart';
import 'package:provider/provider.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Timer _timer;

  void _autoNav()async{
    _timer = Timer(Duration(seconds: 2) , navigationPage);
  }
  void navigationPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    _autoNav();
  }
  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {

    Provider.of<PostProvider>(context).getAllPosts();
    Provider.of<PostProvider>(context).getAllNews();
    Provider.of<PostProvider>(context).getAllUsers();


    return Scaffold(
      body: Container(
        color: MyColors.Main_White,
        child: Center(
          child: Text('ShareIt' , style: GoogleFonts.share(fontSize: 30),),
        ),
      ),
    );
  }
}
