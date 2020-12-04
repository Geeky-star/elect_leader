import 'package:backendapp/database.dart';
import 'package:firebase_database/firebase_database.dart';

class Candidate {
  String firstName;
  int votes = 0;
  DatabaseReference _id;

  Candidate(this.firstName, this.votes);

  void likeVotes() {
    this.votes = this.votes + 1;
    this.update();
  }

  void update() {
    updatePost(this, this._id);
  }

  void setId(DatabaseReference id) {
    this._id = id;
  }

  Map<String, dynamic> toJson() {
    return {'firstName': this.firstName, 'votes': this.votes};
  }
}

Candidate createCandidate(record) {
  Map<String, dynamic> attributes = {
    'author': '',
    'usersLiked': [],
    'body': ''
  };

  record.forEach((key, value) => {attributes[key] = value});

  Candidate candidate =
      new Candidate(attributes['firstName'], attributes['votes']);
  return candidate;
}
