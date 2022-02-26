import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guard/components/my_bottom_nav_bar.dart';
import 'package:guard/constants.dart';

class user_profile extends StatefulWidget {
  const user_profile({Key? key}) : super(key: key);


  @override
  _user_profileState createState() => _user_profileState();
}

class _user_profileState extends State<user_profile> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: buildAppBar(),
      body: Center(child: Padding(
        padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 120,
                child: Image.asset("assets/images/user_white.png"),
              ),
              SizedBox(height: 50),
                Text("Sarah AlHaddab",style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold,fontSize: 20),
                ),
                Text("Sarah@guard.com",style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold,fontSize: 20),
                ),
              SizedBox(height:300,),
              //ActionChip(label: Text("Logout"),onPressed: (){},elevation: 5,backgroundColor: reddish,),
              logoutButton,





            ],
          )






      )







      ),
      bottomNavigationBar: MyBottomNavBar(),
      //bottomNavigationBar: ,
    );
  }


  final logoutButton = Material(
    elevation: 0,
    borderRadius: BorderRadius.circular(30),
    color: reddish,
    child: MaterialButton(
    padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    minWidth: 350,
    onPressed: () {

    },
    child: Text(
    "Logout",
    textAlign: TextAlign.center,
    style: TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.bold),



    ),),
    );

  }



