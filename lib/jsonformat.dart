/*

import 'dart:convert';
import 'package:backendapp/profile.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  //final votesController = TextEditingController();
  List<Profile> userProfile = [];
  int votes;

  bool isloading = false;

  Future<void> sendData() async {
    setState(() {
      isloading = true;
    });
    await http.post("https://voteapp-18271.firebaseio.com/userProfile.json",
        body: json.encode({
          'firstName': firstNameController.text,
          'lastName': lastNameController.text,
          'votes': 0
        }));
    setState(() {
      isloading = false;
    });
    setState(() {
      userProfile.add(Profile(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          votes: votes));
    });
  }

  Future<void> fetchtheprofiles() async {
    final response =
        await http.get("https://voteapp-18271.firebaseio.com/userProfile.json");
    print(json.decode(response.body));
    final List<Profile> loadedProfile = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    extractedData.forEach((profileId, profileData) {
      loadedProfile.add(
        Profile(
          // votes: profileData['votes'],
          lastName: profileData['firstName'],
          firstName: profileData['lastName'],
          votes: profileData['votes'],
        ),
      );
    });
    userProfile = loadedProfile;
  }

  @override
  void initState() {
    fetchtheprofiles();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("User Profile"),
            leading: Icon(
              Icons.verified_user,
              color: Colors.green,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: firstNameController,
                  decoration: InputDecoration(labelText: 'First Name'),
                ),
                TextField(
                  controller: lastNameController,
                  decoration: InputDecoration(labelText: 'Second Candidate'),
                ),
                //  TextField(
                //  controller: votesController,
                // decoration: InputDecoration(labelText: 'votes'),
                //keyboardType: TextInputType.number,
                //),
                isloading
                    ? CircularProgressIndicator()
                    : FlatButton(
                        child: Text("Send"),
                        color: Colors.indigo,
                        onPressed: sendData,
                      ),
                Container(
                  child: Column(
                    children: userProfile
                        .map((ctx) => Profile(
                              firstName: ctx.firstName,
                              lastName: ctx.lastName,
                              votes: ctx.votes,
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void updateData(String firstName, String lastname, DatabaseReference ref) {
    ref.child('userprofile').update({
      Profile(
        firstName: firstName,
        lastName: lastname,
        votes: votes + 1,
      )
    });
  }
}
*/