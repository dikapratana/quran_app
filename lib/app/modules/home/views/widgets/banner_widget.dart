import 'package:flutter/material.dart';

class BannerHomeWidget extends StatelessWidget {
  const BannerHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 131,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
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
            bottom: 0, right: 0, child: Image.asset("assets/images/quran.png")),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flex(
                direction: Axis.horizontal,
                children: [
                  Image.asset("assets/icons/book.png"),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Last Read",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Al-Fatihah",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Al-Fatihah",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        )
      ],
    );
  }
}
