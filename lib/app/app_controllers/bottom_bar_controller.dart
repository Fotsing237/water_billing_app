import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarController extends GetxController {
  var currentIndex = 0.obs;
  var currentColor = Colors.black.obs;

  void changeIndex(int index, Color myColor) {
    currentIndex.value = index;
    currentColor.value = myColor;
  }
}
