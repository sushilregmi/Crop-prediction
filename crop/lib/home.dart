import 'dart:ui';

import 'package:crop/data.dart';
import 'package:crop/field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    elevation: 20,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: InkWell(
                      splashColor: Colors.lightGreenAccent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => data()),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.2,
                        height: MediaQuery.of(context).size.height / 2.7,
                        child: Column(children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/crops.png'),
                          ),
                          Text(
                            "Predict Crop",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Find the optimal crop for given temperature, moisture and humidity.",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: Card(
                    elevation: 20,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: InkWell(
                      splashColor: Colors.lightGreenAccent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => field()),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.2,
                        height: MediaQuery.of(context).size.height / 2.7,
                        child: Column(children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              'assets/field.png',
                              height: MediaQuery.of(context).size.height / 6,
                            ),
                          ),
                          Text(
                            "Retrieve Data",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Retrieve the sensor data from the field and use them to predict crop",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    elevation: 20,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.2,
                      height: MediaQuery.of(context).size.height / 2.7,
                      child: Column(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/details.png',
                            height: MediaQuery.of(context).size.height / 6,
                          ),
                        ),
                        Text(
                          "Crops Detail",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Find the detail of every crop, it's harvesting process and many more.",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        )
                      ]),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: Card(
                    elevation: 20,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.2,
                      height: MediaQuery.of(context).size.height / 2.7,
                      child: Column(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/setting.png',
                            height: MediaQuery.of(context).size.height / 6,
                          ),
                        ),
                        Text(
                          "Settings",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Change the unit of measurement and other factors here.",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        )
                      ]),
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
