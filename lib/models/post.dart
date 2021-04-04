import 'package:cloud_firestore/cloud_firestore.dart';


class Post{

  String postId ;
  String userId ;
  String postDescription ;
  String userName ;
  String postImgUrl ;
  List postLikes ;
  List postComments ;
  int likesCount ;
  DateTime createdAt ;

  Post({this.postId , this.userId , this.postDescription , this.userName , this.postImgUrl , this.postLikes , this.postComments , this.likesCount , this.createdAt});

  Map <String , dynamic> toJson(){
    return {
      'postId' : this.postId ,
      'userId' : this.userId ,
      'postDescription' : this.postDescription ,
      'userName' : this.userName ,
      'postImgUrl' : this.postImgUrl ,
      'postLikes' : this.postLikes ,
      'postComments' : this.postComments ,
      'likesCount' : this.likesCount ,
      'createdAt' : this.createdAt ,
    };
  }

  Post.fromJson(Map <String , dynamic> jsonObj){
    this.postId = jsonObj['postId'] ;
    this.userId = jsonObj['userId'] ;
    this.postDescription = jsonObj['postDescription'] ;
    this.userName = jsonObj['userName'] ;
    this.postImgUrl = jsonObj['postImgUrl'];
    this.postLikes = jsonObj['postLikes'];
    this.postComments = jsonObj['postComments'];
    this.likesCount = jsonObj['likesCount'];
    this.createdAt = (jsonObj['createdAt'] as Timestamp).toDate();
  }

}