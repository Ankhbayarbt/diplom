import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/device/device_utility.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Container(
      width: DeviceUtilities.getScreenWidth(),
      padding: const EdgeInsets.all(ASizes.md),
      decoration: BoxDecoration(
          color: showBackground
              ? dark
                  ? AColors.dark
                  : AColors.light
              : Colors.transparent,
          borderRadius: BorderRadius.circular(ASizes.borderRadiusLg),
          border: showBorder ? Border.all(color: AColors.grey) : null),
      child: Row(
        children: [
          Icon(
            icon,
            color: AColors.darkGrey,
          ),
          const SizedBox(width: ASizes.spaceBtwItems),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
