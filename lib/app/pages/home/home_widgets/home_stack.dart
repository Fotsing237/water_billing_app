import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_billing_app/app/pages/surety/surety_controller.dart';
import 'package:water_billing_app/app/utils/components/app_colors.dart';

class HomeStack extends GetView<SuretyController> {
  final double width;

  const HomeStack({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuretyController suretyController = Get.put(SuretyController());

    return Container(
      height: 200,
      width: width,
      margin: const EdgeInsets.only(top: 15, left: 25, right: 25),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color(0xFFfcfffe),
        boxShadow: [
          BoxShadow(
              blurRadius: 20,
              spreadRadius: 1,
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 10))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Text(
              "Drilled Water Distributor",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: ColorsApp.skyBlue,
                decoration: TextDecoration.underline,
                decorationColor: ColorsApp.skyBlue,
                decorationThickness: 2.5),
            )
          ),
          controller.obx(
            (suretyController) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Fournisseur: ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Text('Prix Caution: ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("Prix Unitaire: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Text('Jours Limite: ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('${suretyController![0]['distributor']}',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple)),
                    Text('${suretyController[0]['amount']} XAF',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        )),
                    Text('${suretyController[0]['unitPrice']} XAF',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        )),
                    Text('${suretyController[0]['deadLine']} Jours',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        )),
                  ],
                ),
              ],
            ),
            onLoading: Center(child: CircularProgressIndicator(color: ColorsApp.lighterSkyBlue1, strokeWidth: 5.0,)),
            onEmpty: Center(
              child: Text(
                'No data found',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            onError: (error) => Center(
              child: Text(
                'Oups! something went wrong',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
