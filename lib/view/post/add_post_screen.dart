import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gsg_final_social/const/colors.dart';
import 'package:gsg_final_social/const/styles.dart';
import 'package:gsg_final_social/models/post.dart';
import 'package:gsg_final_social/provider/post_provider.dart';
import 'package:gsg_final_social/services/services.dart';
import 'package:gsg_final_social/view/landing_screen.dart';
import 'package:gsg_final_social/view/shared/button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';





class AddPostScreen extends StatefulWidget {
  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

  TextEditingController _postTextController = TextEditingController();
  File img ;
  String imgUrl ;
  String postId ;
  ImagePicker picker = ImagePicker();

  pickImage()async{
    PickedFile  pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      img = File(pickedImage.path) ;
    });
  }

  getUuid(){
    var uuid = Uuid();
    String uuUid = uuid.v1();
    setState(() {
      postId = uuUid ;
    });
  }


  @override
  void dispose() {
    super.dispose();
    _postTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Post' ,
              style: MyStyles.Section_Name_Style,
            ),
            SizedBox(height: 20,),
            Container(
                height: 300,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20) ,
                    border: Border.all(color: MyColors.Main_Grey , width: 1)
                ),
              child: img != null
                ? Image.file(img , fit: BoxFit.cover,)
                  : Center(
                child: GestureDetector(
                  child: Text(
                    'Click Here To Add Photo' ,
                    maxLines: 2,
                    style: MyStyles.Hint_Style,
                  ),
                  onTap: (){pickImage();},
                ),
              ),
            ),
            RaisedButton(
              child: Text('Up' , style: MyStyles.White_Hint_Style,),
              onPressed: ()async{
                String url = await Services.services.uploadImage(img);
                setState(() {
                  imgUrl = url ;
                });
              },
            ),
            SizedBox(height: 20,),
            TextField(
              maxLines: 3,
              controller: _postTextController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyColors.Main_Grey, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyColors.Main_Grey, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Add text here!' ,
                hintStyle: MyStyles.Hint_Style
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: drawBtn(
                text: 'Add' ,
                function: ()async{
                  String userId = Services.services.getUserId();
                  await getUuid();
                  Post post = Post(
                    postId: postId ,
                    userId: userId ,
                    postDescription: _postTextController.text ,
                    userName: Provider.of<PostProvider>(context , listen: false).userData.userName ,
                    postImgUrl: imgUrl ,
                    postLikes: [] ,
                    postComments: [] ,
                    createdAt: DateTime.now(),
                    likesCount: 0 ,
                  );
                  context.read<PostProvider>().addPost(post);
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => LandingScreen()
                  ));
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
