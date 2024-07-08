import 'package:get/get.dart';
import 'package:water_billing_app/app/pages/surety/surety_controller.dart';
import 'package:water_billing_app/app/pages/user/user_controller.dart';

class HomeController extends GetxController with StateMixin<List> {
  SuretyController suretyController = Get.put(SuretyController());
  UserController userController = Get.put(UserController());
  @override
  void onInit() {
    super.onInit();
    suretyController.getSurety();
    userController.getUsers();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
