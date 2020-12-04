import 'package:backendapp/vote.dart';
import 'package:firebase_database/firebase_database.dart';
import 'vote.dart';

final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference savePost(Candidate post) {
  var id = databaseReference.child('candidates/').push();
  id.set(post.toJson());
  return id;
}

void updatePost(Candidate candidate, DatabaseReference id) {
  id.update(candidate.toJson());
}

Future<List<Candidate>> getAllPosts() async {
  DataSnapshot dataSnapshot = await databaseReference.child('candidates/').once();
  List<Candidate> posts = [];
  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      Candidate post = createCandidate(value);
      post.setId(databaseReference.child('candidates/' + key));
      posts.add(post);
    });
  }
  return posts;
}