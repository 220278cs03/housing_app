import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../controller/home_controller.dart';
import '../../components/main_element.dart';
import '../../components/separate_top_row.dart';

class SeparatePage extends StatefulWidget {
  final String title;

  const SeparatePage({Key? key, required this.title}) : super(key: key);

  @override
  State<SeparatePage> createState() => _SeparatePageState();
}

class _SeparatePageState extends State<SeparatePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeController>().byCategory(widget.title);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final event = context.read<HomeController>();
    final state = context.watch<HomeController>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 39, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SeparateTopRow(title: widget.title),
            26.verticalSpace,
            Expanded(
              child: ListView.builder(
                  itemCount: state.listOfHomeByCategory.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return MainElement(
                      name: state.listOfHomeByCategory[index].name,
                      location: state.listOfHomeByCategory[index].location,
                      category: state.listOfHomeByCategory[index].category,
                      price: state.listOfHomeByCategory[index].price,
                      rate: state.listOfHomeByCategory[index].rate,
                      like: state.listOfHomeByCategory[index].like,
                      image: state.listOfHomeByCategory[index].image,
                      index: state.listOfHome.indexOf(state.listOfHomeByCategory[index]),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
