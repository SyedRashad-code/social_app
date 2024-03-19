import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/add_post_screen.dart';
import 'package:flutter_application_2/screens/feed_screen.dart';
import 'package:flutter_application_2/screens/profile_screen.dart';
import 'package:flutter_application_2/screens/search_screen.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  const Text('notification'),
  ProfileScreen(uid: FirebaseAuth.instance.currentUser!.uid,)
];
// const homeScreenItems = [
//   //this is going to be a list of widgets
//   FeedScreen(),
//   SearchScreen(),
//   AddPostScreen(),
//   Text('favorite'),
//   ProfileScreen(uid: ),
// ];
