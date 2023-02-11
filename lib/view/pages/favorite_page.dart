import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../controller/home_controller.dart';
import '../style/style.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List listOfCategoryName = ["All", "House", "Villa", "Apartment"];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeController>()
        ..checkIfThereIsLike()
        ..getAllLiked();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final event = context.read<HomeController>();
    final state = context.watch<HomeController>();
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 39, left: 24, right: 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Text(
              "Favorite",
              style: Style.textStyleRegular(size: 26),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Style.bgCategory,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                        color: Style.shadowColor,
                        offset: Offset(0, 0),
                        blurRadius: 50)
                  ]),
              child: const Icon(Icons.search, color: Style.primaryBlue),
            ),
            16.horizontalSpace,
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Style.bgCategory,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                        color: Style.shadowColor,
                        offset: Offset(0, 0),
                        blurRadius: 50)
                  ]),
              child: const Icon(Icons.filter_list, color: Style.primaryBlue),
            ),
          ],
        ),
        26.verticalSpace,
        SizedBox(
          height: 36,
          child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Style.primaryBlue),
                      color: Style.whiteColor),
                  child: Text(
                    listOfCategoryName[index],
                    style: Style.textStyleRegular(
                        size: 16, textColor: Style.primaryBlue),
                  ),
                );
              }),
        ),
        !state.isLike
            ? Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                          height: 280,
                          width: 290,
                          child: Image.asset(
                            "assets/image/not_favorite.png",
                            fit: BoxFit.cover,
                          )),
                      24.verticalSpace,
                      Text(
                        "You don't have a favorite",
                        style: Style.textStyleRegular(
                            size: 26, textColor: Style.primaryBlue),
                      )
                    ],
                  ),
                ),
              )
            : state.isLikedLoading
                ? const Padding(
                    padding: EdgeInsets.only(top: 120),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Style.primaryBlue,
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 24),
                        itemCount: state.listOfLiked.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(bottom: 24),
                            decoration: BoxDecoration(
                                color: Style.whiteColor,
                                border: Border.all(color: Style.borderCategory),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Container(
                                  height: 160,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Style.borderCategory,
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          topLeft: Radius.circular(20)),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              state.listOfLiked[index].image),
                                          fit: BoxFit.cover)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox.shrink(),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                              color: Style.whiteColor
                                                  .withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Style.yellowColor,
                                                size: 18,
                                              ),
                                              4.horizontalSpace,
                                              Text(
                                                "${state.listOfLiked[index].rate}",
                                                style: Style.textStyleRegular(
                                                    size: 16,
                                                    textColor:
                                                        Style.ratingTextColor),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 4),
                                            decoration: BoxDecoration(
                                                color: Style.whiteColor,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                border: Border.all(
                                                    color: Style.primaryBlue)),
                                            child: Text(
                                              state.listOfLiked[index].category,
                                              style: Style.textStyleRegular(
                                                  size: 11,
                                                  textColor: Style.primaryBlue),
                                            ),
                                          ),
                                          const Spacer(),
                                          RichText(
                                              text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    "\$${state.listOfLiked[index].price}",
                                                style: Style.textStyleRegular(
                                                    size: 18,
                                                    textColor:
                                                        Style.primaryBlue)),
                                            TextSpan(
                                                text: " /month",
                                                style: Style.textStyleThin(
                                                    size: 11,
                                                    textColor:
                                                        Style.monthColor))
                                          ]))
                                        ],
                                      ),
                                      9.verticalSpace,
                                      Text(
                                        state.listOfLiked[index].name,
                                        style: Style.textStyleRegular(size: 18),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            color: Style.primaryBlue,
                                          ),
                                          4.horizontalSpace,
                                          Text(
                                            state.listOfLiked[index].location,
                                            style:
                                                Style.textStyleThin(size: 11),
                                          ),
                                          const Spacer(),
                                          const Icon(
                                            Icons.favorite,
                                            color: Style.primaryBlue,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  )
      ]),
    ));
  }
}
