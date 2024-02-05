import 'package:flutter/material.dart';
import 'package:stradmon_chairs/constants/app_colors.dart';
import 'package:stradmon_chairs/constants/custom_text.dart';

SnackBar showSnack(String text) {
  return SnackBar(
    backgroundColor: AppColors.blackColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    duration: const Duration(seconds: 2),
    content: Center(
      child: TextCustom.h2(
        text,
        color: AppColors.whiteColor,
      ),
    ),
  );
}
