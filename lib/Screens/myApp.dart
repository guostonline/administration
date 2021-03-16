import 'dart:async';

import 'package:administration/Logics/GetDateFireBase.dart';
import 'package:administration/Logics/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<User> users;
  StreamSubscription<QuerySnapshot> allUsers;
  @override
  void initState() {
    super.initState();
    allUsers?.cancel();
    allUsers = getUserList().listen((QuerySnapshot snapshot) {
      final List<User> allusers =
          snapshot.docs.map((e) => User.fromMap(e.data())).toList();
      setState(() {
        this.users = allusers;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
            width: 600,
            height: 500,
            child: Column(
              children: [
                Container(
                  color: Colors.red.shade200,
                  child: Text("Mes Clients"),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 5)),
                  child: ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(users[index].name),
                        );
                      }),
                ),
              ],
            )),
      ],
    ));
  }
}
