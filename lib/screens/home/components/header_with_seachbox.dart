import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guard/model/user_model.dart';

import '../../../constants.dart';

User? user = FirebaseAuth.instance.currentUser;
UserModel loggedInUser = UserModel();


class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;


  @override

  @override

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
      // It will cover 20% of our total height
      height: size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 36 + kDefaultPadding,
            ),
            height: size.height * 0.2 - 27,
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.5),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              children: <Widget>[
                Text(
                  'Hi Username!',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Image.asset("assets/images/logo-2.png")
              ],
            ),
          ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     alignment: Alignment.center,
          //     margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          //     padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          //     height: 54,
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(20),
          //       boxShadow: [
          //         BoxShadow(
          //           offset: Offset(0, 10),
          //           blurRadius: 50,
          //           color: kPrimaryColor.withOpacity(0.23),
          //         ),
          //       ],
          //     ),
          //     // child: Row(
          //     //   children: <Widget>[
          //     //     Expanded(
          //     //       child: TextField(
          //     //         onChanged: (value) {},
          //     //         decoration: InputDecoration(
          //     //           hintText: "Search",
          //     //           hintStyle: TextStyle(
          //     //             color: kPrimaryColor.withOpacity(0.5),
          //     //           ),
          //     //           enabledBorder: InputBorder.none,
          //     //           focusedBorder: InputBorder.none,
          //     //           // surffix isn't working properly  with SVG
          //     //           // thats why we use row
          //     //           // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
          //     //         ),
          //     //       ),
          //     //     ),
          //     //     SvgPicture.asset("assets/icons/search.svg"),
          //     //   ],
          //     // ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
