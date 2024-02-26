import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(ASizes.defaultSpace),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Home')]),
      ),
    );
  }
}
