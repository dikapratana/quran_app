import 'package:get/get.dart';
import 'package:quran_app/app/data/providers/surat_provider.dart';

class DetailSurahController extends GetxController
    with StateMixin<Map<String, dynamic>> {
  late RxBool loading = true.obs;
  late RxMap data = {}.obs;
  late RxString error = ''.obs;

  Future<void> getDetailSurah() async {
    final args = Get.arguments;
    try {
      final res = await SuratProvider().getDetailSurat(args['nomor']);
      data(res!['data']);
    } catch (e) {
      error(e.toString());
    }
    loading(false);
  }

  @override
  void onInit() {
    getDetailSurah();
    super.onInit();
  }
}
