import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_billing_app/app/data/service/services.dart';

class UserController extends GetxController with StateMixin<List> {
  HttpService httpService = HttpService();
  RxList userList = RxList();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController idCardNumberController = TextEditingController();

  var isEdit = false.obs;
  var btnState = false.obs;
  var enabled = true.obs;

  @override
  void onInit() {
    super.onInit();
    getUsers();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getUsers() async {
    try {
      const myUrl = "/Users";
      var users =
          await httpService.request(method: RequestMethod.get, url: myUrl);
      userList.clear();
      for (var user in users) {
        userList.add(user);
      }

      // no records
      if (userList.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        // success
        print('users ===================================> ${userList}');
        change(userList, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
      throw Exception(e.toString());
    }
  }

  Future<void> addNewUser() async {
    var newUser = {
      'name': '${firstNameController.text} ${lastNameController.text}',
      'email': emailController.text,
      'phone': phoneController.text,
      'id_card_number': idCardNumberController.text,
      'created_at': DateTime.now().toIso8601String(),
      'roles_id': '2'
    };
    try {
      var myUrl = "/Users";
      var response = await httpService.request(
          method: RequestMethod.post, url: myUrl, body: newUser);
      if (response != null) {
        firstNameController.clear();
        lastNameController.clear();
        emailController.clear();
        phoneController.clear();
        idCardNumberController.clear();
        getUsers();
        print('---------------------------------->');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> editUser(String id) async {
    var modifiedUser = {
      'name': '${firstNameController.text} ${lastNameController.text}',
      'email': emailController.text,
      'phone': phoneController.text,
      'id_card_number': idCardNumberController.text,
      'created_at': DateTime.now().toIso8601String(),
      'roles_id': '2'
    };
    try {
      var myUrl = "/Users/$id";
      var response = await httpService.request(
          method: RequestMethod.put, url: myUrl, body: modifiedUser);
      if (response != null) {
        firstNameController.clear();
        lastNameController.clear();
        emailController.clear();
        phoneController.clear();
        idCardNumberController.clear();
        getUsers();
        print('---------------------------------->');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> deleteItem(String id) async {
    final myUrl = '/Users/$id';
    final response =
        await httpService.request(method: RequestMethod.delete, url: myUrl);

    if (response != null) {
      final filtered =
          userList.where((element) => element['id'] != id).toList();
      userList.clear();
      for (var user in filtered) {
        userList.add(user);
      }
      // success
      print(
          'users after deletion ===================================> ${userList.length}');
      getUsers();
    } else {}
  }
}
