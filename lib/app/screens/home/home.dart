import 'package:ecommerce/app/controllers/word/word_controller.dart';
import 'package:ecommerce/common/widgets/app/row_tail.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(WordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AColors.primary,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        )),
        leading: Image.asset(AImages.onBoardingImage2),
        centerTitle: true,
        title: TextField(
          controller: controller.filter,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 1),
            prefixIcon: const Icon(Icons.search, color: AColors.darkGrey),
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    controller.filter.text = '';
                    controller.listKey = UniqueKey();
                  });
                },
                icon: const Icon(Icons.cancel)),
            hintText: ATexts.searchWord,
            filled: true,
            fillColor: AColors.white,
          ),
          onChanged: (value) {
            setState(() {
              controller.filter.text = value;
              controller.listKey = UniqueKey();
            });
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none),
              color: AColors.white)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 5,
                  left: ASizes.defaultSpace,
                  right: ASizes.defaultSpace),
              child: FirebaseAnimatedList(
                key: controller.listKey,
                query: controller.buildQuery(controller.filter.text),
                itemBuilder: (context, snapshot, animation, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Card(
                      child: RowTail(
                        icon: Iconsax.book,
                        title: snapshot.key.toString(),
                        value: snapshot.child('translation').value.toString(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
