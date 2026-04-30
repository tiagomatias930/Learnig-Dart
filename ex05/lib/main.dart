import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("My App"),
        ),
        body: Center(
          child: Text("Ex05 Simple Display now"),
        )
      )
    )
  );
}