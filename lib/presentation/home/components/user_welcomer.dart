import 'package:bit_connect/searvices/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserWelcomer extends StatefulWidget {
  const UserWelcomer({super.key});

  @override
  State<UserWelcomer> createState() => _UserWelcomerState();
}

class _UserWelcomerState extends State<UserWelcomer> {
  final _currentUser = FirebaseAuth.instance.currentUser;

  Future<Map<String, dynamic>?> getUserData() async {
    try {
      final response = await FirebaseFirestore.instance
          .collection("users")
          .doc(_currentUser!.uid)
          .get();
      if (response.exists) {
        final data = response.data();
        return data;
      } else {
        return {
          "fName":
              _currentUser!.email!.split('@')[0].split(RegExp(r'[a-z]{3}'))[1],
          "ppUrl": "",
        };
      }
    } catch (error) {
      return {
        "fName":
            _currentUser!.email!.split('@')[0].split(RegExp(r'[a-z]{3}'))[1],
        "ppUrl": "",
      };
    }
  }

  Widget getPP(String ppUrl) {
    return Container(
      width: 60,
      height: 60,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: Center(
        child: ppUrl == ""
            ? Text(
                _currentUser!.email!
                    .split('@')[0]
                    .split(RegExp(r'[a-z]{3}'))[1]
                    .substring(3),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              )
            : ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                child: Image(
                  image: NetworkImage(ppUrl),
                  fit: BoxFit.cover,
                  height: 60,
                  width: 60,
                ),
              ),
      ),
    );
  }

  Widget getAppBar(Map<String, dynamic>? data) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: getWidth(context),
      child: Row(
        children: [
          getPP(data == null ? "" : data['ppUrl']),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, ${data == null ? _currentUser!.email!.split('@')[0].split(RegExp(r'[a-z]{3}'))[1] : data['fName']}',
                // 'Hi, 1308736',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                "What do you want to explore?",
                style: TextStyle(fontSize: 15),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // return getAppBar(null);
    return FutureBuilder(
      future: getUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return getAppBar(null);
        } else if (snapshot.hasData || snapshot.hasError) {
          final data = snapshot.requireData;
          return getAppBar(data);
        }
        return const Center();
      },
    );
  }
}