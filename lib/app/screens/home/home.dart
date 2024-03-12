import 'package:ecommerce/app/screens/home/widgets/header_widget.dart';
import 'package:ecommerce/app/screens/home/widgets/search_container.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          HeaderContainer(
            child: Padding(
              padding: const EdgeInsets.all(ASizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Text(
                    ATexts.hello,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: ASizes.spaceBtwItems),
                  const SearchContainer(
                    text: ATexts.searchWord,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
