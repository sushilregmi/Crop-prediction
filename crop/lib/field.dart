import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'data.dart';

class field extends StatefulWidget {
  @override
  _fieldState createState() => _fieldState();
}

class _fieldState extends State<field> {
  var temp = 0;
  var hum = 0;
  var mois = 0;
  var res;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Retrieve data "),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '  Temperature    ${temp}',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '  Humidity           ${hum}',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '  Moisture           ${mois}',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text(
                    "UPDATE VALUE",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                  onPressed: () async {
                    final url = "http://10.0.2.2:8000/restapi1/";
                    Map<String, String> headers = {
                      "Content-type": "application/json"
                    };
                    final response = await http.get(
                      url,
                      headers: headers,
                    );
                    final decoded = json.decode(response.body);
                    setState(() {
                      temp = decoded['temperature'];
                      mois = decoded['moisture'];
                      hum = decoded['humidity'];
                    });
                  },
                ),
                Center(
                    child: RaisedButton(
                        child: Text(
                          'Predict',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.green,
                        onPressed: () async {
                          final url = "http://10.0.2.2:8000/restapi/";
                          Map<String, String> headers = {
                            "Content-type": "application/json"
                          };
                          final response = await http.post(url,
                              headers: headers,
                              body: json.encode({
                                'temperature': temp,
                                'humidity': hum,
                                'moisture': mois
                              }));
                          final decoded = json.decode(response.body);
                          setState(() {
                            res = decoded['prediction'];
                          });
                          showdialog(context, res);
                        })),
              ],
            )
          ],
        ),
      ),
    );
  }
}
