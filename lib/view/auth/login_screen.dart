import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gsg_final_social/const/colors.dart';
import 'package:gsg_final_social/const/styles.dart';
import 'package:gsg_final_social/services/services.dart';
import 'package:gsg_final_social/view/auth/register_screen.dart';
import 'package:gsg_final_social/view/shared/button.dart';
import 'package:string_validator/string_validator.dart';
import 'package:gsg_final_social/view/shared/text_form_field.dart';




class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    pwdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('ShareIt' , style: GoogleFonts.share(fontSize: 30),),
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
                  controller: emailController,
                  text: 'Email' ,
                  icon: Icons.email ,
                  isSecure: false ,
                  fun: (val){
                    bool isEmailA = isEmail(emailController.text);
                    if(isEmailA == false){
                      return 'Enter valid email' ;
                    }
                    return null ;
                  }
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
                    }
                ),
                SizedBox(height: 20,),
                Center(
                  child: drawBtn(
                    text: 'Login',
                    function: (){
                      if(_formKey.currentState.validate()){
                        Services.services.signInUsingEmailAndPassword(emailController.text, pwdController.text , context);
                      }
                    }
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont have an account?',
                      style: MyStyles.User_Name_Style,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                      },
                      child: Text(
                        'Register' ,
                        style: MyStyles.White_Hint_Style,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
