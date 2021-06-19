import 'package:flutter/material.dart';
import 'package:locations/models/location.dart';
import 'package:url_launcher/url_launcher.dart';
import 'data/locations.dart';
import 'package:locations/data/locations.dart';
import 'dart:async';

import 'main.dart';
class MyCustomForm extends StatefulWidget {
  locations l;
  MyCustomForm(this.l);
  @override
  MyCustomFormState createState() {
    return MyCustomFormState(l);

  }
}
class MyCustomFormState extends State<MyCustomForm> {
  locations l;
  String _name;
  String _theme;
  String _fulldescription;
  String _locationurl;
  String _imageurl;
  MyCustomFormState(this.l);


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(labelText: ' Location name',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
          )
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Name is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _name = value;
        },
      ),
    );
  }

  Widget _buildTheme() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(labelText: 'Theme',
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
          )
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Theme is Required';
          }
          return null;
        },
        onSaved: (String value) {
          _theme = value;
        },
      ),
    );
  }

  Widget _buildfulldescription() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(labelText: 'full description',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0)
            )
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'fulldescription is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _fulldescription = value;
        },
      ),
    );
  }

  Widget _buildlocationurl() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(labelText: 'location url',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0)
            )
        ),
        keyboardType: TextInputType.url,
        validator: (String value) {
          if (value.isEmpty) {
            return 'locationurl is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _locationurl= value;
        },
      ),
    );
  }

  Widget _buildimageurl() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(labelText: 'image url',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0)
            )
        ),
        keyboardType: TextInputType.url,
        validator: (String value) {
          if (value.isEmpty) {
            return 'imageurl is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _imageurl = value;
        },
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form")),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 50.0,
            horizontal: 10.0
          ) ,
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildTheme(),
                _buildfulldescription(),
                _buildlocationurl(),
                _buildimageurl(),

                SizedBox(height: 100),
                ElevatedButton(

                  child: Text('Add',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }


                    _formKey.currentState.save();
                    Location L3=new Location(name: _name,theme: _theme,description: _fulldescription,imageUrl: _imageurl,locationUrl: _locationurl);

                    l.listobj.insert(0, L3);

                    Navigator.of(context).pop();
                       MaterialPageRoute(builder: (context) => MyHomePage());

                    // print(_name);
                    // print(_theme);
                    // print(_fulldescription);
                    // print(_locationurl);
                    // print(_imageurl);


                    //Send to API
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

