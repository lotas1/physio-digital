import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:physio_digital/controllers/about_page_controller.dart';

class AboutPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutPageController>(() => AboutPageController());
  }
}
