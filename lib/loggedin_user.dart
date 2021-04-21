import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'google_signin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
User loggedInUser;

// ignore: must_be_immutable
class LoggedInWidget extends StatefulWidget{
  @override
  _LoggedInWidgetState createState() => _LoggedInWidgetState();
}

class _LoggedInWidgetState extends State<LoggedInWidget> {
  final _auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser;
  int _count = 0;
  int _volume = 200; //unit: ml

  void add() {
    setState(() {
      _count++;
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUserProfile();
  }

  void getCurrentUserProfile() async {
    final user = _auth.currentUser;
    try {
      if (user != null) {
        loggedInUser = user;

        // check firebase profile collection using user.uid

        // if yes then get the profile from firebase and store in profile object
        // profile = db.collection('profile').get({user:uid})

        // if no then insert into firebase in profile
        // profile = db.collection.add({
                       //  'email': loggedInUser.email,
                       //  'createAt': FieldValue.serverTimestamp()})
        // profile = db.collection.('profile').get()
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Container(
        alignment: Alignment.center,
        color: Colors.blueGrey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text(
              'Logged In',
              style: TextStyle(
                color: Colors.white,),
            ),
            SizedBox(height: 8),
            CircleAvatar(
              maxRadius: 25,
              backgroundImage: NetworkImage(user.photoURL),
            ),
            SizedBox(height: 8),
            Text(
              'Name: ' + user.displayName,
              style: TextStyle(
                  color: Colors.white,),
            ),
            SizedBox(height: 8),
            Text(
              'Email: ' + user.email,
              style: TextStyle(color: Colors.white,),
            ),
            // SizedBox(height: 8),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: add,
                    heroTag: _firestore.collection('consumption').add({
                    'email': loggedInUser.uid,
                    'volume': _volume,
                    'createAt': FieldValue.serverTimestamp(),
                    }),
                    child: new Icon(FontAwesomeIcons.plus, color: Colors.black,),
                    backgroundColor: Colors.white,
                  ),
                  SizedBox( width: 10.0,),
                  Text('$_count',
                      style: new TextStyle(fontSize: 60.0)
                  ),
                  SizedBox( width: 10.0,),
                ],
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () {
                final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false,);
                provider.logout();
              },
              child: Text('Logout',),
            )
          ],


    ),
    );
  }
}