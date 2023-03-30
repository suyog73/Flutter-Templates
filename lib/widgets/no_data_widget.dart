import 'package:flutter/material.dart';
import 'package:flutter_templates/helpers/constants.dart';
import 'package:flutter_templates/widgets/appbar_widget.dart';
import 'package:lottie/lottie.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    super.key,
    required this.appBarText,
    required this.noDataText,
    required this.lottiePath,
  });

  final String appBarText, noDataText, lottiePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        appBarName: appBarText,
        backgroundColor: primaryColor,
        textColor: secondaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              noDataText,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Lottie.asset(lottiePath),
            // Image.network("src"),
          ],
        ),
      ),
    );
  }
}
