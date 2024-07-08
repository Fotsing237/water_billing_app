import 'package:get/get.dart';
import 'package:water_billing_app/app/data/service/services.dart';

class SuretyController extends GetxController with StateMixin<List> {
  HttpService httpService = HttpService();
  RxList suretyList = RxList();

  @override
  void onInit() {
    super.onInit();
    getSurety();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getSurety() async {
    try {
      const myUrl = "/sureties";
      var sureties =
          await httpService.request(method: RequestMethod.get, url: myUrl);
      for (var surety in sureties) {
        suretyList.add(surety);
      }

      // no records
      if (suretyList.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        // success
        change(suretyList, status: RxStatus.success());
      }

      print('sureties ===================================> $suretyList');
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
      throw Exception(e.toString());
    }
  }
}
