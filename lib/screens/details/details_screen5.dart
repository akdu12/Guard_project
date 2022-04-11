
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guard/components/sensor_status_switcher.dart';
import 'package:guard/constants.dart';
import 'package:guard/database.dart';
import 'package:guard/riverpod/sensor_status_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/new_user_model.dart';

class DetailsScreenC extends ConsumerStatefulWidget {
  DetailsScreenC({
    Key? key,
    required this.name,
    required this.location,
    required this.status
  }) : super(key: key);

  final String name;
  final String location;
  bool status;

  @override
  DetailsScreen6 createState() => DetailsScreen6();
}

class DetailsScreen6 extends ConsumerState<DetailsScreenC> {
  var _collectionRef = FirebaseFirestore.instance.collection('users');


  NewUser? newUser;
  String idValue = "";
  bool isDataLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<dynamic> getData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      idValue = prefs.getString("idValue") ?? "";

      setState(() {
        _collectionRef.snapshots().forEach((first_element) {
          first_element.docs.forEach((element) {
            if (element.id == idValue) {
              setState(() {
                newUser = NewUser.fromJson(element.data());

                isDataLoaded = true;
              });
              // newUser = newUser;
            }
          });
        });
      });
      return newUser;
    } catch (e) {
      print("Exception : ${e.toString()}");
      // return newUser;
    }
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return Scaffold(
      appBar: buildAppBar(),
      body: isDataLoaded ? SafeArea(
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.05),
                          child: Column(children: [
                            SizedBox(height: size.height * 0.02),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Icon(
                            //       Icons.arrow_back,
                            //       size: 30,
                            //       color: kPrimaryColor2,
                            //     ),
                            //     Text(
                            //       'Home',
                            //       style: TextStyle(
                            //         color: Colors.black87,
                            //         fontWeight: FontWeight.bold,
                            //         fontSize: 20,
                            //       ),
                            //     ),
                            //   ],
                            // ),

                            SizedBox(height: size.height * 0.03),
                            Row(
                              children: [
                                Container(
                                  height: 120,
                                  width: 120,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      "assets/images/colors.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: size.width * 0.05),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 35,
                                      child: FloatingActionButton.extended(
                                          onPressed: () {
                                            if (newUser!.sensors![3].status! ==
                                                true) {
                                              setState(() {
                                                newUser!.sensors![3].status = false;
                                              });
                                            } else if (newUser!.sensors![3].status! ==
                                                false) {
                                              setState(() {
                                                newUser!.sensors![3].status = true;
                                              });
                                            }
                                            ;

                                            FirebaseFirestore.instance
                                                .collection('users')
                                                .doc('$idValue')
                                                .set(newUser!.toJson())
                                                .then((value) {
                                              print("${newUser!.sensors![3].status}");
                                              setState(() {
                                                widget.status = newUser!.sensors![3].status!;
                                              });
                                            });
                                          },
                                          // extendedPadding: EdgeInsets.only(bottom: 10),
                                          label: widget.status
                                              ? const Text("On")
                                              : const Text("Off"),
                                          backgroundColor:
                                          widget.status ? kPrimaryColor2 : Colors.grey,
                                          icon: Icon(
                                            widget.status
                                                ? Icons.toggle_on
                                                : Icons.toggle_off,
                                          )),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Color & Luminance',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                    Text(
                                      'Measures the colors and luminance',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                    Text(
                                      'percentages in your room',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.05),
    newUser!.sensors![3].status == true
                                ? Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'rgb ........',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        '     Red        Green       Blue        Light Concentration',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            )
                                : Container(
                              child: Text(
                                'Sensor is turned off',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.red),
                              ),
                            ),
                            SizedBox(height: 40),
    newUser!.sensors![3].status == true
                                ? Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Note:',
                                        style: TextStyle(
                                          height: 2,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        '* Colors are calculated based on the primary colors Red, Green and Blue.',
                                        style: TextStyle(
                                            height: 2,
                                            fontSize: 16,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        '* Light concentration measures the intensity of light emitted from a surface ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          height: 2,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),


                              ],
                            )

                                : Row()
                          ]))) : Center(child: CircularProgressIndicator())
  );

  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.indigo,
      elevation: 0,
      centerTitle: true,
      title: Text(widget.location),
      actions: [
        // IconButton(
        //   icon: Icon(Icons.edit),
        //   onPressed: () {},
        // ),
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {},
        ),
      ],
    );
  }
}
