import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guard/screens/home/home_screen.dart';
import 'package:guard/screens/uprofile/user_profile.dart';


import '../constants.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
        bottom: kDefaultPadding,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(0.5),
        boxShadow: [
         /* BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 35,
            color: kPrimaryColor.withOpacity(0.38),
          ),*/
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.warning,
              color: Colors.white,
              size: 35,
            ),
            //icon: SvgPicture.asset("assets/icons/user-icon.svg"),
            onPressed: (){
//under construction
            },
          ),
          IconButton(
            icon: Icon(
              Icons.home,
              //title: Text(""),
              color: Colors.white,
              size: 35,
            ),
            //Image.asset("assets/images/home.png"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) =>HomeScreen()));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.white,
              size: 35,
            ),
            //icon: SvgPicture.asset("assets/icons/user-icon.svg"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>user_profile()));
            },
          ),
        ],
      ),
    );
  }
}
