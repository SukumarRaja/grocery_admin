import 'package:flutter/material.dart';
import '../../../controllers/main.dart';
import '../../widgets/dashbooard_card.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 25),
          Container(
            height: 150,
            child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, int index) {
                  return DashboardCard(
                    title: "Vendors",
                    titleCount: "50",
                    icon: Icons.group,
                    since: "month",
                    percentage: "3.48",
                    onPressed: () {
                      if (index == 0) {
                        print("first");
                        MainController.to.selectPageIndex = 1;
                      }
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
