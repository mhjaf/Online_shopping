import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test1/models/cartmodel.dart';
import 'package:test1/provider/product_provider.dart';
import 'package:test1/screens/men.dart';
import 'package:test1/widgets/checkout_singleproduct.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  TextStyle myStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ProductProvider productProvider;

  Widget _buildBottomSingleDetail({
    String startName,
    String endName,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          startName,
          style: myStyle,
        ),
        Text(
          endName,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red[400]),
        ),
      ],
    );
  }

  User user;
  double total;
  List<CartModel> myList;

  Widget _buildButton() {
    return Column(children: [
      Container(
        height: 55,
        width: 920,
        child: RaisedButton(
          color: Colors.black,
          child: Text('CHECKOUT',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          onPressed: () {
            return showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text("SUCCESSFULLY"),
                content: Text("The Request Was Successful"),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();

                      if (productProvider.getCheckOutModelList.isNotEmpty) {
                        FirebaseFirestore.instance.collection("Order").add({
                          "Product": productProvider.getCheckOutModelList
                              .map((c) => {
                                    "ProductName": c.name,
                                    "ProductPrice": c.price,
                                    "ProductQuetity": c.quentity,
                                    "ProductImage": c.image,
                                    "Product Color": c.color,
                                    "Product Size": c.size,
                                    "Total": total,
                                  })
                              .toList(),
                        });
                      }
                    },
                    child: Text("okay"),
                  ),
                ],
              ),
            );
          },
        ),
      )
    ]);
  }

  @override
  void initState() {
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    myList = productProvider.checkOutModelList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    user = FirebaseAuth.instance.currentUser;
    double subTotal = 0;
    double discount = 25;
    double discountRupees;
    // double itemdiscount;

    double shipping = 2;

    productProvider = Provider.of<ProductProvider>(context);
    productProvider.getCheckOutModelList.forEach((element) {
      subTotal += element.price * element.quentity;
    });

    discountRupees = discount / 100 * subTotal;
    //itemdiscount = dis / 100 * element.price;

    total = subTotal + shipping - discountRupees;
    if (productProvider.checkOutModelList.isEmpty) {
      total = 0.0;
      discount = 0.0;
      shipping = 0.0;
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text("CHECKOUT", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(bottom: 15),
        child: _buildButton(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                child: ListView.builder(
                  itemCount: myList.length,
                  itemBuilder: (ctx, myIndex) {
                    return CheckOutSingleProduct(
                      index: myIndex,
                      color: myList[myIndex].color,
                      size: myList[myIndex].size,
                      image: myList[myIndex].image,
                      name: myList[myIndex].name,
                      price: myList[myIndex].price,
                      quentity: myList[myIndex].quentity,
                      descrip: myList[myIndex].descrip,
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildBottomSingleDetail(
                      startName: "Price:",
                      endName: "${subTotal.toStringAsFixed(2)} \$",
                    ),
                    _buildBottomSingleDetail(
                      startName: "Discount:",
                      endName: "${discount.toStringAsFixed(2)} %",
                    ),
                    _buildBottomSingleDetail(
                      startName: "Shipping:",
                      endName: " ${shipping.toStringAsFixed(2)} \$",
                    ),
                    _buildBottomSingleDetail(
                      startName: "Total:",
                      endName: "${total.toStringAsFixed(2)} \$",
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
