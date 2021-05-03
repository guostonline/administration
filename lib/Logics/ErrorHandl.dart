import 'package:administration/Logics/Controller.dart';
import 'package:get/get.dart';

Controller _controller = Get.find();

bool allFieldsAreComplete() {
  if (_controller.addLocalite.isEmpty ||
      _controller.addDestination.isEmpty ||
      _controller.addDateDesLe.isEmpty ||
      _controller.addDateJusqua.isEmpty ||
      _controller.addUserEmail.isEmpty) {
    return false;
  }
  return true;
}
