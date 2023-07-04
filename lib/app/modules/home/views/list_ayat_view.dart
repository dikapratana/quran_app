import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/app/configs/color_scheme.dart';
import 'package:quran_app/app/modules/home/controllers/detail_surah_controller.dart';
import 'package:skeletons/skeletons.dart';

class ListAyatView extends StatefulWidget {
  const ListAyatView({
    super.key,
    required this.controller,
  });

  final DetailSurahController controller;

  @override
  State<ListAyatView> createState() => _ListAyatViewState();
}

class _ListAyatViewState extends State<ListAyatView> {
  final player = AudioPlayer();
  String ayatSelected = '';

  @override
  void initState() {
    player.onPlayerComplete.listen((event) {
      setState(() {
        ayatSelected = '';
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: widget.controller.loading.isTrue
            ? 7
            : widget.controller.data['ayat'].length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 25,
              bottom: 25,
            ),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              width: 2,
              color: Color(0x0f8789a3),
            ))),
            child: widget.controller.loading.isTrue
                ? Flex(
                    direction: Axis.vertical,
                    children: [
                      SkeletonLine(
                        style: SkeletonLineStyle(
                            height: 60,
                            width: double.infinity,
                            borderRadius: BorderRadius.circular(4)),
                      ),
                    ],
                  )
                : Flex(
                    direction: Axis.vertical,
                    mainAxisSize: MainAxisSize.max,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ayatSelected.toString() ==
                                      widget.controller
                                          .data['ayat'][index]['nomorAyat']
                                          .toString()
                                  ? IconButton(
                                      onPressed: () async {
                                        setState(() {
                                          ayatSelected = '';
                                        });
                                        await player.pause();
                                      },
                                      icon: const Icon(
                                        Icons.pause_circle_outline,
                                        color: AppColor.primary,
                                      ),
                                    )
                                  : IconButton(
                                      onPressed: () async {
                                        setState(() {
                                          ayatSelected =
                                              '${widget.controller.data['ayat'][index]['nomorAyat']}';
                                        });
                                        await player.setSourceUrl(
                                            '${widget.controller.data['ayat'][index]['audio']['05']}');
                                        await player.resume();
                                      },
                                      icon: const Icon(
                                        Icons.play_circle_outline_rounded,
                                        color: AppColor.primary,
                                      ),
                                    ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.bookmark_border_outlined,
                                color: AppColor.primary,
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                            '${widget.controller.data['ayat'][index]['teksArab']}',
                            style: const TextStyle(
                                color: AppColor.neutral_1,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                            textAlign: TextAlign.right),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${widget.controller.data['ayat'][index]['teksLatin']}',
                          style: const TextStyle(
                              color: AppColor.neutral_1,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${widget.controller.data['ayat'][index]['teksIndonesia']}',
                          style: const TextStyle(
                              color: AppColor.neutral_1,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
