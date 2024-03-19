import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/chat_screen.dart';
import 'package:flutter_application_2/utils/colors.dart';
import 'package:flutter_application_2/widgets/post_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //this is the top bar that holds the logo image and message Icon button
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        centerTitle: false,
        title: SvgPicture.asset(
          'assets/ic_segi.svg',
          color: primaryColor,
          height: 32,
        ),
        actions: [
          //chat 
          IconButton(
            icon: const Icon(
              Icons.messenger_outline,
            ),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => /* ProfileScreen(uid: FirebaseAuth.instance.currentUser!.uid,)*/ ChatScreen(),),),
          ),
        ],
      ),
      //this is the body that will hold the post (like, comment, share)
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => PostCard(
              snap: snapshot.data!.docs[index].data(),
            ),
          );
        },
      ),
    );
  }
}
