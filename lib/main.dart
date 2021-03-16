import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Screens/myApp.dart';


main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    theme: ThemeData(
        primaryColor: Colors.blue, secondaryHeaderColor: Colors.blueAccent),
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}
