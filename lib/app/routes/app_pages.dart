import 'package:fdis_mobile/app/modules/audit_formulier/bindings/audit_formulier_binding.dart';
import 'package:fdis_mobile/app/modules/audit_formulier/views/audit_formulier_view.dart';
import 'package:fdis_mobile/app/modules/audits/bindings/audit_model_binding.dart';
import 'package:fdis_mobile/app/modules/audits/bindings/single_audit_binding.dart';
import 'package:fdis_mobile/app/modules/audits/views/audit_list_view.dart';
import 'package:fdis_mobile/app/modules/audits/views/single_audit_form.dart';
import 'package:fdis_mobile/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:fdis_mobile/app/modules/dashboard/views/dashboard_view.dart';
import 'package:fdis_mobile/app/modules/formulier/bindings/formulier_view_binding.dart';
import 'package:fdis_mobile/app/modules/formulier/views/formulier_detail_view.dart';
import 'package:fdis_mobile/app/modules/formulier/views/formulier_view.dart';
import 'package:fdis_mobile/app/modules/login/bindings/login_binding.dart';
import 'package:fdis_mobile/app/modules/login/views/login_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.kLogin;

  static final routes = [
    GetPage(
      name: _Paths.kAuditFormulierer,
      page: () => AuditFormulierView(),
      binding: AuditFormulierBinding(),
    ),
    GetPage(
      name: _Paths.kLOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    // GetPage(name: _Paths.kResetPassword, page: () => ResetPassword()),
    GetPage(
      name: _Paths.kDashboard,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.kAuditListView,
      page: () => const AuditsListView(),
      binding: AuditModelBinding(),
    ),
    GetPage(
      name: _Paths.kAuditSingleForm,
      page: () => SingleAuditForm(),
      binding: SingleAuditBinding(),
    ),
    GetPage(
      name: _Paths.kFormulierView,
      page: () => FormulierView(),
      binding: FormulierViewBinding(),
    ),
    GetPage(
      name: _Paths.kFormulierDetailView,
      page: () => FormulierDetailView(),
      binding: FormulierViewBinding(),
    ),
  ];
}
