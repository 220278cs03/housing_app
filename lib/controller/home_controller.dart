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
  bool isSearching = false;
  bool isSearchEmpty = false;
  bool isSearchLikeEmpty = false;
  int selectedIndex = 0;


  String categoryName = "";

  changeIndex(index) {
    selectedIndex = index;
    notifyListeners();
  }

  getLikedByCategory(String categoryName) {
    if (categoryName == "All") {
      //getAllLiked();
      isCategorySet = false;
      notifyListeners();
    } else {
      listOfLikedByCategory.clear();
      listOfLikedByCategoryId.clear();
      for (int i = 0; i < listOfLiked.length; i++) {
        if (listOfLiked[i].category == categoryName) {
          listOfLikedByCategory.add(listOfLiked[i]);
          listOfLikedByCategoryId.add(listOfLikedId[i]);
        }
      }
      isCategorySet = true;
      notifyListeners();
    }
  }

  getProduct() async {
    isProductLoading = true;
    notifyListeners();
    var res = await firestore.collection("home").get();
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

  // checkIfThereIsLike() {
  //   if(isCategorySet == false && listOfLiked.isNotEmpty){
  //     print(isCategorySet);
  //    isLike = true;
  //   }else if (isCategorySet == true && listOfLikedByCategory.isEmpty){
  //     print("sfs");
  //     print(isCategorySet == true && listOfLikedByCategory.isEmpty);
  //      isLike = false;
  //      notifyListeners();
  //   }
  // }

  getAllLiked() async {
    isLikedLoading = true;
    notifyListeners();
    var res = await firestore.collection("home").where("like", isEqualTo: true).get();
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
    if(isCategorySet){
      listOfLikedByCategory[index].like = false;
      await firestore
          .collection("home")
          .doc(listOfLikedByCategoryId[index])
          .update({"like": listOfLikedByCategory[index].like});
      listOfLikedByCategory.removeAt(index);
      listOfLikedByCategoryId.removeAt(index);
      getAllLiked();
      if (listOfLikedByCategory.isEmpty) isLike = false;
      notifyListeners();
    }
    else{
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
    notifyListeners();
  }

  searchHome(String s) async {
    isSearchEmpty = false;
    notifyListeners();
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
    if(listOfHome.isEmpty) isSearchEmpty = true;
    notifyListeners();
  }

  searchLike(String s) async {
    isSearchLikeEmpty = false;
    notifyListeners();
    listOfLiked.clear();
    listOfHomeId.clear();
    var res = await firestore
        .collection("home").where("like", isEqualTo: true)
        .orderBy("name")
        .startAt([s]).endAt(["$s\uf8ff"]).get();
    for (var element in res.docs) {
      var resCategory = await firestore
          .collection("category")
          .doc(element.data()["category"])
          .get();
      listOfLiked
          .add(HomeModel.fromJson(element.data(), resCategory.data()?["name"]));
      listOfLikedId.add(element.id);
    }
    if(listOfLiked.isEmpty) isSearchLikeEmpty = true;
    notifyListeners();
  }

  enableSearch(){
      isSearching = true;
      notifyListeners();
  }

  disableSearch(){
    isSearching = false;
    notifyListeners();
  }
}
