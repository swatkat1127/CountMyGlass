import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'google_signin.dart';

class GoogleSignUpButtonWidget extends StatelessWidget{

  @override
 Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(4.0),
    child: OutlinedButton.icon(
        label: Text(
        'Sign in with Google',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        ),
       style: OutlinedButton.styleFrom(
         shape: StadiumBorder(),
         padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
         side: BorderSide(color: Colors.black,width: 3),
       ),
      icon: FaIcon(FontAwesomeIcons.google,color: Colors.deepOrangeAccent,),
      onPressed: () {
        final provider =
        Provider.of<GoogleSignInProvider>(context, listen: false, );
        provider.login();

      },
        ),
  );

}