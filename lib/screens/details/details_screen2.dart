// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guard/components/sensor_status_switcher.dart';
import 'package:guard/constants.dart';
import 'package:guard/database.dart';
import 'package:guard/riverpod/sensor_status_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailsScreen2 extends ConsumerStatefulWidget {
  const DetailsScreen2({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  DetailsScreen3 createState() => DetailsScreen3();
}

class DetailsScreen3 extends ConsumerState<DetailsScreen2> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    final statusConfig = ref.watch(sensorStatusProvider(widget.name));

    return Scaffold(
      appBar: buildAppBar(),
      body: statusConfig.when(
          data: (data) {
            final value = ref.watch(data);
            return StreamBuilder<Map<String, dynamic>>(
                stream: getReadings(widget.name),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: const CircularProgressIndicator());
                  }
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text("There is no data for ${widget.name}"),
                    );
                  }
                  final data = snapshot.data!;
                  final light = data["light"];
                  final proximity = data["Proximity"];
                  return SafeArea(
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
                                      "assets/images/light.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: size.width * 0.05),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SensorStatusSwitcher(
                                        sensorName: widget.name),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Light & Proximity',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                    Text(
                                      'Measures the light and proximity ',
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
                            value == true
                                ? Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '$proximity',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              'PROXIMITY',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '$light',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              'LIGHT',
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
                          ])));
                });
          },
          error: (err, _) => Text(err.toString()),
          loading: () => Center(child: CircularProgressIndicator())),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor2,
      elevation: 0,
      centerTitle: true,
      title: Text("MY ROOM"),
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
