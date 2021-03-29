

import 'package:administration/Logics/Controller.dart';
import 'package:get/get.dart';

import 'User.dart';

Controller _controller=Get.put(Controller());

User  findUser(String uid)=> _controller.myList.firstWhere((list)=>list.id==uid);