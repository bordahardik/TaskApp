// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/view/add_to_cart.dart';
import 'package:sizer/sizer.dart';

import '../utils/color_utils.dart';
import '../viewmodel/bottombar_controller.dart';
import 'home/home_screen.dart';

class BottomBar extends StatelessWidget {
  BottomBar({super.key});

  List pageRoute = [HomeScreen(), CartScreen()];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBarController>(
      init: BottomBarController(),
      initState: (_) {},
      builder: (controller) {
        return Scaffold(
          body: pageRoute[controller.selectedIndex.value],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(4.w),
                topLeft: Radius.circular(4.w),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  spreadRadius: 0,
                  blurRadius: 10,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(4.w),
                topLeft: Radius.circular(4.w),
              ),
              child: BottomNavigationBar(
                backgroundColor: ColorUtils.green,
                selectedFontSize: 12,
                unselectedFontSize: 12,
                type: BottomNavigationBarType.fixed,
                onTap: (i) => controller.pageChange(i),
                currentIndex: controller.selectedIndex.value,
                selectedItemColor: ColorUtils.white,
                unselectedItemColor: ColorUtils.unselectColor,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    activeIcon: SizedBox(
                      height: 11.w,
                      width: 11.w,
                      child: const Icon(Icons.home),
                    ),
                    icon: SizedBox(
                      height: 8.w,
                      width: 8.w,
                      child: const Icon(Icons.home),
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: SizedBox(
                      height: 11.w,
                      width: 11.w,
                      child: const Icon(Icons.shopping_cart),
                    ),
                    icon: SizedBox(
                      height: 8.w,
                      width: 8.w,
                      child: const Icon(Icons.shopping_cart),
                    ),
                    label: 'Cart',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
