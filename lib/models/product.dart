import 'package:flutter/material.dart';

class Product {
  final String name;
  final String image;
  final String descrip;
  final num price;
  Product(
      {@required this.image,
      @required this.name,
      @required this.price,
      @required this.descrip});
}
