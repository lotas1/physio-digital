import 'package:get/get.dart';
import 'package:physio_digital/view/clinics/listclinic/list_clinic_controller.dart';
import 'package:physio_digital/repository/clinic_repository.dart';

class ClinicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClinicRepository>(() => ClinicRepositoryImpl());
    Get.lazyPut<ListClinicController>(() => ListClinicController(Get.find()));
  }
} 