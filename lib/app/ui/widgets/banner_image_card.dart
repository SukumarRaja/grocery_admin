import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../themes/colors.dart';

class BannerImageCard extends StatelessWidget {
  const BannerImageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> categoryStream =
        FirebaseFirestore.instance.collection('banners').snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: categoryStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            color: AppColors.primary,
          ));
        }

        return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6, mainAxisSpacing: 2, crossAxisSpacing: 2),
            itemCount: snapshot.data!.size,
            shrinkWrap: true,
            itemBuilder: (context, int index) {
              var data = snapshot.data!.docs[index];
              return Column(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                      data['image'],
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Column(
                          children: [
                            Text('Debug mode On'),
                            Icon(Icons.developer_board)
                          ],
                        );
                      },
                    ),
                  ),
                ],
              );
            });
      },
    );
  }
}
