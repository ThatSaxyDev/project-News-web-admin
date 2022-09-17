import 'package:flutter/material.dart';

double height(BuildContext context){
  return MediaQuery.of(context).size.height;
}

double width(BuildContext context){
  return MediaQuery.of(context).size.width;
}

class Constants {
  static const String uri = 'http://192.168.0.106:3000';
}