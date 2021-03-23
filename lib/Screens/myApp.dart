import 'package:administration/Logics/Demande.dart';
import 'package:administration/Logics/GetDateFireBase.dart';
import 'package:administration/Logics/User.dart';
import 'package:administration/Widgets/ClientInformations.dart';
import 'package:administration/Widgets/LesClientsWidgets.dart';
import 'package:administration/Widgets/LesDemandesWidgtes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<User> users;
  List<Demande> demandes;
  @override
  void initState() {
    super.initState();

    getUserList().listen((QuerySnapshot snapshot) {
      final List<User> allusers =
          snapshot.docs.map((e) => User.fromMap(e.data())).toList();

      setState(() {
        this.users = allusers;
      });
    });

    getDemandesList().listen((QuerySnapshot snapshot) {
      final List<Demande> alldemandes =
          snapshot.docs.map((e) => Demande.fromMap(e.data())).toList();

      setState(() {
        this.demandes = alldemandes;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  DomandeWidget(
                    demandesList: demandes,
                  ),
                  ClientsWidget(
                    clientsList: users,
                  ),
                ],
              ),
              ClientInformations(),
            ],
          ),
        ),
      ),
    );
  }
}
