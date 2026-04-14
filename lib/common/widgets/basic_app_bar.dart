import 'package:ecom_app4/core/config/theme/app_color.dart';
import 'package:flutter/material.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? action;
  final Color? backgroundColor;
  final bool isHideBack;
  final double? height;
  final BuildContext context;
  const BasicAppBar({
    super.key,
    this.title,
    this.action,
    this.backgroundColor,
    required this.isHideBack,
    this.height,
    required this.context
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title ?? Text(""),
      backgroundColor: AppColor.background,
      centerTitle: true,
      automaticallyImplyLeading: false,
      toolbarHeight: height ?? 80,
      leading: isHideBack
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: AppColor.secondaryBackground,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 15,
                  color: Colors.white,
                ),
              ),
            ),
      actions: [action ?? Container()],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 50);
}
