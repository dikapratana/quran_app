import 'package:get/get.dart';

import '../models/surat_model.dart';

class SuratProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Surat.fromJson(map);
      if (map is List) return map.map((item) => Surat.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Map<String, dynamic>?> getSurat() async {
    final response = await get('https://equran.id/api/v2/surat');
    return response.body;
  }

  Future<Map<String, dynamic>?> getDetailSurat(nomor) async {
    final response = await get('https://equran.id/api/v2/surat/$nomor');
    return response.body;
  }
}
