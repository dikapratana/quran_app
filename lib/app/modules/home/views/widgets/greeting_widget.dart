import 'package:flutter/material.dart';
import 'package:quran_app/app/configs/color_scheme.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: const [
        SizedBox(
          height: 15,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Asslamualaikum',
            style: TextStyle(
              color: AppColor.neutral_2,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Dika Pratana',
            style: TextStyle(
              color: AppColor.neutral_1,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
