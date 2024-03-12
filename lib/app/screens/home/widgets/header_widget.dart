import 'package:ecommerce/common/widgets/custom_shapes/curved_edges_widget.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
      child: Container(
        color: AColors.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              color: AColors.primary,
            ),
            child,
          ],
        ),
      ),
    );
  }
}
