import 'package:administration/Logics/Controller.dart';
import 'package:administration/Logics/FilterFunctions.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

Controller _controller = Get.put(Controller());

bool compareDate(DateTime now, List myList) {
  String formatedDate = DateFormat("yyyy/MM/dd").format(now);
  bool test = myList.any(
      (element) => DateFormat("yyyy/MM/dd").format(element) == formatedDate);
  print(test);
  return test;
}

filterBythisDay() {
  List numberDays = [];
  List finalList = [];
  for (int i = 0; i < _controller.demandes.length; i++) {
    numberDays.addAll(listOfDays(_controller.demandes[i].desLe.toDate(),
        _controller.demandes[i].jusqua.toDate()));
    bool testIfTrue = compareDate(DateTime.now(), numberDays);
    finalList.addIf(testIfTrue == true, _controller.demandes[i].destination);
  }
  print(finalList);
}

test1() {
  for (int i = 0; i < 3;) {
    var test = listOfDays(_controller.demandes[i].desLe.toDate(),
        _controller.demandes[i].jusqua.toDate());

    print(test);
    i++;
  }
}
