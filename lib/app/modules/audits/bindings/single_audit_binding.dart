import 'package:fdis_mobile/app/modules/audits/controllers/single_audit_controller.dart';
import 'package:get/get.dart';

class SingleAuditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SingleAuditController>(
      () => SingleAuditController(),
    );
  }
}
