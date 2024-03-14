import 'package:ecommerce/app/screens/home/home.dart';
import 'package:ecommerce/app/screens/profile/profile.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: controller.selectedIndex.value,
          elevation: 0,
          // backgroundColor: AColors.grey,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: ATexts.home),
            NavigationDestination(icon: Icon(Icons.add), label: ATexts.addWord),
            NavigationDestination(
                icon: Icon(Iconsax.heart), label: ATexts.savedWords),
            NavigationDestination(
                icon: Icon(Iconsax.user), label: ATexts.profile),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    Container(color: Colors.amber),
    Container(color: Colors.amber),
    const ProfileScreen(),
  ];
}
