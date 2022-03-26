import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class sensors extends StatelessWidget {
  final TextEditingController locationController = new TextEditingController();
  final User _auth = FirebaseAuth.instance.currentUser!;
  var _collectionRef = FirebaseFirestore.instance.collection('users');

  Future<void> getData() async {
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // querySnapshot.docs.forEach((element) {
    //   if (element.id == "") {
    //     print("querySnapshot element ${element.data().toString()}");
    //   }
    // });

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    print(allData);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 350,
      color: Colors.amberAccent,
      child: StreamBuilder(
          stream: _collectionRef.snapshots(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return Text("Error");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("loaduin");
            }
            // var user = snapshot.data;
            return GestureDetector(
              onTap: getData,
              child: Text(_auth.email.toString()),
            );
            // ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: ,
            //     itemBuilder: (context, index) {
            //       return GestureDetector(
            //         onTap: () {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (context) => DetailsScreenM(
            //                 id: "",
            //                 name: "",
            //                 description: "",
            //                 location: "",
            //               ),
            //             ),
            //           );
            //         },
            //         child: Container(
            //           margin: EdgeInsets.only(
            //             left: kDefaultPadding,
            //             top: kDefaultPadding / 2,
            //             bottom: kDefaultPadding * 4,
            //           ),
            //           width: size.width * 0.4,
            //           decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.only(
            //               bottomLeft: Radius.circular(10),
            //               bottomRight: Radius.circular(10),
            //             ),
            //             boxShadow: [
            //               BoxShadow(
            //                 offset: Offset(0, 10),
            //                 blurRadius: 50,
            //                 color: kPrimaryColor.withOpacity(0.23),
            //               ),
            //             ],
            //           ),
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: <Widget>[
            //               Image.asset(
            //                 "assets/images/motion.jpg",
            //                 height: 110,
            //                 width: double.infinity,
            //               ),
            //               Container(
            //                 padding: EdgeInsets.all(kDefaultPadding / 2),
            //                 width: double.infinity,
            //                 color: Colors.transparent,
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Text(
            //                       snapshot.data[index]['name'],
            //                       style: TextStyle(
            //                           overflow: TextOverflow.ellipsis,
            //                           color: Colors.black,
            //                           fontWeight: FontWeight.bold),
            //                     ),
            //                     Text(
            //                       "location",
            //                       style: TextStyle(
            //                         color: Colors.grey,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               Divider(),
            //               Container(
            //                   // color: Colors.grey,
            //                   child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   IconButton(
            //                       onPressed: () {
            //                         // locationController.text =
            //                         //     snapshot.data!.docs[index]['Location '];
            //                         showDialog(
            //                             context: context,
            //                             builder: (context) => Dialog(
            //                                   child: Padding(
            //                                     padding: const EdgeInsets.only(
            //                                         top: 40,
            //                                         bottom: 40,
            //                                         left: 15,
            //                                         right: 15),
            //                                     child: ListView(
            //                                       shrinkWrap: true,
            //                                       children: [
            //                                         TextFormField(
            //                                           autofocus: false,
            //                                           controller:
            //                                               locationController,
            //                                           keyboardType:
            //                                               TextInputType
            //                                                   .emailAddress,
            //                                           validator: (value) {
            //                                             if (value!.isEmpty) {
            //                                               return ("Please Enter Your location");
            //                                             }
            //                                             return null;
            //                                           },
            //                                           onSaved: (value) {
            //                                             locationController
            //                                                 .text = value!;
            //                                           },
            //                                           textInputAction:
            //                                               TextInputAction.next,
            //                                           decoration:
            //                                               InputDecoration(
            //                                                   prefixIcon: Icon(Icons
            //                                                       .location_city),
            //                                                   contentPadding:
            //                                                       EdgeInsets
            //                                                           .fromLTRB(
            //                                                               20,
            //                                                               15,
            //                                                               20,
            //                                                               15),
            //                                                   hintText:
            //                                                       "Location",
            //                                                   border:
            //                                                       OutlineInputBorder(
            //                                                     borderRadius:
            //                                                         BorderRadius
            //                                                             .circular(
            //                                                                 10),
            //                                                   )),
            //                                         ),
            //                                         SizedBox(
            //                                           height: 20,
            //                                         ),
            //                                         Material(
            //                                           elevation: 5,
            //                                           borderRadius:
            //                                               BorderRadius.circular(
            //                                                   30),
            //                                           color: kPrimaryColor,
            //                                           child: MaterialButton(
            //                                             padding:
            //                                                 EdgeInsets.fromLTRB(
            //                                                     20, 15, 20, 15),
            //                                             minWidth: MediaQuery.of(
            //                                                     context)
            //                                                 .size
            //                                                 .width,
            //                                             onPressed: () {
            //                                               // snapshot
            //                                               //     .data!
            //                                               //     .docs[index]
            //                                               //     .reference
            //                                               //     .update({
            //                                               //   "Location ":
            //                                               //       locationController
            //                                               //           .text
            //                                               // }).whenComplete(() =>
            //                                               //         Navigator.pop(
            //                                               //             context));
            //                                             },
            //                                             child: Text(
            //                                               "Update",
            //                                               textAlign:
            //                                                   TextAlign.center,
            //                                               style: TextStyle(
            //                                                   fontSize: 20,
            //                                                   color:
            //                                                       Colors.white,
            //                                                   fontWeight:
            //                                                       FontWeight
            //                                                           .bold),
            //                                             ),
            //                                           ),
            //                                         )
            //                                       ],
            //                                     ),
            //                                   ),
            //                                 ));
            //                       },
            //                       icon: Icon(Icons.edit)),
            //                   IconButton(
            //                       onPressed: () {
            //                         // snapshot.data!.docs[index].reference
            //                         //     .delete();
            //                       },
            //                       icon: Icon(
            //                         Icons.delete,
            //                         color: Colors.red,
            //                       ))
            //                 ],
            //               ))
            //             ],
            //           ),
            //         ),
            //       );
            //     });
          }),
    );
  }
}
        // SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        //   child: Row(
        //     children: <Widget>[
        // sensorsCards(
        //   image: "assets/images/air_quality.png",
        //   title: "Air Quality",
        //   name: name1,
        //   press: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => DetailsScreen(
        //           name: name1,
        //         ),
        //       ),
        //     );
        //   },
        // ),
        //       sensorsCards(
        //         image: "assets/images/colors.jpg",
        //         title: "COLOR&LUMINANCE",
        //         name: name5,
        //         press: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //               builder: (context) => DetailsScreenC(
        //                 name: name5,
        //               ),
        //             ),
        //           );
        //         },
        //       ),
        //       sensorsCards(
        //         image: "assets/images/motion.jpg",
        //         title: "Motion",
        //         name: name4,
        //         press: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => DetailsScreenM(
        //       name: name4,
        //     ),
        //   ),
        // );
        //         },
        //       ),
        //       sensorsCards(
        //         image: "assets/images/spectrum.jpg",
        //         title: "Spectrum",
        //         name: name3,
        //         press: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //               builder: (context) => DetailsScreenS(
        //                 name: name3,
        //               ),
        //             ),
        //           );
        //         },
        //       ),
        //     ],
        //   ),
        // );
 

