import 'package:flutter/material.dart';
import 'package:gsg_final_social/const/colors.dart';
import 'package:gsg_final_social/const/styles.dart';
import 'package:gsg_final_social/provider/post_provider.dart';
import 'package:gsg_final_social/view/auth/edit_profile_screen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: MyColors.Main_Black,
                  radius: 35,
                  child: Text(
                    Provider.of<PostProvider>(context, listen: false)
                        .userData
                        .userName[0],
                    style: MyStyles.White_Hint_Style,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  width: 190,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.Main_Grey,
                  ),
                  child: FlatButton(
                    child: Text(
                      'Edit Profile',
                      style: MyStyles.White_Hint_Style,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfileScreen(
                                  Provider.of<PostProvider>(context,
                                          listen: false)
                                      .userData)));
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
                Provider.of<PostProvider>(context, listen: false)
                    .userData
                    .userName,
                style: MyStyles.User_Name_Style),
            SizedBox(
              height: 6,
            ),
            Text(
                Provider.of<PostProvider>(context, listen: false)
                    .userData
                    .userAddress,
                style: MyStyles.Hint_Style),
            SizedBox(
              height: 6,
            ),
            Text(
                Provider.of<PostProvider>(context, listen: false)
                    .userData
                    .userPhone,
                style: MyStyles.Hint_Style),
            Divider(
              color: MyColors.Main_Grey,
            ),
            SizedBox(
              height: 5,
            ),
            Consumer<PostProvider>(
              builder: (context, value, child) {
                return value.currentUserPost.length > 0
                    ? GridView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: value.currentUserPost.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2),
                        itemBuilder: (context, index) {
                          return Container(
                            width: 50,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      value.currentUserPost[index].postImgUrl),
                                  fit: BoxFit.cover),
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Text(
                          'There is no posts added',
                          style: MyStyles.Section_Name_Style,
                        ),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
