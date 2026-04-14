import 'package:flutter/material.dart';

class AppBottomsheet {
  static Future<void> showBottomSheet(BuildContext context, Widget widget) {
    return showModalBottomSheet(
      context: context, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        )
      ),
      builder: (context) {
        return widget;
      }
    );
  }
}