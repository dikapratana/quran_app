import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/app/configs/color_scheme.dart';
import 'package:quran_app/app/modules/home/controllers/detail_surah_controller.dart';
import 'package:quran_app/app/modules/home/views/list_ayat_view.dart';
import 'package:skeletons/skeletons.dart';

class DetailSurah extends GetView<DetailSurahController> {
  DetailSurah({super.key});

  final args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: AppColor.neutral_2),
        elevation: 0,
        title: Text(
          '${args['namaLatin']}',
          style: const TextStyle(
              color: AppColor.primary, fontWeight: FontWeight.w500),
        ),
        actions: [
          Image.asset(
            "assets/icons/search.png",
            height: 25,
          ),
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Obx(
                () => Flex(
                  direction: Axis.vertical,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 150,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: [
                                    0,
                                    1
                                  ],
                                  colors: [
                                    Color(0xFfdf98fa),
                                    Color(0xFf9055ff),
                                  ])),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Image.asset(
                              "assets/images/quran.png",
                              scale: 0.6,
                              opacity: const AlwaysStoppedAnimation(0.15),
                            )),
                        Container(
                          padding: const EdgeInsets.all(15),
                          width: double.infinity,
                          height: 150,
                          child: Flex(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            direction: Axis.vertical,
                            children: [
                              controller.loading.isTrue
                                  ? Flex(
                                      direction: Axis.horizontal,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SkeletonLine(
                                          style: SkeletonLineStyle(
                                              height: 30,
                                              width: 150,
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                        )
                                      ],
                                    )
                                  : Text(
                                      '${controller.data['namaLatin']}',
                                      style: const TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                              const SizedBox(
                                height: 2,
                              ),
                              controller.loading.isTrue
                                  ? Flex(
                                      direction: Axis.horizontal,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SkeletonLine(
                                          style: SkeletonLineStyle(
                                              height: 25,
                                              width: 130,
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                        )
                                      ],
                                    )
                                  : Text(
                                      '${controller.data['arti']}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 15, bottom: 15),
                                height: 1,
                                width: 200,
                                color: Colors.white38,
                              ),
                              controller.loading.isTrue
                                  ? Flex(
                                      direction: Axis.horizontal,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SkeletonLine(
                                          style: SkeletonLineStyle(
                                              height: 30,
                                              width: 100,
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                        )
                                      ],
                                    )
                                  : Text(
                                      '${controller.data['jumlahAyat']} Ayat',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    ListAyatView(controller: controller),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _refresh() {
    return controller.getDetailSurah();
  }
}
