import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  //properties
  final String descripton;
  final String uid;
  final String username;
  final String postId;
  final  datePublished;
  final String postUrl;
  final String profImage;
  final likes;

  const Post(
      { //constructior
      required this.descripton,
      required this.uid,
      required this.username,
      required this.postId,
      required this.datePublished,
      required this.postUrl,
      required this.profImage,
      required this.likes,
      });

  //function that we can use on user - its very accessible for us while using firebase - creating two json method {convert user/object we require(constrictor) here to an object}
  Map<String, dynamic> toJson() => {
        "descripton": descripton,
        "uid": uid,
        "username": username,
        "postId": postId,
        "datePublished": datePublished,
        "postUrl": postUrl,
        "profImage": profImage,
        "likes": likes,
      };

  //this will take in a document snapshot & return a user model
  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      username: snapshot['username'],
      uid: snapshot['uid'],
      descripton: snapshot['descripton'],
      postId: snapshot['postId'],
      datePublished: snapshot['datePublished'],
      profImage: snapshot['profImage'],
      likes: snapshot['likes'],
      postUrl: snapshot['postUrl']
    );
  }
}
