import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../controller/home_controller.dart';
import '../../components/main_element.dart';
import '../../components/separate_top_row.dart';
import '../../components/unfocused_tap.dart';
import '../../style/style.dart';

// ignore: must_be_immutable
class SeparatePage extends StatefulWidget {
  String title;

  SeparatePage({Key? key, required this.title}) : super(key: key);

  @override
  State<SeparatePage> createState() => _SeparatePageState();
}

class _SeparatePageState extends State<SeparatePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final event = context.read<HomeController>();
    final state = context.watch<HomeController>();
    return OnUnFocusTap(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 39, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SeparateTopRow(title: widget.title),
              26.verticalSpace,
              state.isSearchEmpty ? Center(child: Text("Nothing found", style:Style.textStyleRegular(size: 18, textColor: Style.primaryBlue))) :
              Expanded(
                child: ListView.builder(
                    itemCount: state.listOfHome.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return MainElement(
                          name: state.listOfHome[index].name,
                          location: state.listOfHome[index].location,
                          category: state.listOfHome[index].category,
                          price: state.listOfHome[index].price,
                          rate: state.listOfHome[index].rate,
                          like: state.listOfHome[index].like,
                          image: state.listOfHome[index].image,
                          index: index);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
