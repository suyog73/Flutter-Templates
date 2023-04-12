import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../helpers/constants.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getSize(context).height,
      width: getSize(context).width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.network(
            "https://assets1.lottiefiles.com/packages/lf20_n4RinHSVJ4.json",
            height: 100,
          ),
          Text(
            "Fetching your data...",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
