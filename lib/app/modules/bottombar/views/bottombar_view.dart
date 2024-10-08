import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/bottombar_controller.dart';
import '../../home/views/home_view.dart';
import '../../master_tahun_ajaran/views/master_tahun_ajaran_view.dart';
import '../../../util/color.dart';

class BottombarView extends GetView<BottombarController> {
  const BottombarView({Key? key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottombarController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                // LoginView(),
                HomeView(),
                TahunAjaranView(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Palette.darkergray,
            selectedItemColor: Palette.red,
            onTap: controller.changeIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: [
              controller.BotBar(
                ikon: Icons.home,
                label: 'Home',
              ),
              controller.BotBar(
                ikon: Icons.calendar_month,
                label: 'Tahun Ajaran',
              ),
            ],
          ),
        );
      },
    );
  }
}