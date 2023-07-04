import 'package:get/get.dart';
import 'package:quran_app/app/data/providers/surat_provider.dart';

class HomeController extends GetxController with StateMixin<List<dynamic>> {
  @override
  void onInit() {
    super.onInit();
    getAllSurah();
  }

  Future<void> getAllSurah() async {
    try {
      final res = await SuratProvider().getSurat();
      change(res!['data'], status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }
}
