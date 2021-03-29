

import 'package:administration/Logics/Controller.dart';
import 'package:get/get.dart';

import 'User.dart';

Controller _controller=Get.put(Controller());
 getUserForDemandeList(String uid)async{
  _controller.userList.assignAll(_controller.myList
      .where((element) => element.id
      .toLowerCase()
      .contains(uid.toLowerCase()))
      .toList());
}
User  findUser(String uid)=> _controller.myList.firstWhere((list)=>list.id==uid);