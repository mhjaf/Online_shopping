import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test1/models/cartmodel.dart';
import 'package:test1/models/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test1/screens/women.dart';

class ProductProvider with ChangeNotifier {
  List<Product> feature = [];

  Product featureData;

  List<CartModel> checkOutModelList = [];
  CartModel checkOutModel;

  void deleteCheckoutProduct(int index) {
    checkOutModelList.removeAt(index);
    notifyListeners();
  }

  void clearCheckoutProduct() {
    checkOutModelList.clear();
    notifyListeners();
  }

  void getCheckOutData(
      {int quentity,
      num price,
      String name,
      String color,
      String size,
      String image,
      String descrip}) {
    checkOutModel = CartModel(
      color: color,
      descrip: descrip,
      size: size,
      price: price,
      name: name,
      image: image,
      quentity: quentity,
    );
    checkOutModelList.add(checkOutModel);
  }

  List<CartModel> get getCheckOutModelList {
    return List.from(checkOutModelList);
  }

  int get getCheckOutModelListLength {
    return checkOutModelList.length;
  }

/*

  List<Product> homeAchive = [];

  Future<void> getHomeAchiveData() async {
    List<Product> newList = [];
    QuerySnapshot featureSnapShot =
        await FirebaseFirestore.instance.collection("homeachive").get();
    featureSnapShot.docs.forEach(
      (element) {
        featureData = Product(
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"],
            descrip: element.data()['descrip']);
        newList.add(featureData);
      },
    );
    homeAchive = newList;
    notifyListeners();
  }

  List<Product> get getHomeAchiveList {
    return homeAchive;
  }
*/

//MEN Tshirt
  List<Product> mentshirtlist = [];
  Future<void> mentshirts() async {
    List<Product> newList = [];
    QuerySnapshot featureSnapShot = await FirebaseFirestore.instance
        .collection("product")
        .doc("plNpVV10UgJlMQtVbtAq")
        .collection("Men_Tshirt")
        .get();
    featureSnapShot.docs.forEach(
      (element) {
        featureData = Product(
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"],
            descrip: element.data()["descrip"]);

        newList.add(featureData);
      },
    );
    mentshirtlist = newList;
    notifyListeners();
  }

  List<Product> get getMenTshirtsList {
    return mentshirtlist;
  }

  /* Future<void> shirts() async {
    List<Product> newList = [];
    QuerySnapshot featureSnapShot = await FirebaseFirestore.instance
        .collection("product")
        .doc("plNpVV10UgJlMQtVbtAq")
        .collection("Men_Shirts")
        .get();
    featureSnapShot.docs.forEach(
      (element) {
        featureData = Product(
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"],
            descrip: element.data()["descrip"]);

        newList.add(featureData);
      },
    );
    feature = newList;
  }

  List<Product> get getMenShirtsList {
    return feature;
  }
*/

  //Men Shirts
  List<Product> menshirtlist = [];
  Product newAchivesDataa;

  Future<void> menshirts() async {
    List<Product> newList = [];
    QuerySnapshot featureSnapShot = await FirebaseFirestore.instance
        .collection("product")
        .doc("plNpVV10UgJlMQtVbtAq")
        .collection("Men_Shirts")
        .get();
    featureSnapShot.docs.forEach(
      (element) {
        featureData = Product(
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"],
            descrip: element.data()["descrip"]);
        newList.add(featureData);
      },
    );
    menshirtlist = newList;
    notifyListeners();
  }

  List<Product> get getMenShirtsList {
    return menshirtlist;
  }

  //Women Sweater
  List<Product> wseaterList = [];
  Future<void> Wseaters() async {
    List<Product> newList = [];
    QuerySnapshot featureSnapShot = await FirebaseFirestore.instance
        .collection("product")
        .doc("plNpVV10UgJlMQtVbtAq")
        .collection("Women_sweater")
        .get();
    featureSnapShot.docs.forEach(
      (element) {
        featureData = Product(
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"],
            descrip: element.data()["descrip"]);

        newList.add(featureData);
      },
    );
    wseaterList = newList;
    notifyListeners();
  }

  List<Product> get getWsweatwerList {
    return wseaterList;
  }

  //Women_Dress
  List<Product> wdressList = [];
  Future<void> WDress() async {
    List<Product> newList = [];
    QuerySnapshot featureSnapShot = await FirebaseFirestore.instance
        .collection("product")
        .doc("plNpVV10UgJlMQtVbtAq")
        .collection("Women_Dress")
        .get();
    featureSnapShot.docs.forEach(
      (element) {
        featureData = Product(
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"],
            descrip: element.data()["descrip"]);

        newList.add(featureData);
      },
    );
    wdressList = newList;
    notifyListeners();
  }

  List<Product> get getwdressList {
    return wdressList;
  }
  //Boys

  List<Product> boysList = [];
  Future<void> Boys() async {
    List<Product> newList = [];
    QuerySnapshot featureSnapShot = await FirebaseFirestore.instance
        .collection("product")
        .doc("plNpVV10UgJlMQtVbtAq")
        .collection("Kids_boys")
        .get();
    featureSnapShot.docs.forEach(
      (element) {
        featureData = Product(
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"],
            descrip: element.data()["descrip"]);

        newList.add(featureData);
      },
    );
    boysList = newList;
    notifyListeners();
  }

  List<Product> get getboysList {
    return boysList;
  }

  //Grils
  List<Product> girlsList = [];
  Future<void> Girls() async {
    List<Product> newList = [];
    QuerySnapshot featureSnapShot = await FirebaseFirestore.instance
        .collection("product")
        .doc("plNpVV10UgJlMQtVbtAq")
        .collection("Kids_girls")
        .get();
    featureSnapShot.docs.forEach(
      (element) {
        featureData = Product(
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"],
            descrip: element.data()["descrip"]);

        newList.add(featureData);
      },
    );
    girlsList = newList;
    notifyListeners();
  }

  List<Product> get getgirlsList {
    return girlsList;
  }
}
