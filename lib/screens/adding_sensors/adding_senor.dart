import 'package:flutter/material.dart';
import 'package:guard/screens/adding_sensors/adding_location.dart';

import '../../constants.dart';

class AddSensorScreen extends StatefulWidget {
  const AddSensorScreen({Key? key}) : super(key: key);

  @override
  State<AddSensorScreen> createState() => _AddSensorScreenState();
}

enum Sensors { AirQuality, Motion, Spectrum, ColorAndLuminance }

class _AddSensorScreenState extends State<AddSensorScreen> {
  Sensors? _sensors = Sensors.AirQuality;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Radio Button
          ListTile(
              title: const Text('Air Quality'),
              leading: Radio<Sensors>(
                activeColor: kPrimaryColor.withOpacity(0.5),
                value: Sensors.AirQuality,
                groupValue: _sensors,
                onChanged: (Sensors? value) {
                  setState(() {
                    _sensors = value;
                  });
                },
              )),
          ListTile(
              title: const Text('Motion'),
              leading: Radio<Sensors>(
                activeColor: kPrimaryColor.withOpacity(0.5),
                value: Sensors.Motion,
                groupValue: _sensors,
                onChanged: (Sensors? value) {
                  setState(() {
                    _sensors = value;
                  });
                },
              )),
          ListTile(
              title: const Text('Spectrum'),
              leading: Radio<Sensors>(
                activeColor: kPrimaryColor.withOpacity(0.5),
                value: Sensors.Spectrum,
                groupValue: _sensors,
                onChanged: (Sensors? value) {
                  setState(() {
                    _sensors = value;
                  });
                },
              )),
          ListTile(
              title: const Text('Color and Luminance'),
              leading: Radio<Sensors>(
                activeColor: kPrimaryColor.withOpacity(0.5),
                value: Sensors.ColorAndLuminance,
                groupValue: _sensors,
                onChanged: (Sensors? value) {
                  setState(() {
                    _sensors = value;
                  });
                },
              )),

          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0, left: 20),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: kPrimaryColor.withOpacity(0.5),
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor.withOpacity(0.5),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddLocationScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: kPrimaryColor.withOpacity(0.5),
    elevation: 0,
    centerTitle: true,
    title: Text("Add Sensor"),
  );
}
