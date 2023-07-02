import 'package:flutter/material.dart';

class CartModel {
  final String name;
  final String image;
  final num price;
  final int quentity;
  final String color;
  final String size;
  final String descrip;
  CartModel({
    @required this.price,
    @required this.name,
    @required this.image,
    @required this.size,
    @required this.color,
    @required this.quentity,
    @required this.descrip,
  });
}
