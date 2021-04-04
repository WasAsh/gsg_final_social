import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gsg_final_social/models/post.dart';
import 'package:gsg_final_social/models/user.dart';
import 'package:gsg_final_social/view/landing_screen.dart';
import 'package:gsg_final_social/view/splash_screen.dart';



class Services{

  Services._();
  static Services services = Services._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  String usersCollection = 'users';
  String postsCollection = 'posts';



  //auth
  Future<String> registerUsingEmailAndPassword(String email, String password) async {
    UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    User user = userCredential.user;
    return user.uid;
  }
  Future<String> signInUsingEmailAndPassword(String email, String password , BuildContext context) async {
    UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => LandingScreen()
    ));
    User user = userCredential.user;
    return user.uid;
  }

  signOut(BuildContext context) async {
    await firebaseAuth.signOut();
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen()));
  }

  //fire store
  Future<String>addUserData(UserData userData) async {
      String userId = await registerUsingEmailAndPassword(
          userData.userEmail, userData.userPassword);
      await fireStore
          .collection(usersCollection)
          .doc(userId)
          .set(userData.toJson());
    return userId ;
  }

  updateUserData(UserData userData) {
    String userId = getUserId();
    fireStore
        .collection(usersCollection)
        .doc(userId)
        .update(userData.toJson());
  }

  addPost(Post post, String uUuid) async {
    fireStore.collection(postsCollection).doc(uUuid).set(post.toJson());
  }

  Future<List<Post>> showAllPosts() async {
    QuerySnapshot querySnapshot = await fireStore
        .collection(postsCollection)
        .orderBy('createdAt', descending: true)
        .get();
    List<QueryDocumentSnapshot> documentSnapshot = querySnapshot.docs;
    List<Post> post =
    documentSnapshot.map((e) => Post.fromJson(e.data())).toList();
    return post;
  }

  Future<List<UserData>> showAllUsers() async {
    String userId = getUserId();
    QuerySnapshot querySnapshot = await fireStore
        .collection(usersCollection)
        .where('userId' , isNotEqualTo: userId)
        .get();
    List<QueryDocumentSnapshot> documentSnapshot = querySnapshot.docs;
    List<UserData> users =
    documentSnapshot.map((e) => UserData.fromJson(e.data())).toList();
    return users;
  }

  Future<UserData> showUserData() async{
    String userId = getUserId();
    DocumentSnapshot documentSnapshot = await fireStore
        .collection(usersCollection)
        .doc(userId)
        .get();
    Map map = documentSnapshot.data();
    UserData data = UserData.fromJson(map);
    return data ;
  }


  //process
  Future<String> uploadImage(File file) async {
    String filePath = file.path;
    String fileName = filePath.split('/').last;
    Reference reference = firebaseStorage.ref('imgs/$fileName');
    TaskSnapshot taskSnapshot = await reference.putFile(file);
    String url = await reference.getDownloadURL();
    return url;
  }

  String getUserId(){
    String userId = firebaseAuth.currentUser != null ? firebaseAuth.currentUser.uid : null ;
    return userId ;
  }


}