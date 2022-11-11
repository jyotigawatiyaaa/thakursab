import 'package:fdis_mobile/app/modules/audit_formulier/controllers/audits_formulier_controller.dart';
import 'package:get/get.dart';

class AuditFormulierBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuditFormulierController>(
      () => AuditFormulierController(),
    );
  }
}
