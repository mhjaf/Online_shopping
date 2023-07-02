import 'package:test1/screens/checkout.dart';
import 'package:flutter/material.dart';
import '../provider/product_provider.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final String image;
  final String name;
  final num price;
  final String descrip;
  DetailScreen({this.image, this.name, this.price, this.descrip});
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int count = 1;

  Widget _buildColorProduct({Color color}) {
    return Container(
      height: 40,
      width: 40,
      color: color,
    );
  }

  final TextStyle myStyle = TextStyle(
    fontSize: 18,
  );
  Widget _buildImage() {
    return Center(
      child: Container(
        width: 380,
        child: Card(
          child: Container(
            padding: EdgeInsets.all(13),
            child: Container(
              height: 260,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(widget.image),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNameToDescriptionPart() {
    return Container(
      height: 100,
      child: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(widget.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(
                "${widget.price.toString()} \$",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text("Description:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDiscription() {
    return Container(
      height: 60,
      child: Wrap(
        children: <Widget>[
          Text(
            widget.descrip,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }

  List<bool> sized = [true, false, false, false, false];
  List<bool> colored = [true, false, false, false, false, false];
  int sizeIndex = 0;
  String size;
  void getSize() {
    if (sizeIndex == 0) {
      setState(() {
        size = "S";
      });
    } else if (sizeIndex == 1) {
      setState(() {
        size = "M";
      });
    } else if (sizeIndex == 2) {
      setState(() {
        size = "L";
      });
    } else if (sizeIndex == 3) {
      setState(() {
        size = "XL";
      });
    } else if (sizeIndex == 4) {
      setState(() {
        size = "XXL";
      });
    }
  }

  int colorIndex = 0;
  String color;
  void getColor() {
    if (colorIndex == 0) {
      setState(() {
        color = "Light Blue";
      });
    } else if (colorIndex == 1) {
      setState(() {
        color = "Light Green";
      });
    } else if (colorIndex == 2) {
      setState(() {
        color = "Light Yellow";
      });
    } else if (colorIndex == 3) {
      setState(() {
        color = "Red";
      });
    } else if (colorIndex == 4) {
      setState(() {
        color = "Black";
      });
    } else if (colorIndex == 5) {
      setState(() {
        color = "White";
      });
    }
  }

  Widget _buildSizePart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Size",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: 265,
          child: ToggleButtons(
            children: [
              Text("S",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text("M",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text("L",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text("XL",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text("XXL",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
            onPressed: (int index) {
              setState(() {
                for (int indexBtn = 0; indexBtn < sized.length; indexBtn++) {
                  if (indexBtn == index) {
                    sized[indexBtn] = true;
                  } else {
                    sized[indexBtn] = false;
                  }
                }
              });
              setState(() {
                sizeIndex = index;
              });
            },
            isSelected: sized,
          ),
        ),
      ],
    );
  }

  Widget _buildColorPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Text(
          "Color",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: 300,
          child: ToggleButtons(
            fillColor: Colors.grey,
            renderBorder: false,
            children: [
              _buildColorProduct(color: Colors.black),
              _buildColorProduct(color: Colors.blue[200]),
              _buildColorProduct(color: Colors.white),
              _buildColorProduct(color: Colors.green[200]),
              _buildColorProduct(color: Colors.yellow[200]),
              _buildColorProduct(color: Colors.red[300]),
            ],
            onPressed: (int index) {
              setState(() {
                for (int indexBtn = 0; indexBtn < colored.length; indexBtn++) {
                  if (indexBtn == index) {
                    colored[indexBtn] = true;
                  } else {
                    colored[indexBtn] = false;
                  }
                }
              });
              setState(() {
                colorIndex = index;
              });
            },
            isSelected: colored,
          ),
        ),
      ],
    );
  }

  Widget _buildQuentityPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Text(
          "Quentity",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 40,
          width: 130,
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
                onTap: () {
                  setState(() {
                    if (count > 1) {
                      count--;
                    }
                  });
                },
              ),
              Text(
                count.toString(),
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              GestureDetector(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onTap: () {
                  setState(() {
                    count++;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButtonPart() {
    return Container(
      height: 55,
      width: 920,
      child: RaisedButton(
        color: Colors.black,
        child: Text('Add To Cart',
            style: TextStyle(color: Colors.white, fontSize: 20)),
        onPressed: () {
          getSize();
          getColor();
          productProvider.getCheckOutData(
            image: widget.image,
            color: color,
            size: size,
            name: widget.name,
            price: widget.price,
            quentity: count,
            descrip: widget.descrip,
          );
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => CheckOut(),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(widget.name, style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            _buildImage(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildNameToDescriptionPart(),
                  _buildDiscription(),
                  _buildSizePart(),
                  _buildColorPart(),
                  _buildQuentityPart(),
                  SizedBox(
                    height: 15,
                  ),
                  _buildButtonPart(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
