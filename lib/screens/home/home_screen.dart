
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guard/components/my_bottom_nav_bar.dart';
import 'package:guard/screens/home/components/body.dart';
//import 'package:guard/screens/sidebar.dart';
import '../../../constants.dart';

class HomeScreen extends StatelessWidget {
  @override

  int currentindex=1;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
      //bottomNavigationBar: ,
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor.withOpacity(0.5),
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {
          //sidebar();

        },
      ),
    );
  }
}
