import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:housing_app/view/components/search_row.dart';
import 'package:provider/provider.dart';

import '../../controller/home_controller.dart';
import '../style/style.dart';

// ignore: must_be_immutable
class SeparateTopRow extends StatefulWidget {
  String title;
  SeparateTopRow({Key? key, required this.title}) : super(key: key);

  @override
  State<SeparateTopRow> createState() => _SeparateTopRowState();
}

class _SeparateTopRowState extends State<SeparateTopRow> {
  @override
  Widget build(BuildContext context) {
    final event = context.read<HomeController>();
    final state = context.watch<HomeController>();
    return  state.isSearching ? SearchRow() : Row(
      children: [
        GestureDetector(
          child: const Icon(
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
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
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
          child: GestureDetector(child: const Icon(Icons.search, color: Style.primaryBlue), onTap: (){
            event.enableSearch();
          },),
        )
      ],
    );
  }
}
