import 'package:flutter/material.dart';
import 'package:nicehash/ui/HomePage.dart';

main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Nicehash Monitor",
    theme: ThemeData(
        primarySwatch: Colors.orange
    ),
    home: HomePage(),
  ));
}

