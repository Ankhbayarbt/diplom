import 'package:ecommerce/app/screens/home/widgets/header_widget.dart';
import 'package:ecommerce/app/screens/home/widgets/search_container.dart';
import 'package:ecommerce/common/widgets/app/row_tail.dart';
import 'package:ecommerce/data/repositories/words/word_repository.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: ASizes.defaultSpace),
              child: FirebaseAnimatedList(
                query: Get.put(WordRepository()).dbref,
                itemBuilder: (context, snapshot, animation, index) {
                  return Card(
                      child: RowTail(
                          icon: Iconsax.book,
                          title: snapshot.key.toString(),
                          value:
                              snapshot.child('translation').value.toString()));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
