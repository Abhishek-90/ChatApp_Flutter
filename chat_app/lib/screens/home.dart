import 'package:chatapp/provider/userprovider.dart';
import 'package:chatapp/screens/Profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.withOpacity(0.9),
          title: Text(
            'ChatApp',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                onPressed: () {}),
            PopupMenuButton<String>(
                onSelected: choiceAction,
                itemBuilder: (BuildContext context){
                  return Constants.choices.map((String choice){
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice)
                    );
                  }).toList();
                })
          ],
        ),
        );
  }

  void choiceAction(String choice){
    if(choice==Constants.SignOut){
      final user = Provider.of<UserProvider>(context,listen: false);
      print("Loggin OFF-1");
      user.signOut();
      print("Loggin OFF-2");

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LogInScreen()));
    }
    else if(choice==Constants.Profile){
      print("Entering Profile Page");
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ProfilePage()));
    }
    }
//    print("Working");
}

class Constants{
  static const String SignOut="Sign out";
  static const String Profile="Profile";

  static const List<String> choices=[
    Profile,
    SignOut
  ];
}