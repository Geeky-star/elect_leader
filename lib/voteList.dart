import 'package:flutter/material.dart';

import 'vote.dart';

class PostList extends StatefulWidget {
  final List<Candidate> listItems;

  PostList(this.listItems);
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  void like(Function callBack) {
    this.setState(() {
      callBack();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.widget.listItems.length,
      itemBuilder: (context, index) {
        var candidate = this.widget.listItems[index];

        return Card(
          child: Row(
            children: [
              Expanded(child: ListTile(title: Text(candidate.firstName),),)
           ,Row(
            children: [
              Container(
                child: Text(candidate.votes.toString()),
              ),
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () => this.like(() => candidate.likeVotes()),
              )
            ],
          ),
            ],
            
          
          )
        );
      },
    );
  }
}
