import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_billing_app/app/pages/home/home_widgets/home_stack.dart';
import 'package:water_billing_app/app/routes/app_routes.dart';
import 'package:water_billing_app/app/utils/components/app_colors.dart';
import 'package:water_billing_app/app/utils/widgets/users_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              ColorsApp.lighterSkyBlue1,
              ColorsApp.lightGrey.withOpacity(0.2)
            ],
                stops: const [
              0.30,
              0.30
            ])),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                width: width,
                height: 80,
                child: Container(
                  width: width,
                  height: 80,
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.only(top: 10, left: 25, right: 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: ColorsApp.lighterSkyBlue2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        size: 45,
                        Icons.water_drop,
                        color: ColorsApp.skyBlue,
                      ),
                      Text(
                        'DRILLED WATER BILLING',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: ColorsApp.skyBlue,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                width: width,
                child: HomeStack(
                  width: width,
                ),
              ),
              Container(
                width: width,
                margin: const EdgeInsets.only(
                    top: 20, left: 25, bottom: 15, right: 25),
                color: ColorsApp.transparent,
                child: InkWell(
                  splashColor: ColorsApp.indigo.withOpacity(0.2),
                  onTap: () {
                    Get.toNamed(AppRoutes.users);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Connected Clients',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: ColorsApp.skyBlue,
                            decorationThickness: 2.0),
                      ),
                      Row(
                        children: [
                          Text(
                            'Show all',
                            style: TextStyle(
                              color: ColorsApp.skyBlue,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 25,
                            color: ColorsApp.skyBlue,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: UsersCard(
                        width: width,
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
