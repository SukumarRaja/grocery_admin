import 'package:flutter/material.dart';
import '../../themes/font_size.dart';
import '../../widgets/common_text.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(10.0),
        child: CommonText(
          text: "Manage Dashboard",
          fontSize: AppFontSize.eight,
        ),
      ),
    );
  }
}
