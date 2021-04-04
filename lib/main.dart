import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gsg_final_social/provider/post_provider.dart';
import 'package:gsg_final_social/view/splash_screen.dart';
import 'package:gsg_final_social/view/landing_screen.dart';
import 'package:provider/provider.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PostProvider>(
      create: (context){
        return PostProvider();
      },
      child: MaterialApp(
        title: 'GSG Final',
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context , snapshot){
            if(snapshot.hasError){
              return Center(child: CircularProgressIndicator(),);
            }else if(snapshot.connectionState == ConnectionState.done){
              return SplashScreen();
            }
            return Center(child: CircularProgressIndicator(),);
          },
        ),
      ),
    );
  }
}