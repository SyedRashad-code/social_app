import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/profile_screen.dart';
import 'package:flutter_application_2/utils/colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController searchController = TextEditingController();

  bool isShowUsers = false;

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Chats'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Title(
              color: mobileBackgroundColor,
              child: TextFormField(
                controller: searchController,
                decoration: const InputDecoration(labelText: 'Search user'),
                onFieldSubmitted: (String _) {
                  setState(() {
                    isShowUsers = true;
                  });
                },
              ),
            ),
          ),
          //divider & list of contacts
          // const Divider(),
         isShowUsers
              ? FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('users')
                      .where(
                        'username',
                        isGreaterThanOrEqualTo: searchController,
                      )
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                        itemCount: (snapshot.data! as dynamic).docs.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ProfileScreen(
                                  uid: (snapshot.data! as dynamic).docs[index]['uid'],
                                ),
                              ),
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  (snapshot.data! as dynamic).docs[index]['photoUrl'],
                                ),
                              ),
                              title: Text(
                                (snapshot.data! as dynamic).docs[index]['username'],
                              ),
                            ),
                          );
                        });
                  })
              : FutureBuilder(
                  future: FirebaseFirestore.instance.collection('users').get(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                        itemCount: (snapshot.data! as dynamic).docs.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                          );
                        });
                  })
        ],
      ),
    );
  }
}
