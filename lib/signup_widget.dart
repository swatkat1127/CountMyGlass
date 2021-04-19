import 'package:flutter/material.dart';
import 'Google_SignUp_Button_Widget.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => buildSignUp();

  Widget buildSignUp() => Column(

     children: [
       Spacer(),
       Align(
         alignment: Alignment.centerLeft,
         child: Container(
           margin: EdgeInsets.symmetric(horizontal: 20),
           width: 175,
           child: Text(
             'Welcome to My App',
             style: TextStyle(
               color: Colors.black,
               fontSize: 30,
               fontWeight: FontWeight.bold,
             ),
           ),
         ),
       ),
       Spacer(),
       SizedBox(height: 12.0,),
       GoogleSignUpButtonWidget(),
       Text(
         'Login to continue',
         style: TextStyle(fontSize: 16),
         ),
       Spacer(),
      ],
  );
}