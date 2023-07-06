// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quran_app/app/configs/color_scheme.dart';

class LoginView extends GetView {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          height: double.infinity,
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            direction: Axis.vertical,
            children: [
              Text(
                'Quran App',
                style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primary),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Learn Quran and\n Recite once everyday',
                style: TextStyle(
                    fontSize: 18,
                    color: AppColor.neutral_2,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset('assets/images/login.png'),
                  Positioned(
                    bottom: 16,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.only(left: 50, right: 50),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed('/home');
                        },
                        child: Text('Mulai'),
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            backgroundColor: Colors.amber[900]),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
