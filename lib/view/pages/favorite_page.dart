import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/style.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

  List listOfCategoryName = ["All", "House", "Villa", "Apartment"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 39, left: 24, right: 24),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Text(
              "Favorite",
              style: Style.textStyleRegular(size: 26),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Style.bgCategory,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Style.shadowColor,
                        offset: Offset(0, 0),
                        blurRadius: 50)
                  ]),
              child: Icon(Icons.search, color: Style.primaryBlue),
            ),
            16.horizontalSpace,
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Style.bgCategory,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Style.shadowColor,
                        offset: Offset(0, 0),
                        blurRadius: 50)
                  ]),
              child: Icon(Icons.filter_list, color: Style.primaryBlue),
            ),
          ],
        ),
        26.verticalSpace,
        SizedBox(
          height: 36,
          child: ListView.builder(
            itemCount: 4,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index){
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Style.primaryBlue),
                  color: Style.whiteColor
                ),
                child: Text(listOfCategoryName[index], style: Style.textStyleRegular(size: 16, textColor: Style.primaryBlue),),
              );
          }),
        ),
        120.verticalSpace,
        Center(
          child: Column(
            children: [
              Container(
                  height: 280,
                  width: 290,
                  child: Image.asset("assets/image/not_favorite.png", fit: BoxFit.cover,)),
              24.verticalSpace,
              Text("You don't have a favorite", style: Style.textStyleRegular(size: 26, textColor: Style.primaryBlue),)
            ],
          ),
        )
      ]),
    ));
  }
}
