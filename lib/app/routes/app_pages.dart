import 'package:get/get.dart';
import 'package:bar2bar_admin_app/app/modules/auth/views/login_view.dart';
import 'package:bar2bar_admin_app/app/modules/auth/views/otp_view.dart';
import 'package:bar2bar_admin_app/app/modules/dashboard/views/dashboard_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
    ),
    GetPage(
      name: Routes.OTP,
      page: () => const OtpView(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const DashboardView(),
    ),
  ];
} 