import 'package:flutter/material.dart';
import 'package:locations/FormScreen.dart';
import 'package:locations/SecondRoute.dart';
import 'package:url_launcher/url_launcher.dart';
import 'data/locations.dart';
import 'package:locations/data/locations.dart';
import 'dart:async';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:MyHomePage(),
    );
  }
}
  class MyHomePage extends StatefulWidget{
    MyHomePage({Key key, this.title}) : super(key: key);
    final String title;
    _MyHomePageState createState() => _MyHomePageState();


    }
  class _MyHomePageState extends State<MyHomePage>{
    final locations l = new locations();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Favorite locations'),
      ),

      body: Center(
        child: ListView.builder(
          itemCount: l.listobj.length,
          itemBuilder: (context, index){
            int number =index;
            return GestureDetector(
              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:(context)=> SecondRoute(number,l)),);},
              child: Card(
                  child:Column(
                      mainAxisSize: MainAxisSize.min,
                      children :<Widget> [
                        Image.network(l.listobj[index].imageUrl),
                        Text(l.listobj[index].name),
                        Text(l.listobj[index].theme),


                      ]
                  )
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:  Icon(Icons.add),
        onPressed:()  {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MyCustomForm(l)));
        },


      ),

    );
  }

  }



// ignore: must_be_immutable










// ignore: must_be_immutable



