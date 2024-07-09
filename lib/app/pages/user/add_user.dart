import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_billing_app/app/pages/user/user_controller.dart';
import 'package:water_billing_app/app/routes/app_routes.dart';
import 'package:water_billing_app/app/utils/components/app_colors.dart';
import 'package:water_billing_app/app/utils/components/image_picker_controller.dart';
import 'package:water_billing_app/app/utils/widgets/button.dart';

class AddUserScreen extends StatelessWidget {
  AddUserScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    ImagePickerController imagePickerController =
        Get.put(ImagePickerController());

    if (Get.arguments != null) {
      var user_id = Get.arguments['id'];
      userController.isEdit.value = !userController.isEdit.value;
      userController.firstNameController.text = Get.arguments['name'].toString().split(' ').first;
      userController.lastNameController.text = Get.arguments['name'].toString().split(' ').last;
      userController.emailController.text = Get.arguments['email'].toString();
      userController.phoneController.text = Get.arguments['phone'].toString();
      userController.idCardNumberController.text = Get.arguments['id_card_number'].toString();
    } else {
      userController.isEdit.value = false;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFc5e5f3),
        centerTitle: true,
        title: Text(
          userController.isEdit.value ? 'Edit User' : 'New User',
          style: TextStyle(
              color: ColorsApp.white,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Obx(
          () => Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                TextFormField(
                  validator: (value) {
                    if (GetUtils.isUsername(value!)) {
                      return null;
                    }
                    return 'Enter a valid name';
                  },
                  controller: userController.firstNameController,
                  enabled: userController.enabled.value,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    focusColor: ColorsApp.skyBlue,
                    labelStyle: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2.0,
                            color: ColorsApp.skyBlue,
                            style: BorderStyle.solid),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0))),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  validator: (value) {
                    if (GetUtils.isUsername(value!)) {
                      return null;
                    }
                    return 'Enter a valid name';
                  },
                  controller: userController.lastNameController,
                  enabled: userController.enabled.value,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    labelStyle: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2.0,
                            color: ColorsApp.skyBlue,
                            style: BorderStyle.solid),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0))),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  validator: (value) {
                    if (GetUtils.isEmail(value!)) {
                      return null;
                    }
                    return 'Enter valid email';
                  },
                  controller: userController.emailController,
                  enabled: userController.enabled.value,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2.0,
                            color: ColorsApp.skyBlue,
                            style: BorderStyle.solid),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0))),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  validator: (value) {
                    if (GetUtils.isPhoneNumber(value!)) {
                      return null;
                    }
                    return 'Enter a valid phone number';
                  },
                  controller: userController.phoneController,
                  enabled: userController.enabled.value,
                  decoration: InputDecoration(
                    labelText: 'Phone',
                    labelStyle: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2.0,
                            color: ColorsApp.skyBlue,
                            style: BorderStyle.solid),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0))),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  validator: (value) {
                    if (GetUtils.isNum(value!)) {
                      return null;
                    } else {
                      return 'Enter a valid card id number';
                    }
                  },
                  controller: userController.idCardNumberController,
                  enabled: userController.enabled.value,
                  decoration: InputDecoration(
                    labelText: 'Id Card',
                    labelStyle: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2.0,
                            color: ColorsApp.skyBlue,
                            style: BorderStyle.solid),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0))),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 200,
                  width: 200,
                  child: InkWell(
                    onTap: () => imagePickerController.pickedImage(),
                    child: DottedBorder(
                      padding: const EdgeInsets.all(12.0),
                      color: ColorsApp.skyBlue,
                      dashPattern: const [6, 3],
                      child: Center(
                        child: imagePickerController.image.value.path == ''
                            ? Icon(
                                Icons.person,
                                color: ColorsApp.skyBlue,
                                size: 200,
                              )
                            : Image.file(
                                imagePickerController.image.value,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Button(
                  bold: true,
                  state: userController.btnState.value,
                  title: userController.isEdit.value ? 'UPDATE' : 'SUBMIT',
                  width: 100.0,
                  height: 70.0,
                  margin: 0.0,
                  padding: 10.0,
                  itemColor: ColorsApp.skyBlue,
                  textColor: ColorsApp.white,
                  loaderColor: ColorsApp.skyBlue,
                  borderColor: ColorsApp.skyBlue,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      userController.btnState.value = !userController.btnState.value;
                      userController.enabled.value = !userController.enabled.value;

                      userController.isEdit.value ? userController.editUser(Get.arguments['id']).then((value) => {
                        userController.btnState.value = !userController.btnState.value,
                        userController.enabled.value = !userController.enabled.value,
                        Get.offAllNamed(AppRoutes.home)
                      }) : userController.addNewUser().then((value) => {
                        userController.btnState.value = !userController.btnState.value,
                        userController.enabled.value = !userController.enabled.value,
                        Get.offAllNamed(AppRoutes.home)
                      });
                    }
                  },
                ),
                const SizedBox(
                  height: 25,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
