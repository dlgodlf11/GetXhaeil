import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class testController extends GetxController {
  RxInt counter = 0.obs;
  RxList<String> todo = new RxList<String>([]);
  incrementCounter() {
    Get.changeTheme(ThemeData.light());
    counter++;
  }

  decrementCounter() {
    Get.changeTheme(ThemeData.dark());

    counter--;
  }

  addTodo(String todoString) {
    todo.add(todoString);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    interval(counter, (_) {
      print("asdf");
    }, time: Duration(seconds: 1));
    print("초기화:${counter}");
    super.onInit();
  }
}