// class sensorsCards extends StatelessWidget {
//   const sensorsCards({
//     Key? key,
//     required this.image,
//     required this.title,
//     required this.name,
//   }) : super(key: key);

//   final String image, title, name;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return GestureDetector(
//       onTap: () {},
//       child: Container(
//         margin: EdgeInsets.only(
//           left: kDefaultPadding,
//           top: kDefaultPadding / 2,
//           bottom: kDefaultPadding * 4,
//         ),
//         width: size.width * 0.4,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(10),
//             bottomRight: Radius.circular(10),
//           ),
//           boxShadow: [
//             BoxShadow(
//               offset: Offset(0, 10),
//               blurRadius: 50,
//               color: kPrimaryColor.withOpacity(0.23),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Image.asset(
//               image,
//               height: 110,
//               width: double.infinity,
//             ),
//             Container(
//               padding: EdgeInsets.all(kDefaultPadding / 2),
//               width: double.infinity,
//               color: Colors.transparent,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: TextStyle(
//                         overflow: TextOverflow.ellipsis,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     name,
//                     style: TextStyle(
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Divider(),
//             Container(
//                 // color: Colors.grey,
//                 child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => EditScreen()));
//                     },
//                     icon: Icon(Icons.edit)),
//                 IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.delete,
//                       color: Colors.red,
//                     ))
//               ],
//             ))
//           ],
//         ),
//       ),
//     );
//   }
// }
