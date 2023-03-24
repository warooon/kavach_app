import 'package:get/get.dart';

import '../controllers/show_officer_controller.dart';

class ShowOfficerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowOfficerController>(
      () => ShowOfficerController(),
    );
  }
}
