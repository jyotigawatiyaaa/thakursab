import 'package:fdis_mobile/app/modules/formulier/controller/formulier_view_controller.dart';
import 'package:get/get.dart';

class FormulierViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormulierViewController>(
      () => FormulierViewController(),
    );
  }
}
