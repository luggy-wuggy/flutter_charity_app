import 'package:charity/controller/charity_scroll_controller.dart';
import 'package:charity/controller/charity_search_controller.dart';
import 'package:charity/controller/rating_controller.dart';
import 'package:charity/widgets/home_widgets/charity_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CharitySearchList extends StatelessWidget {
  final CharitySearchController _charitySearchController = Get.find();
  final CharityScrollController _charityScrollController = Get.find();

  CharitySearchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Expanded(
          child: _charitySearchController.isLoading.value && _charitySearchController.charityList.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.lightGreenAccent,
                  ),
                )
              : ShaderMask(
                  shaderCallback: (Rect rect) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.purple, Colors.purple, Colors.transparent],
                      stops: [0.0, 0.0, 0.1], // 10% purple, 80% transparent, 10% purple
                    ).createShader(rect);
                  },
                  blendMode: BlendMode.dstOut,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 20),
                    itemCount: _charitySearchController.charityList.length,
                    controller: _charityScrollController.controller,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var charity = _charitySearchController.charityList[index];

                      return CharityCard(charity: charity);
                    },
                  ),
                ),
        );
      },
    );
  }
}
