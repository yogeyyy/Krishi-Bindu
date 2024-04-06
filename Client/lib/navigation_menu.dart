import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/features/blogs/blogs.dart';
import 'package:solution_challenge/features/chatbot/screens/chat.dart';
import 'package:solution_challenge/features/donate/screens/ngo/ngo.dart';
import 'package:solution_challenge/features/education/screens/resources/resources.dart';
import 'package:solution_challenge/features/personalization/screens/settings/settings.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = PHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: dark ? TColors.myblack : Colors.white,
          indicatorColor: dark
              ? Colors.white.withOpacity(0.1)
              : Colors.black.withOpacity(0.1),
          destinations: [
             NavigationDestination(icon: Icon(Iconsax.house), label: translatedStrings?[127] ?? 'Home'),
            NavigationDestination(
                icon: const Icon(Iconsax.messages_2), label: translatedStrings?[129] ??'Chat'),
            NavigationDestination(
                icon: const Icon(Iconsax.message_text), label:translatedStrings?[128] ?? 'Blogs'),
            NavigationDestination(
                icon: const Icon(Iconsax.money_send), label: translatedStrings?[126] ??'Contribute'),
            NavigationDestination(icon: const Icon(Iconsax.user), label:translatedStrings?[131] ?? 'Profile'),
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
    const EducationScreen(),
    const ChatScreen(),
    const BlogScreen(),
    const NgoScreen(),
    const SettingsScreen()
  ];
}
