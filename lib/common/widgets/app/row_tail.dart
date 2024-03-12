import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class RowTail extends StatelessWidget {
  const RowTail(
      {super.key,
      required this.icon,
      required this.title,
      required this.value,
      this.trailing = const Icon(Iconsax.arrow_right),
      this.onTap});

  final IconData icon;
  final String title, value;
  final Widget? trailing;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: AColors.primary,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        value,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
