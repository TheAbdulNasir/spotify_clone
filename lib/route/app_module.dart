import 'package:spotifyclone/binding/home_binding.dart';
import 'package:spotifyclone/page/ui/home_page.dart';

import '../binding/login_binding.dart';
import '../binding/splash_binding.dart';
import '../page/ui/login_page.dart';
import '../page/ui/splash_page.dart';
import 'route.dart';
import 'package:get/route_manager.dart';

class AppPage {
  AppPage._();
  static final routes = [
    GetPage(
        name: AppRoute.splash,
        page: () =>  const SplashPage(),
        binding: SplashBinding()),
    GetPage(
      name: AppRoute.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoute.home,
      page: () =>  const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}