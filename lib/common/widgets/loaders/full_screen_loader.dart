import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AFullScreenLoader {
  Future<void> startLoading() {
    return showDialog<void>(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const SimpleDialog(
          elevation: 0.0,
          backgroundColor:
              Colors.transparent, // can change this to your prefered color
          children: <Widget>[
            Center(
              child: CircularProgressIndicator(),
            )
          ],
        );
      },
    );
  }

  Future<void> stopLoading() async {
    Navigator.of(Get.overlayContext!).pop();
  }
}
