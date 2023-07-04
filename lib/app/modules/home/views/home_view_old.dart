import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quran_app/app/configs/color_scheme.dart';
import 'package:quran_app/app/modules/home/views/surah_view.dart';
import 'package:quran_app/app/modules/home/views/widgets/banner_widget.dart';
import 'package:quran_app/app/modules/home/views/widgets/greeting_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/icons/menu.png",
              height: 25,
            ),
            const Text(
              'Quran APP',
              style: TextStyle(color: AppColor.primary),
            ),
            Image.asset(
              "assets/icons/search.png",
              height: 25,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(15),
                  child: Flex(
                    direction: Axis.vertical,
                    children: const [GreetingWidget(), BannerHomeWidget()],
                  ),
                ),
              ),
              const SliverAppBar(
                pinned: true,
                backgroundColor: Colors.white,
                elevation: 0,
                automaticallyImplyLeading: false,
                shape: Border(
                    bottom: BorderSide(color: Color(0x0f8789a3), width: 3)),
                bottom: PreferredSize(
                    preferredSize: Size.fromHeight(0), child: TabWidget()),
              )
            ],
            body: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(left: 15, right: 15, top: 24),
              child: const TabBarView(children: [
                SurahView(),
                Text('2'),
                Text('3'),
                Text('4'),
              ]),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 15,
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                activeIcon: Image.asset("assets/icons/quran_active.png"),
                icon: Image.asset("assets/icons/quran.png"),
                label: ""),
            BottomNavigationBarItem(
                activeIcon: Image.asset("assets/icons/lamp_active.png"),
                icon: Image.asset("assets/icons/lamp.png"),
                label: ""),
            BottomNavigationBarItem(
                activeIcon: Image.asset("assets/icons/pray_active.png"),
                icon: Image.asset("assets/icons/pray.png"),
                label: ""),
            BottomNavigationBarItem(
                activeIcon: Image.asset("assets/icons/prayer_active.png"),
                icon: Image.asset("assets/icons/prayer.png"),
                label: ""),
            BottomNavigationBarItem(
                activeIcon: Image.asset("assets/icons/bookmark_active.png"),
                icon: Image.asset("assets/icons/bookmark.png"),
                label: ""),
          ]),
    );
  }
}

class TabWidget extends StatelessWidget {
  const TabWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: TabBar(
          labelColor: AppColor.primary,
          unselectedLabelColor: AppColor.neutral_2,
          indicatorColor: AppColor.primary,
          tabs: [
            Tab(text: 'Surat'),
            Tab(text: 'Para'),
            Tab(text: 'Page'),
            Tab(text: 'Hijb')
          ]),
    );
  }
}
