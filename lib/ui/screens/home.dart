import 'package:flutter/material.dart';
import 'package:guard/constants.dart';

import '../custom_widgets/header_with_seachbox.dart';
import '../custom_widgets/sensors.dart';
import '../custom_widgets/title_with_more_bbtn.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              HeaderWithSearchBox(size: size),
              TitleWithMoreBtn(
                  title: "Sensors",
                  press: () {
                    print(" Hello print");
                  }),
              sensors(),
              SizedBox(height: kDefaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}
