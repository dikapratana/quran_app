// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/app/configs/color_scheme.dart';
import 'package:quran_app/app/modules/home/controllers/home_controller.dart';
import 'package:skeletons/skeletons.dart';

class SurahView extends GetView<HomeController> {
  const SurahView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => ListView.builder(
          itemCount: state!.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () => {
                Get.toNamed('/surah/detail', arguments: {
                  "nomor": "${state[index]['nomor']}",
                  "namaLatin": "${state[index]['namaLatin']}"
                })
              },
              leading: Stack(
                children: [
                  Image.asset("assets/icons/bgayat.png"),
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: Center(
                      child: Text(
                        '${state[index]['nomor']}',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  )
                ],
              ),
              title: Text(state[index]['namaLatin']),
              subtitle: Text(
                '${state[index]['jumlahAyat']} Ayat',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              trailing: Text(
                state[index]['nama'],
                style: TextStyle(
                    fontSize: 18,
                    color: AppColor.primary,
                    fontWeight: FontWeight.w600),
              ),
            );
          }),
      onLoading: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Flex(
            direction: Axis.vertical,
            children: [
              SkeletonLine(
                style: SkeletonLineStyle(
                    height: 60,
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(4)),
              ),
              SizedBox(
                height: 15,
              )
            ],
          );
        },
      ),
    );
  }
}
