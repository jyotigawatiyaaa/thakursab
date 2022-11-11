// import 'package:flutter_application_1/components/error_helper.dart';
// import 'package:flutter_application_1/services/Exception/exception_handling.dart';
import 'package:fdis_mobile/app/component/error_helper.dart';
import 'package:fdis_mobile/app/exception/exception_handling.dart';
import 'package:get/get.dart';

class BaseController {
  void handleError(error) {
    Get.back();
    if (error is BadRequestException) {
      ErrorHelper.showErrorDialog(title: error.prefix, message: error.message);
    } else if (error is FetchDataException) {
      ErrorHelper.showErrorDialog(title: error.prefix, message: error.message);
    } else if (error is FetchDataException) {
      ErrorHelper.showErrorDialog(title: error.prefix, message: error.message);
    } else if (error is FetchDataException) {
      ErrorHelper.showErrorDialog(title: error.prefix, message: error.message);
    } else {
      ErrorHelper.showErrorDialog(
          title: "Error", message: "Some Thing Went Wrong");
    }
  }
}
