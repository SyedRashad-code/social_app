import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

class MessageChat {
  final String uidFrom;
  final String uidTo;
  final String timestamp;
  final String content;
  final int type;

  const MessageChat({
    required this.uidFrom,
    required this.uidTo,
    required this.timestamp,
    required this.content,
    required this.type,
  });

  Map<String, dynamic> toJson() => {
        "uidFrom": uidFrom,
        "uidTo": uidTo,
        "timestamp": timestamp,
        "content": content,
        "type": type,
      };

  static MessageChat fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return MessageChat(
        uidFrom: snapshot['uidFrom'],
        uidTo: snapshot['uidTo'],
        timestamp: snapshot['timestamp'],
        content: snapshot['content'],
        type: snapshot['type'],);
  }
}
