import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style/style.dart';

class SeparatePage extends StatefulWidget {
  final String title;

  const SeparatePage({Key? key, required this.title}) : super(key: key);

  @override
  State<SeparatePage> createState() => _SeparatePageState();
}

class _SeparatePageState extends State<SeparatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 39, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.arrow_back,
                    color: Style.primaryBlue,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                20.horizontalSpace,
                Text(
                  widget.title,
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
                )
              ],
            ),
            26.verticalSpace,
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(bottom: 24),
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
                                color: Style.primaryBlue,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox.shrink(),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                        color:
                                            Style.whiteColor.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Style.yellowColor,
                                          size: 18,
                                        ),
                                        4.horizontalSpace,
                                        Text(
                                          "4.5",
                                          style: Style.textStyleRegular(
                                              size: 16,
                                              textColor: Style.ratingTextColor),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                          color: Style.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border: Border.all(
                                              color: Style.primaryBlue)),
                                      child: Text(
                                        "Apartment",
                                        style: Style.textStyleRegular(
                                            size: 11,
                                            textColor: Style.primaryBlue),
                                      ),
                                    ),
                                    Spacer(),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: "\$1800",
                                          style: Style.textStyleRegular(
                                              size: 18,
                                              textColor: Style.primaryBlue)),
                                      TextSpan(
                                          text: " /month",
                                          style: Style.textStyleThin(
                                              size: 11,
                                              textColor: Style.monthColor))
                                    ]))
                                  ],
                                ),
                                9.verticalSpace,
                                Text(
                                  "Ownert Apartment",
                                  style: Style.textStyleRegular(size: 18),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Style.primaryBlue,
                                    ),
                                    4.horizontalSpace,
                                    Text(
                                      "Surabaya, Indonesia",
                                      style: Style.textStyleThin(size: 11),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.favorite_border,
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
            ),
          ],
        ),
      ),
    );
  }
}
