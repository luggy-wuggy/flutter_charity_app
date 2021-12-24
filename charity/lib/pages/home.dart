import 'package:charity/controller/modules/home/archive/charity_scroll_controller.dart';
import 'package:charity/widgets/home_widgets/category_list.dart';
import 'package:charity/widgets/home_widgets/charity_list.dart';
import 'package:charity/widgets/home_widgets/fab.dart';
import 'package:charity/widgets/home_widgets/header.dart';
import 'package:charity/widgets/home_widgets/title.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const MapFAB(),
      body: Container(
        padding: const EdgeInsets.only(top: 60),
        color: Colors.white,
        child: Column(
          children: [
            const HeaderWidget(),
            AppTitle(),
            CategoryList(),
            CharityListPageView(),
          ],
        ),
      ),
    );
  }
}
