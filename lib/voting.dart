import 'package:backendapp/database.dart';
import 'package:backendapp/textInput.dart';
import 'package:backendapp/voteList.dart';
import 'package:flutter/material.dart';
import 'vote.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Candidate> candidates = [];

  void newCandidate(String text) {
    var candidate = new Candidate(text, 0);
    candidate.setId(savePost(candidate));
    this.setState(() {
      candidates.add(candidate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("election voting",),centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: PostList(this.candidates),
          ),
          TextInputWidget(this.newCandidate)
        ],
      ),
    );
  }
}
