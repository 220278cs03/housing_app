import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:housing_app/view/components/search_row.dart';
import 'package:provider/provider.dart';

import '../../controller/home_controller.dart';
import '../style/style.dart';

class FavoriteTopRow extends StatefulWidget {
  const FavoriteTopRow({Key? key}) : super(key: key);

  @override
  State<FavoriteTopRow> createState() => _FavoriteTopRowState();
}

class _FavoriteTopRowState extends State<FavoriteTopRow> {
  @override
  Widget build(BuildContext context) {
    final event = context.read<HomeController>();
    final state = context.watch<HomeController>();
    return state.isSearching ? SearchRow(isLikePage: true,) : Row(
      children: [
        Text(
          "Favorite",
          style: Style.textStyleRegular(size: 26),
        ),
        const Spacer(),
        GestureDetector(
          child: Container(
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
          onTap: (){
            event.enableSearch();
          },
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
