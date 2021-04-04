import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gsg_final_social/const/colors.dart';
import 'package:gsg_final_social/models/user.dart';
import 'package:gsg_final_social/provider/post_provider.dart';
import 'package:gsg_final_social/view/shared/button.dart';
import 'package:gsg_final_social/view/shared/text_form_field.dart';
import 'package:string_validator/string_validator.dart';
import 'package:provider/provider.dart';





class EditProfileScreen extends StatefulWidget {

  final UserData userData ;
  EditProfileScreen(this.userData);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController pwdController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    pwdController.text = widget.userData.userPassword ;
    nameController.text = widget.userData.userName ;
    phoneController.text = widget.userData.userPhone ;
    addressController.text = widget.userData.userAddress ;
  }

  @override
  void dispose() {
    super.dispose();
    pwdController.dispose();
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Edit Profile' , style: GoogleFonts.share(fontSize: 30),),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight ,
              end: Alignment.bottomLeft ,
              colors: [MyColors.Main_Black , MyColors.Main_Color] ,
            )
        ),
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20 , horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 160,),
                drawTextFormField(
                    controller: nameController,
                    text: 'User Name' ,
                    icon: Icons.person ,
                    isSecure: false ,
                    fun: (val){
                      bool isUserName = isLength(nameController.text , 6);
                      if(isUserName == false){
                        return 'Enter valid username' ;
                      }
                      return null ;
                    },
                    type: TextInputType.name
                ),
                SizedBox(height: 20,),
                drawTextFormField(
                    controller: pwdController,
                    text: 'Password' ,
                    icon: Icons.vpn_key ,
                    isSecure: true ,
                    fun: (val){
                      bool isPassword = isLength(pwdController.text , 6);
                      if(isPassword == false){
                        return 'Enter valid password' ;
                      }
                      return null ;
                    },
                    type: TextInputType.visiblePassword
                ),
                SizedBox(height: 20,),
                drawTextFormField(
                    controller: phoneController,
                    text: 'Phone' ,
                    icon: Icons.phone ,
                    isSecure: false ,
                    fun: (val){
                      bool isPhone = isLength(phoneController.text , 6);
                      if(isPhone == false){
                        return 'Enter valid phone number' ;
                      }
                      return null ;
                    },
                    type: TextInputType.phone
                ),
                SizedBox(height: 20,),
                drawTextFormField(
                    controller: addressController,
                    text: 'Address' ,
                    icon: Icons.map ,
                    isSecure: false ,
                    fun: (val){
                      bool isAddress = isLength(addressController.text , 6);
                      if(isAddress == false){
                        return 'Enter valid address' ;
                      }
                      return null ;
                    },
                    type: TextInputType.streetAddress
                ),
                SizedBox(height: 20,),
                Center(
                  child: drawBtn(
                      text: 'Update' ,
                      function: (){
                        if(_formKey.currentState.validate()){
                          UserData user = UserData(
                            userName: nameController.text,
                            userEmail: widget.userData.userEmail,
                            userPassword: pwdController.text,
                            userAddress: addressController.text,
                            userPhone: phoneController.text,
                          );
                          context.read<PostProvider>().updateUserData(user);
                          Navigator.pop(context);
                        }
                      }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
