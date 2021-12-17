import 'package:charity/controller/modules/home/charity_controller.dart';
import 'package:charity/controller/modules/home/charity_scroll_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'charity_card.dart';

class CharityList extends StatelessWidget {
  final CharityController _charityController = Get.find();
  final CharityScrollController _charityScrollController = Get.find();

  CharityList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Expanded(
          child: _charityController.isLoading
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
                      stops: [0.0, 0.0, 0.1],
                    ).createShader(rect);
                  },
                  blendMode: BlendMode.dstOut,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 20),
                    itemCount: _charityController.charityList.length,
                    controller: _charityScrollController.controller,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var charity = _charityController.charityList[index];
                      return CharityCard(charity: charity);
                    },
                  ),
                ),
        );
      },
    );
  }
}
