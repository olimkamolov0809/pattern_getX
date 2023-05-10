import 'package:get/get.dart';
import 'package:pattern_getx/controllers/main_controller.dart';

class BindService implements Bindings {

  @override
  void dependencies() {
    Get.put<MainController>(MainController());
  }
}