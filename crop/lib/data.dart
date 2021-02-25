import 'dart:convert';

import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class data extends StatefulWidget {
  @override
  _dataState createState() => _dataState();
}

class _dataState extends State<data> {
  var _formkey = GlobalKey<FormState>();
  TextEditingController temp = TextEditingController();
  TextEditingController hum = TextEditingController();
  TextEditingController mois = TextEditingController();
  var res;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Predict the crop'),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Form(
            key: _formkey,
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: temp,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter temperature';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Temperature',
                      hintText: 'Enter temperature( °C )',
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: hum,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter humidity';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Humidity',
                      hintText: 'Enter Humidity',
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: mois,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter moisture';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Moisture',
                      hintText: 'Enter Moisture',
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              )
            ]),
          ),
          Center(
              child: RaisedButton(
                  child: Text(
                    'Predict',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      final url = "http://10.0.2.2:8000/restapi/";
                      Map<String, String> headers = {
                        "Content-type": "application/json"
                      };
                      final response = await http.post(url,
                          headers: headers,
                          body: json.encode({
                            'temperature': temp.text,
                            'humidity': hum.text,
                            'moisture': mois.text
                          }));
                      final decoded = json.decode(response.body);
                      setState(() {
                        res = decoded['prediction'];
                      });
                      showdialog(context, res);
                    }
                  })),
        ]));
  }
}

showdialog(BuildContext context, res) {
  Alert(
      context: context,
      title: "  The optimal crop is ${res}",
      content: Column(
        children: <Widget>[imageshow(context, res)],
      ),
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ]).show();
}

imageshow(BuildContext context, res) {
  if (res == "Maize") {
    return Image.asset('assets/maize1.png');
  } else if (res == "Wheat") {
    return Image.asset('assets/wheat1.png');
  } else {
    return Image.asset('assets/paddy.png');
  }
}
