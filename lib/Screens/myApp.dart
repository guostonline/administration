import 'dart:ui';

import 'package:administration/Logics/Controller.dart';
import 'package:administration/Logics/Demande.dart';
import 'package:administration/Logics/GetDateFireBase.dart';
import 'package:administration/Logics/User.dart';
import 'package:administration/Screens/AddDemand.dart';
import 'package:administration/Widgets/ClientInformations.dart';
import 'package:administration/Widgets/DemandeCard.dart';
import 'package:administration/Widgets/LesClientsWidgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

Controller _controller = Get.put(Controller());

class _MyAppState extends State<MyApp> {
  List<User> users;
  List<Demande> demandes;
  @override
  void initState() {
    super.initState();

    getUserList().listen((QuerySnapshot snapshot) {
      final List<User> allusers =
          snapshot.docs.map((e) => User.fromMap(e.data())).toList();
      _controller.myList.assignAll(allusers);
      _controller.simpleList.assignAll(allusers);
    });

    getDemandesList().listen((QuerySnapshot snapshot) {
      final List<Demande> alldemandes =
          snapshot.docs.map((e) => Demande.fromMap(e.data())).toList();
      _controller.demandes.assignAll(alldemandes);
      _controller.demandesFiltrie.assignAll(alldemandes);
    });
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size;
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
                 
                  DemandeCard(),
                   DemandInformations(),
                ],
              ),
              SizedBox(height: 50),
              ClientsWidget()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddDemand());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
