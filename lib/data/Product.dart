import 'package:flutter/material.dart';

class Product {
  int id;
  int count ;
  Color color;
  String name;
  bool checked;

  Product({required this.id,required this.count,required this.color,required  this.name,required  this.checked});
}