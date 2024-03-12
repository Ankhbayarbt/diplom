import 'package:ecommerce/app/controllers/user/user_controller.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Obx(
      () => ListTile(
        leading: const CircleAvatar(
          backgroundImage: AssetImage(AImages.profile),
        ),
        title: Text(
          controller.user.value.lastName,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: AColors.white),
        ),
        subtitle: Text(
          controller.user.value.email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: AColors.white),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Iconsax.edit, color: AColors.white),
        ),
      ),
    );
  }
}
