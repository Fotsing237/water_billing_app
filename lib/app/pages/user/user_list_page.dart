import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_billing_app/app/routes/app_routes.dart';
import 'package:water_billing_app/app/utils/components/app_colors.dart';
import 'package:water_billing_app/app/utils/widgets/users_card.dart';

class UsersListPage extends StatelessWidget {
  const UsersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFc5e5f3),
        title: const Center(
          child: Text(
            'All Users',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
          child: UsersCard(
        width: MediaQuery.of(context).size.width,
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addUsers);
        },
        splashColor: ColorsApp.white.withOpacity(0.5),
        backgroundColor: ColorsApp.skyBlue,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Center(
            child: Icon(
          Icons.add,
          color: ColorsApp.white,
          size: 50,
        )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
