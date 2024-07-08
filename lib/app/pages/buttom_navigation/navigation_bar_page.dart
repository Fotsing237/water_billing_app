// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_billing_app/app/app_controllers/bottom_navigation_controller.dart';
import 'package:water_billing_app/app/pages/biil/bill_page.dart';
import 'package:water_billing_app/app/pages/home/home_screen.dart';
import 'package:water_billing_app/app/utils/components/app_colors.dart';

class BottomNavigationBarPage extends StatelessWidget {
  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  BottomNavigationBarPage({super.key});

  final screens = [HomeScreen(), BillPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: bottomNavigationController.selectedIndex.value,
          children: screens,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ColorsApp.skyBlue.withOpacity(0.5),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 50,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 196, 241, 253),
        selectedItemColor:  Colors.deepPurple,
        unselectedItemColor:  Colors.grey[600],
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: bottomNavigationController.selectedIndex.value,
        onTap: (index) {
          bottomNavigationController.changeIndex(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Bills')
        ],
      ),
    );
  }
}
