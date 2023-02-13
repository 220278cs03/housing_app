import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:housing_app/controller/home_controller.dart';
import 'package:housing_app/view/pages/home/category_page.dart';
import 'package:housing_app/view/pages/home/separate_page.dart';
import 'package:provider/provider.dart';

import '../../components/home_top_row.dart';
import '../../components/search_row.dart';
import '../../components/unfocused_tap.dart';
import '../../style/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeController>()
        ..getProduct()
        ..getCategory();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final event = context.read<HomeController>();
    final state = context.watch<HomeController>();
    return OnUnFocusTap(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeTopRow(),
            22.verticalSpace,
             SearchRow(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                          height: 135,
                          child: state.isCategoryLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                  color: Style.primaryBlue,
                                ))
                              : ListView.builder(
                                  itemCount: state.listOfCategory.length,
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 28, vertical: 20),
                                        margin:
                                            const EdgeInsets.only(right: 16),
                                        decoration: BoxDecoration(
                                            color: Style.whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Style.borderCategory)),
                                        child: Column(
                                          children: [
                                            Container(
                                                height: 60,
                                                width: 60,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 18,
                                                        vertical: 20),
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Style.bgCategory),
                                                child: Image(
                                                  image: AssetImage(state
                                                              .listOfCategory[
                                                                  index]
                                                              .name ==
                                                          "House"
                                                      ? "assets/image/house.png"
                                                      : state
                                                                  .listOfCategory[
                                                                      index]
                                                                  .name ==
                                                              "Villa"
                                                          ? "assets/image/villa.png"
                                                          : "assets/image/apartment.png"),
                                                  fit: BoxFit.cover,
                                                )),
                                            12.verticalSpace,
                                            Text(
                                              state.listOfCategory[index]
                                                      .name ??
                                                  "",
                                              style: Style.textStyleRegular(),
                                            )
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (_) => CategoryPage(
                                                    title: state
                                                            .listOfCategory[
                                                                index]
                                                            .name ??
                                                        "")));
                                      },
                                    );
                                  })),
                      24.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular",
                            style: Style.textStyleRegular(
                                size: 20, textColor: Style.titleTextColor),
                          ),
                          GestureDetector(
                            child: Text(
                              "See all",
                              style: Style.textStyleRegular(
                                  size: 16, textColor: Style.primaryBlue),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) =>
                                      SeparatePage(title: "Popular")));
                            },
                          ),
                        ],
                      ),
                      24.verticalSpace,
                      SizedBox(
                        height: 275,
                        child: state.isProductLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                color: Style.primaryBlue,
                              ))
                            : state.isSearchEmpty
                                ? Center(
                                    child: Text(
                                    "Nothing found",
                                    style: Style.textStyleRegular(
                                        size: 18, textColor: Style.primaryBlue),
                                  ))
                                : ListView.builder(
                                    itemCount: state.listOfHome.length,
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Container(
                                        width: 220,
                                        margin:
                                            const EdgeInsets.only(right: 20),
                                        decoration: BoxDecoration(
                                            color: Style.whiteColor,
                                            border: Border.all(
                                                color: Style.borderCategory),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 160,
                                              width: 220,
                                              decoration: BoxDecoration(
                                                  color: Style.borderCategory,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  20),
                                                          topLeft:
                                                              Radius.circular(
                                                                  20)),
                                                  image: DecorationImage(
                                                      image: NetworkImage(state
                                                          .listOfHome[index]
                                                          .image),
                                                      fit: BoxFit.cover)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(16),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox.shrink(),
                                                    Container(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8,
                                                          vertical: 4),
                                                      decoration: BoxDecoration(
                                                          color: Style
                                                              .whiteColor
                                                              .withOpacity(0.2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6)),
                                                      child: Row(
                                                        children: [
                                                          const Icon(
                                                            Icons.star,
                                                            color: Style
                                                                .yellowColor,
                                                            size: 18,
                                                          ),
                                                          4.horizontalSpace,
                                                          Text(
                                                            "${state.listOfHome[index].rate}",
                                                            style: Style.textStyleRegular(
                                                                size: 16,
                                                                textColor: Style
                                                                    .ratingTextColor),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 16),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 8,
                                                                vertical: 4),
                                                        decoration: BoxDecoration(
                                                            color: Style
                                                                .whiteColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100),
                                                            border: Border.all(
                                                                color: Style
                                                                    .primaryBlue)),
                                                        child: Text(
                                                          state
                                                              .listOfHome[index]
                                                              .category,
                                                          style: Style
                                                              .textStyleRegular(
                                                                  size: 11,
                                                                  textColor: Style
                                                                      .primaryBlue),
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      RichText(
                                                          text: TextSpan(
                                                              children: [
                                                            TextSpan(
                                                                text:
                                                                    "\$${state.listOfHome[index].price}",
                                                                style: Style
                                                                    .textStyleRegular(
                                                                        size:
                                                                            18,
                                                                        textColor:
                                                                            Style.primaryBlue)),
                                                            TextSpan(
                                                                text: " /month",
                                                                style: Style
                                                                    .textStyleThin(
                                                                        size:
                                                                            11,
                                                                        textColor:
                                                                            Style.monthColor))
                                                          ]))
                                                    ],
                                                  ),
                                                  9.verticalSpace,
                                                  Text(
                                                    state
                                                        .listOfHome[index].name,
                                                    style:
                                                        Style.textStyleRegular(
                                                            size: 18),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.location_on,
                                                        color:
                                                            Style.primaryBlue,
                                                      ),
                                                      4.horizontalSpace,
                                                      Text(
                                                        state.listOfHome[index]
                                                            .location,
                                                        style:
                                                            Style.textStyleThin(
                                                                size: 11),
                                                      ),
                                                      const Spacer(),
                                                      GestureDetector(
                                                        child: Icon(
                                                          state
                                                                  .listOfHome[
                                                                      index]
                                                                  .like
                                                              ? Icons.favorite
                                                              : Icons
                                                                  .favorite_border,
                                                          color:
                                                              Style.primaryBlue,
                                                        ),
                                                        onTap: () {
                                                          event.changeLike(
                                                              index);
                                                        },
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
                      ),
                      24.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Nearby your location",
                            style: Style.textStyleRegular(
                                size: 20, textColor: Style.titleTextColor),
                          ),
                          GestureDetector(
                            child: Text(
                              "See all",
                              style: Style.textStyleRegular(
                                  size: 16, textColor: Style.primaryBlue),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => SeparatePage(
                                      title: "Nearby your location")));
                            },
                          ),
                        ],
                      ),
                      24.verticalSpace,
                      SizedBox(
                        height: 275,
                        child: state.isProductLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                color: Style.primaryBlue,
                              ))
                            : state.isSearchEmpty
                                ? Center(
                                    child: Text(
                                    "Nothing found",
                                    style: Style.textStyleRegular(
                                        size: 18, textColor: Style.primaryBlue),
                                  ))
                                : ListView.builder(
                                    itemCount: state.listOfHome.length,
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Container(
                                        width: 220,
                                        margin:
                                            const EdgeInsets.only(right: 20),
                                        decoration: BoxDecoration(
                                            color: Style.whiteColor,
                                            border: Border.all(
                                                color: Style.borderCategory),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 160,
                                              width: 220,
                                              decoration: BoxDecoration(
                                                  color: Style.borderCategory,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  20),
                                                          topLeft:
                                                              Radius.circular(
                                                                  20)),
                                                  image: DecorationImage(
                                                      image: NetworkImage(state
                                                          .listOfHome[index]
                                                          .image),
                                                      fit: BoxFit.cover)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(16),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox.shrink(),
                                                    Container(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8,
                                                          vertical: 4),
                                                      decoration: BoxDecoration(
                                                          color: Style
                                                              .whiteColor
                                                              .withOpacity(0.2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6)),
                                                      child: Row(
                                                        children: [
                                                          const Icon(
                                                            Icons.star,
                                                            color: Style
                                                                .yellowColor,
                                                            size: 18,
                                                          ),
                                                          4.horizontalSpace,
                                                          Text(
                                                            "${state.listOfHome[index].rate}",
                                                            style: Style.textStyleRegular(
                                                                size: 16,
                                                                textColor: Style
                                                                    .ratingTextColor),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 16),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 8,
                                                                vertical: 4),
                                                        decoration: BoxDecoration(
                                                            color: Style
                                                                .whiteColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100),
                                                            border: Border.all(
                                                                color: Style
                                                                    .primaryBlue)),
                                                        child: Text(
                                                          state
                                                              .listOfHome[index]
                                                              .category,
                                                          style: Style
                                                              .textStyleRegular(
                                                                  size: 11,
                                                                  textColor: Style
                                                                      .primaryBlue),
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      RichText(
                                                          text: TextSpan(
                                                              children: [
                                                            TextSpan(
                                                                text:
                                                                    "\$${state.listOfHome[index].price}",
                                                                style: Style
                                                                    .textStyleRegular(
                                                                        size:
                                                                            18,
                                                                        textColor:
                                                                            Style.primaryBlue)),
                                                            TextSpan(
                                                                text: " /month",
                                                                style: Style
                                                                    .textStyleThin(
                                                                        size:
                                                                            11,
                                                                        textColor:
                                                                            Style.monthColor))
                                                          ]))
                                                    ],
                                                  ),
                                                  9.verticalSpace,
                                                  Text(
                                                    state
                                                        .listOfHome[index].name,
                                                    style:
                                                        Style.textStyleRegular(
                                                            size: 18),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.location_on,
                                                        color:
                                                            Style.primaryBlue,
                                                      ),
                                                      4.horizontalSpace,
                                                      Text(
                                                        state.listOfHome[index]
                                                            .location,
                                                        style:
                                                            Style.textStyleThin(
                                                                size: 11),
                                                      ),
                                                      const Spacer(),
                                                      GestureDetector(
                                                        child: Icon(
                                                          state
                                                                  .listOfHome[
                                                                      index]
                                                                  .like
                                                              ? Icons.favorite
                                                              : Icons
                                                                  .favorite_border,
                                                          color:
                                                              Style.primaryBlue,
                                                        ),
                                                        onTap: () {
                                                          event.changeLike(
                                                              index);
                                                        },
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
                      ),
                      20.verticalSpace
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
