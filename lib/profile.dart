import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  String firstName;
  String lastName;
  String phoneNo;
  int votes;
  DatabaseReference id;
  List<Profile> userProfile = [];

  Profile({@required this.firstName, @required this.lastName, this.votes});

  void likeVote() {
    this.votes = this.votes + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  child: Text(
                      "${firstName.substring(0, 1).toUpperCase()} ${firstName.substring(0, 1).toUpperCase()}"),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "$firstName $lastName",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ],
            ),
            GestureDetector(
                onTap: () {
                  votes=votes+1;
                },
                child: Text(
                  "votes: ${votes.toString()}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20),
                )),
           
          ],
        ));
  }
}
