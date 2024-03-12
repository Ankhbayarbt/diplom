import 'package:ecommerce/common/widgets/app/row_tail.dart';
import 'package:ecommerce/app/controllers/login/login_controller.dart';
import 'package:ecommerce/app/screens/home/widgets/header_widget.dart';

import 'package:ecommerce/app/controllers/user/user_controller.dart';
import 'package:ecommerce/app/screens/profile/user_profile_tile.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    final loginController = Get.put(LoginController());
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          // Header
          const HeaderContainer(
            child: Padding(
              padding: EdgeInsets.all(ASizes.defaultSpace),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  UserProfileTile(),
                ],
              ),
            ),
          ),
          // Body
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(ASizes.defaultSpace),
              child: Column(
                children: [
                  // Section
                  Row(
                    children: [
                      Text(
                        ATexts.userInfo,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: AColors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                  RowTail(
                    icon: Iconsax.personalcard,
                    title: ATexts.firstName,
                    value: userController.user.value.firstName,
                    onTap: () {},
                  ),
                  RowTail(
                    icon: Iconsax.personalcard,
                    title: ATexts.lastName,
                    value: userController.user.value.lastName,
                    onTap: () {},
                  ),
                  RowTail(
                    icon: Icons.email,
                    title: ATexts.email,
                    value: userController.user.value.email,
                    onTap: () {},
                  ),
                  RowTail(
                    icon: Icons.phone,
                    title: ATexts.phone,
                    value: userController.user.value.phoneNumber,
                    onTap: () {},
                  ),
                  const SizedBox(height: ASizes.spaceBtwItems),
                  Row(
                    children: [
                      Text(
                        ATexts.settings,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: AColors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),

                  RowTail(
                    icon: Icons.settings,
                    title: ATexts.phone,
                    value: userController.user.value.phoneNumber,
                    onTap: () {},
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => loginController.logout(),
                      child: const Text(ATexts.logout),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
