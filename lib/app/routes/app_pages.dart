import 'package:get/get.dart';
import 'package:quran_app/app/modules/home/bindings/detail_surah_binding.dart';
import 'package:quran_app/app/modules/home/views/detail_surah._view.dart';
import 'package:quran_app/app/modules/splash_screen/views/splash_screen.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SURAHDETAIL,
      page: () => DetailSurah(),
      binding: DetailSurahBinding(),
    ),
  ];
}
