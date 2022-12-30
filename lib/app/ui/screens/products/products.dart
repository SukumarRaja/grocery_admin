import 'package:flutter/material.dart';
import 'package:grocery_admin/app/ui/themes/font_size.dart';
import '../../widgets/common_text.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(10.0),
        child: CommonText(
          text: "Manage Products",
          fontSize: AppFontSize.eight,
        ),
      ),
    );
  }
}
