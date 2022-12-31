import 'package:flutter/material.dart';
import '../themes/colors.dart';
import '../themes/font_size.dart';
import 'common_text.dart';

Expanded buildExpanded({required name, required flex}) {
  return Expanded(
      flex: flex,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey.withOpacity(.2)),
            color: AppColors.primary),
        child: CommonText(
          text: name,
          fontSize: AppFontSize.six,
          fontColor: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
      ));
}
