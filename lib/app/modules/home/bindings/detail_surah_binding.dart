import 'package:get/get.dart';
import 'package:quran_app/app/modules/home/controllers/detail_surah_controller.dart';

class DetailSurahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailSurahController());
  }
}
