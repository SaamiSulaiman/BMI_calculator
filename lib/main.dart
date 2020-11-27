import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var height = 0;
  var weight = 0;
  double bmi = 0;

  String calculate(){
    setState(() {
      bmi = weight / pow(height / 100 , 2);
      return bmi.toStringAsFixed(1);
    });
  }

  String getResult(){
    if(bmi >= 25){
      print("over");
      return "\"Overweight\"";
    }else if(bmi > 18.5){
      print("pas");
      return "\"Normal\"";
    }else{
      print("under");
      return "\"Underweight\"";
    }
  }

  String getDesc(){
    if(bmi >= 25){
      return "Your weight is too much for your height, try to take diet or make yourself higher";
    }else if(bmi > 18.5){
      return "Your Weigth is perfect for your height, good job!";
    }else{
      return "Your weight is not enough for your height, try to eat more!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculate'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value){
                  height = int.parse(value);
                },
                decoration: InputDecoration(
                    hintText: "Height"
                ),
              ),
              SizedBox(height: 16.0,),

              TextField(
                onChanged: (value){
                  weight = int.parse(value);
                },
                decoration: InputDecoration(
                    hintText: "Weight"
                ),
              ),
              SizedBox(height: 16.0,),

              RaisedButton(
                onPressed: calculate,
                child: Text('Calculate'),
              ),

              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(getResult(),
                        style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(getDesc(),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}