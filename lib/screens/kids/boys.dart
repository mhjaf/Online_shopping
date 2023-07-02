import 'package:test1/screens/checkout.dart';
import '/provider/product_provider.dart';
import 'package:test1/screens/detailscreen.dart';
import 'package:test1/widgets/singeproduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';
import 'package:test1/screens/men.dart';

class Boys extends StatefulWidget {
  @override
  _BoysState createState() => _BoysState();
}

ProductProvider productProvider;

class _BoysState extends State<Boys> {
  double height, width;
  MediaQueryData mediaQuery;

  Widget _Boys() {
    return Column(
      children: <Widget>[
        Wrap(
          children: productProvider.getboysList.map((e) {
            return Expanded(
              child: Wrap(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            image: e.image,
                            price: e.price,
                            name: e.name,
                            descrip: e.descrip,
                          ),
                        ),
                      );
                    },
                    child: SingleProduct(
                      image: e.image,
                      price: e.price,
                      name: e.name,
                      descrip: e.descrip,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  void getCallAllFunction() {
    productProvider.Boys();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    getCallAllFunction();
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _key,
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return CheckOut();
                }));
              })
        ],
        title: Text(
          "Boys",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 9.0,
        backgroundColor: Colors.grey[100],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  _Boys(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
