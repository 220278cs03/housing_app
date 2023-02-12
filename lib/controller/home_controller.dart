import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:housing_app/model/category_model.dart';

import '../model/home_model.dart';

class HomeController extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<HomeModel> listOfHome = [];
  List<CategoryModel> listOfCategory = [];
  List<HomeModel> listOfLiked = [];
  List<HomeModel> listOfHomeByCategory = [];
  List<HomeModel> listOfLikedByCategory = [];
  List listOfHomeId = [];
  List listOfLikedId = [];
  List listOfHomeByCategoryId = [];
  List listOfLikedByCategoryId = [];
  List listOfCategoryName = [];
  bool isProductLoading = false;
  bool isCategoryLoading = false;
  bool isLikedLoading = false;
  bool isLike = false;
  bool isSeparatePageloading = false;
  bool isCategorySet = false;
  int selectedIndex = 0;

  String categoryName = "";

  changeIndex(index) {
    selectedIndex = index;
    isCategorySet = true;
    notifyListeners();
  }

  getLikedByCategory(String categoryName) {
    categoryName == "All" ? getAllLiked() : listOfLikedByCategory.clear();
    listOfLikedByCategoryId.clear();
    for (int i = 0; i < listOfLiked.length; i++) {
      if (listOfLiked[i].category == categoryName) {
        listOfLikedByCategory.add(listOfLiked[i]);
        listOfLikedByCategoryId.add(listOfLikedId[i]);
      }
    }
    print(listOfLikedByCategory.first.name);
    notifyListeners();
  }

  getProduct() async {
    isProductLoading = true;
    notifyListeners();
    var res;
    res = await firestore.collection("home").get();
    listOfHome.clear();
    listOfHomeId.clear();
    for (var element in res.docs) {
      var resCategory = await firestore
          .collection("category")
          .doc(element.data()["category"])
          .get();
      listOfHome
          .add(HomeModel.fromJson(element.data(), resCategory.data()?["name"]));
      listOfHomeId.add(element.id);
    }
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

  changeLike(int index) {
    listOfHome[index].like = !listOfHome[index].like;
    firestore
        .collection("home")
        .doc(listOfHomeId[index])
        .update({"like": listOfHome[index].like});
    notifyListeners();
  }

  checkIfThereIsLike() {
    for (int i = 0; i < listOfHome.length; i++) {
      if (listOfHome[i].like) {
        isLike = true;
        break;
      }
    }
  }

  getAllLiked() async {
    isLikedLoading = true;
    notifyListeners();
    var res;
    res =
        await firestore.collection("home").where("like", isEqualTo: true).get();
    listOfLiked.clear();
    listOfLikedId.clear();
    for (var element in res.docs) {
      var resCategory = await firestore
          .collection("category")
          .doc(element.data()["category"])
          .get();
      listOfLiked
          .add(HomeModel.fromJson(element.data(), resCategory.data()?["name"]));
      listOfLikedId.add(element.id);
    }
    isLikedLoading = false;
    notifyListeners();
  }

  deleteLike(int index) async {
    listOfLiked[index].like = false;
    await firestore
        .collection("home")
        .doc(listOfLikedId[index])
        .update({"like": listOfLiked[index].like});
    listOfLiked.removeAt(index);
    listOfLikedId.removeAt(index);
    getAllLiked();
    if (listOfLiked.isEmpty) isLike = false;
    notifyListeners();
  }

  byCategory(String categoryName) {
    listOfHomeByCategory.clear();
    listOfHomeByCategoryId.clear();
    for (int i = 0; i < listOfHome.length; i++) {
      if (listOfHome[i].category == categoryName) {
        listOfHomeByCategory.add(listOfHome[i]);
        listOfHomeByCategoryId.add(listOfHomeId[i]);
      }
    }
    print(listOfHomeByCategory.first.category);
    notifyListeners();
  }

  searchHome(String s) async {
    listOfHome.clear();
    listOfHomeId.clear();
    var res = await firestore
        .collection("home")
        .orderBy("name")
        .startAt([s]).endAt(["$s\uf8ff"]).get();
    for (var element in res.docs) {
      var resCategory = await firestore
          .collection("category")
          .doc(element.data()["category"])
          .get();
      listOfHome
          .add(HomeModel.fromJson(element.data(), resCategory.data()?["name"]));
      listOfHomeId.add(element.id);
    }
    notifyListeners();
  }
}
