import 'package:flutter/material.dart';
import 'package:gsg_final_social/models/news.dart';
import 'package:gsg_final_social/models/post.dart';
import 'package:gsg_final_social/models/user.dart';
import 'package:gsg_final_social/services/api_services.dart';
import 'package:gsg_final_social/services/services.dart';



class PostProvider extends ChangeNotifier{

  List<Post> post = [];
  List<News> news = [];
  List<UserData> users = [] ;
  List<Post> currentUserPost = [] ;
  UserData userData ;


  //fill lists
  fillList(List<Post> post){
    this.post = post ;
    notifyListeners();
  }
  fillUsersList(List<UserData> users){
    this.users = users ;
    notifyListeners();
  }
  fillCurrentUserPost(List<Post> post){
    this.currentUserPost = post ;
    notifyListeners();
  }
  fillNewsList(List<News> news){
    this.news = news ;
    notifyListeners();
  }
  fillUserData(UserData userData){
    this.userData = userData ;
    notifyListeners();
  }

  //get all
  getAllPosts()async{
    List<Post> post = await Services.services.showAllPosts();
    fillList(post);
  }
  getAllUsers()async{
    List<UserData> users = await Services.services.showAllUsers();
    fillUsersList(users);
  }
  getUserData()async{
    UserData userData = await Services.services.showUserData();
    fillUserData(userData);
  }
  getAllNews()async{
    List<News> news = await ApiServices.apiServices.getAllNews();
    fillNewsList(news);
  }

  //split
  getCurrentUserPost()async{
    List<Post> post = await showCurrentUserPost();
    fillCurrentUserPost(post);
  }

  //add
  addPost(Post post)async{
    await Services.services.addPost(post, post.postId);
    getAllPosts();
  }

  //update
  updateUserData(UserData userData)async{
    await Services.services.updateUserData(userData);
    getUserData();
  }

  //split operations
  Future<List<Post>> showCurrentUserPost()async{
    String currentUserId = Services.services.getUserId();
    List<Post> all = post;
    List<Post> some = [] ;
    all.forEach((element) {
      if(element.userId == currentUserId){
        some.add(element);
      }
    });
    return some ;
  }

}