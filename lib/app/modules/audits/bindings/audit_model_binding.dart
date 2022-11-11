import 'package:fdis_mobile/app/modules/audits/controllers/audit_model_controller.dart';
import 'package:get/get.dart';

class AuditModelBinding extends Bindings {
  void dependencies() {
    Get.lazyPut<AuditModelController>(
      () => AuditModelController(),
    );
  }
}
