import 'package:flutter/material.dart';

import 'app_colors.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.title,
    required this.desc,
  });
  final String title;
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGray,
        iconTheme: const IconThemeData(color: kBlack),
        title: const Text(
          'Details',
          style: TextStyle(color: kBlack),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.center,
            height: 200,
            color: kGray.withOpacity(0.5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title),
            ),
          ),
          const Divider(color: Colors.black),
          Container(
            alignment: Alignment.center,
            height: 300,
            color: kGray,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(desc),
            ),
          ),
        ],
      ),
    );
  }
}
