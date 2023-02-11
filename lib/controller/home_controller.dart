import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:housing_app/model/category_model.dart';

import '../model/home_model.dart';

class HomeController extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<HomeModel> listOfHome = [];
  List<CategoryModel> listOfCategory = [];
  List<HomeModel> listOfLiked = [];
  List listOfHomeId = [];
  List listOfLikedId = [];
  List listOfCategoryName = [];
  bool isProductLoading = false;
  bool isCategoryLoading = false;
  bool isLikedLoading = false;
  bool isLike = false;


  String categoryName = "";

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
    List addDocIdList = [];
    firestore
        .collection("home")
        .doc(listOfHomeId[index])
        .update({"like": listOfHome[index].like});
    notifyListeners();
  }

  checkIfThereIsLike(){
    for(int i=0; i<listOfHome.length; i++){
      if(listOfHome[i].like){
        isLike = true;
        break;
      }
    }
  }

  getAllLiked() async {
    isLikedLoading = true;
    notifyListeners();
    var res;
    res = await firestore.collection("home").where("like", isEqualTo: true).get();
    listOfLiked.clear();
    listOfLikedId.clear();
    for(var element in res.docs){
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

// getCategoryName() async {
//   isCategoryLoading = true;
//   notifyListeners();
//   listOfCategoryName.clear();
//   for(int i=0; i<listOfCategoryId.length; i++){
//     final docRef = await firestore.collection("category").doc(listOfCategoryId[i]).get();
//     var name = CategoryModel.fromJson(docRef.data()!);
//     listOfCategoryName.add(name.name);
//   }
//   print("getName ${listOfCategoryId.length}");
//  // print(listOfCategoryName);
//   isCategoryLoading = false;
//   notifyListeners();
//   //notifyListeners();
// }
}
