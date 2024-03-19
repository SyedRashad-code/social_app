// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class HomeProvider {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> updateFirestoreData(
//    String collectionPath, String path, Map<String, dynamic> updateData) {
//  return _firestore
//      .collection(collectionPath)
//      .doc(path)
//      .update(updateData);
// }

// Stream<QuerySnapshot> getFirestoreData(
//    String collectionPath, int limit, String? textSearch) {
//  if (textSearch?.isNotEmpty == true) {
//    return _firestore
//        .collection(collectionPath)
//        .limit(limit)
//        .where('uid', isEqualTo: textSearch)
//        .snapshots();
//  } else {
//    return _firestore
//        .collection(collectionPath)
//        .limit(limit)
//        .snapshots();
//  }
// }
// }

