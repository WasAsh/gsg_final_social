import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_final_social/const/colors.dart';
import 'package:gsg_final_social/const/styles.dart';
import 'package:gsg_final_social/provider/post_provider.dart';
import 'package:gsg_final_social/services/services.dart';
import 'package:gsg_final_social/view/post/post_comments_screen.dart';
import 'package:gsg_final_social/view/shared/post_widget.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLiked;
  String uid = Services.services.getUserId();
  TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Provider.of<PostProvider>(context).getAllPosts();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Consumer<PostProvider>(builder: (context, value, child) {
        return value.post.length > 0
            ? ListView.builder(
                itemCount: value.post.length,
                itemBuilder: (context, index) {
                  return PostWidget(
                    postUserFirst: value.post[index].userName[0],
                    postUserName: value.post[index].userName,
                    imgUrl: value.post[index].postImgUrl,
                    postDes: value.post[index].postDescription,
                    icon: value.post[index].postLikes.contains(uid)
                        ? Icon(Icons.favorite , color: Colors.red,)
                        : Icon(Icons.favorite_border , color: Colors.red,),
                    likeFun: ()async{
                      if(value.post[index].postLikes.contains(uid)){
                        await FirebaseFirestore
                            .instance
                            .collection('posts')
                            .doc(value.post[index].postId)
                            .update({
                          'likesCount' : value.post[index].likesCount - 1,
                          'postLikes' : FieldValue.arrayRemove([uid]),
                        });
                      }else{
                        await FirebaseFirestore
                            .instance
                            .collection('posts')
                            .doc(value.post[index].postId)
                            .update({
                          'likesCount' : value.post[index].likesCount + 1,
                          'postLikes' : FieldValue.arrayUnion([uid]),
                        });
                      }
                    },
                    commentNav: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => PostCommentsScreen(value.post[index])
                      ));
                    },
                    likeCount: value.post[index].likesCount == 0
                        ? 'No Likes'
                        : '${value.post[index].likesCount.toString()} Likes',
                    currentUserFirst: Provider.of<PostProvider>(context,
                        listen: false)
                        .userData
                        .userName[0],
                    controller: _controller,
                    commentFun: (){
                      FirebaseFirestore
                          .instance
                          .collection('posts')
                          .doc(value.post[index].postId)
                          .update({
                        'postComments' : FieldValue.arrayUnion(['${value.userData.userName}: ${_controller.text}']),
                      }).whenComplete(() => {
                        _controller.clear()
                      });
                    },
                    postTime: timeago.format(value.post[index].createdAt),
                  );
                },
              )
            : Center(
                child: Text(
                  'There is no posts yet' ,
                  style: MyStyles.Section_Name_Style,
                ),
              );
      }),
    );
  }
}
