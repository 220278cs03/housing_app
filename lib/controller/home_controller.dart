import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:housing_app/model/category_model.dart';

import '../model/home_model.dart';

class HomeController extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<HomeModel> listOfHome = [];
  List<CategoryModel> listOfCategory = [];
  List listOfCategoryId = [];
  List listOfCategoryName = [];
  bool isProductLoading = false;
  bool isCategoryLoading = false;

  String categoryName = "";

  getProduct() async {
    isProductLoading = true;
    notifyListeners();
    var res;
    res = await firestore.collection("home").get();
    listOfHome.clear();
    listOfCategoryId.clear();
    for (var element in res.docs) {
      listOfHome.add(HomeModel.fromJson(element.data()));
    }
      for (var element in listOfHome) {
        listOfCategoryId.add(element.category);
      }
      print(listOfCategoryId);
      isProductLoading = false;
      notifyListeners();
  }

  getCategory() async {
    isCategoryLoading = true;
    notifyListeners();
    var res = await firestore.collection("category").get();
    listOfCategory.clear();
    for (var element in res.docs) {
      listOfCategory.add(CategoryModel.fromJson(element.data()));
    }
    isCategoryLoading = false;
    notifyListeners();
  }

  getCategoryName() async {
    isCategoryLoading = true;
    notifyListeners();
    listOfCategoryName.clear();
    for(int i=0; i<listOfCategoryId.length; i++){
      final docRef = await firestore.collection("category").doc(listOfCategoryId[i]).get();
      var name = CategoryModel.fromJson(docRef.data()!);
      listOfCategoryName.add(name.name);
    }
    print(listOfCategoryId.length);
   // print(listOfCategoryName);
    isCategoryLoading = false;
    notifyListeners();
    //notifyListeners();
  }
}
