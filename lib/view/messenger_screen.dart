import 'package:flutter/material.dart';
import 'package:gsg_final_social/provider/post_provider.dart';
import 'package:gsg_final_social/view/shared/user_msn_widget.dart';
import 'package:provider/provider.dart';



class MessengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messenger'),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Consumer<PostProvider>(builder: (context, value, child) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 5 , horizontal: 5),
          child: ListView.builder(
            itemCount: value.users.length,
            itemBuilder: (context , index){
              return UserWidget(
                userFirst: value.users[index].userName[0],
                userName: value.users[index].userName,
                userEmail: value.users[index].userEmail,
              );
            },
          ),
        );
      }),
    );
  }
}
