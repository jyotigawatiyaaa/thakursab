import 'package:get/get.dart';

class AuditFormulierController extends GetxController {


  final count = 0.obs;



  @override
  void onClose() {}
  void increment() => count.value++;
}
