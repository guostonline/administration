import 'package:administration/Logics/Controller.dart';
import 'package:administration/Logics/Demande.dart';
import 'package:administration/Logics/GetDateFireBase.dart';
import 'package:administration/Logics/User.dart';
import 'package:administration/Screens/AddDemand.dart';
import 'package:administration/Widgets/InformationWidget/ClientInformations.dart';
import 'package:administration/Widgets/DemandesWidgets/DemandeCard.dart';
import 'package:administration/Widgets/LesClientsWidgets.dart';
import 'package:administration/Widgets/SingleWidgets/HeaderWidgets.dart';
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
      _controller.demandes
          .sort((a, b) => a.dateDeComande.compareTo(b.dateDeComande));
      _controller.demandesFiltrie.assignAll(alldemandes);
      _controller.demandesFiltrie
          .sort((a, b) => b.dateDeComande.compareTo(a.dateDeComande));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
              child: Text(
                "Clients",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => Get.to(ClientsWidget())),
          MaterialButton(
              child: Text(
                "Demandes",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => Get.to(MyApp()))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidgets(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  DemandeCard(),
                  DemandInformations(),
                ],
              ),
              SizedBox(height: 50),
              // ClientsWidget()
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
