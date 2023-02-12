import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/style.dart';

class FavoriteTopRow extends StatefulWidget {
  const FavoriteTopRow({Key? key}) : super(key: key);

  @override
  State<FavoriteTopRow> createState() => _FavoriteTopRowState();
}

class _FavoriteTopRowState extends State<FavoriteTopRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
