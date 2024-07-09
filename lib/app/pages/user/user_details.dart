import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_billing_app/app/app_controllers/bottom_bar_controller.dart';
import 'package:water_billing_app/app/pages/biil/bill_screen.dart';
import 'package:water_billing_app/app/pages/receipt/receipt_screen.dart';
import 'package:water_billing_app/app/utils/components/app_colors.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class UserDetailsScreen extends StatelessWidget {
  UserDetailsScreen({super.key});
  BottomBarController bottomBarController = Get.put(BottomBarController());

  final screens = [const BillScreen(), const ReceiptScreen()];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.skyBlue2,
        centerTitle: true,
        title: const Center(
          child: Text(
            'All User Bills',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            Card(
              margin: const EdgeInsets.only(bottom: 20.0),
              color: ColorsApp.lightSkyBlue,
              elevation: 20,
              child: Column(
                children: [
                  Center(
                      child: Text(
                    Get.arguments['name'].toString().toUpperCase(),
                    style: TextStyle(
                        fontSize: width / 15,
                        color: ColorsApp.skyBlue,
                        fontWeight: FontWeight.bold),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        size: 140,
                        color: ColorsApp.skyBlue,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            Get.arguments['email'],
                            style: TextStyle(
                                fontSize: width / 20,
                                fontWeight: FontWeight.bold,
                                color: ColorsApp.skyBlue),
                          ),
                          Text(
                            Get.arguments['id_card_number'],
                            style: TextStyle(
                                fontSize: width / 20,
                                fontWeight: FontWeight.bold,
                                color: ColorsApp.skyBlue),
                          ),
                          Text(
                            Get.arguments['phone'],
                            style: TextStyle(
                                fontSize: width / 20,
                                fontWeight: FontWeight.bold,
                                color: ColorsApp.skyBlue),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Text(
                      '${Get.arguments['created_at'].toString().split('T').first} at ${Get.arguments['created_at'].toString().split('T').last.split('.').first}',
                      style: TextStyle(
                          fontSize: width / 20,
                          fontWeight: FontWeight.bold,
                          color: ColorsApp.skyBlue),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => IndexedStack(
                index: bottomBarController.currentIndex.value,
                children: screens,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ColorsApp.skyBlue2,
        splashColor: ColorsApp.skyBlue,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Icon(
          Icons.add,
          color: ColorsApp.white,
          size: 50.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        elevation: 0,
        color: ColorsApp.skyBlue2,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                bottomBarItem(context,
                    icon: Icons.receipt_long,
                    page: 0,
                    label: 'Bills',
                    color: ColorsApp.indigo),
                bottomBarItem(context,
                    icon: Icons.receipt,
                    page: 1,
                    label: 'Receipts',
                    color: ColorsApp.indigo),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomBarItem(BuildContext context,
      {required icon,
      required page,
      required label,
      required color}) {
    return ZoomTapAnimation(
      onTap: () {
        
      bool billState = false;
      bool receiptState = false;
        bottomBarController.changeIndex(page, color);
        if (label.toString().contains('Bills')) {
          billState = true;
          print('bill state---------------->$billState');
        } else {
          receiptState = true;
          print('receipt state---------------->$receiptState');
        }
      },
      child: Container(
        color: ColorsApp.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: bottomBarController.currentIndex == page
                  ? color
                  : ColorsApp.black,
            ),
            Text(
              label,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: bottomBarController.currentIndex == page
                      ? color
                      : ColorsApp.black),
            )
          ],
        ),
      ),
    );
  }
}
