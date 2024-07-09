import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_billing_app/app/pages/user/user_controller.dart';
import 'package:water_billing_app/app/routes/app_routes.dart';
import 'package:water_billing_app/app/utils/components/app_colors.dart';

class UsersCard extends GetView<UserController> {
  final double width;
  const UsersCard({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());

    return controller.obx(
      (state) => ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: state!.length,
          itemBuilder: (context, index) {
            return Card(
                margin: const EdgeInsets.only(
                    top: 5, left: 25, bottom: 10, right: 25),
                color: ColorsApp.grey,
                elevation: 10,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: ColorsApp.skyBlue,
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                          color: ColorsApp.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${state[index]['name']}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${state[index]['phone']}',
                        style: TextStyle(fontSize: 15, color: ColorsApp.indigo),
                      )
                    ],
                  ),
                  trailing: PopupMenuButton(
                    color: ColorsApp.skyBlue,
                    position: PopupMenuPosition.over,
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Get.toNamed(AppRoutes.addUsers,
                                      arguments: state[index]);
                                },
                                icon: const Icon(Icons.edit),
                                color: Colors.white,
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  userController.deleteItem(state[index]['id']);
                                },
                                icon: const Icon(Icons.delete),
                                color: Colors.red,
                              )
                            ],
                          ),
                        )
                      ];
                    },
                  ),
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.userDetails, 
                      arguments: state[index]
                    );
                  },
                ));
          }),
      onLoading: Center(
          child: CircularProgressIndicator(
        color: ColorsApp.lighterSkyBlue1,
        strokeWidth: 5.0,
      )),
      onEmpty: Center(
        child: Text(
          'No data found',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      onError: (error) => Center(
        child: Text(
          'Oups! something went wrong',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
