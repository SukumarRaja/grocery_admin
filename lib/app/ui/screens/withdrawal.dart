import 'package:flutter/material.dart';

import '../themes/colors.dart';
import '../themes/font_size.dart';
import '../widgets/common_text.dart';
import '../widgets/main_title_for_pages.dart';

class Withdrawal extends StatelessWidget {
  const Withdrawal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Under Development"))
          // Container(
          //   alignment: Alignment.topLeft,
          //   padding: EdgeInsets.all(10.0),
          //   child: CommonText(
          //     text: "Manage Withdrawal",
          //     fontSize: AppFontSize.eight,
          //   ),
          // ),
          // Row(
          //   children: [
          //     buildExpanded(name: "Name", flex: 1),
          //     buildExpanded(name: "Amount", flex: 3),
          //     buildExpanded(name: "Bank Name", flex: 2),
          //     buildExpanded(name: "Bank Account", flex: 2),
          //     buildExpanded(name: "Email", flex: 1),
          //     buildExpanded(name: "Phone", flex: 1),
          //   ],
          // ),

        ],
      ),
    );
  }
}
