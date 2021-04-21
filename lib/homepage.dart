import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_signin/google_signin.dart';
import 'package:google_signin/signup_widget.dart';
import 'package:provider/provider.dart';
import 'loggedin_user.dart';

class HomePage extends StatelessWidget {
 @override
  Widget build(BuildContext context) => Scaffold(
     body: ChangeNotifierProvider(
    create: (context) => GoogleSignInProvider(),
       child: StreamBuilder(
           stream: FirebaseAuth.instance.authStateChanges(),
           builder: (context, snapshot) {
             final provider = Provider.of<GoogleSignInProvider>(context);
             if (provider.isSigningIn) {
               return buildloading();
             } else if (snapshot.hasData) {
               return LoggedInWidget();
             } else {
               return SignUpWidget();
             }
           },
     ),

  ),

 );
 Widget buildloading() => Center(child: CircularProgressIndicator(),
 );
}