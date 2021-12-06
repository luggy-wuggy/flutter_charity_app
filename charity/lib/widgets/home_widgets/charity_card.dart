import 'package:charity/controller/rating_controller.dart';
import 'package:charity/models/charity_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CharityCard extends StatelessWidget {
  const CharityCard({
    Key? key,
    required this.charity,
  }) : super(key: key);

  final Charity charity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400] as Color,
            blurRadius: 5,
            offset: const Offset(-4, 4),
            spreadRadius: 1,
          )
        ],
      ),
      margin: const EdgeInsets.only(bottom: 25, left: 25, right: 25),
      height: 150,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 80,
                      width: 80,
                      child: GetBuilder<RatingAnimationController>(
                        builder: (_controller) {
                          Get.find<RatingAnimationController>().startAnimation(charity);

                          return CircularProgressIndicator(
                            value: _controller.getRatingValue().value,
                            strokeWidth: 7,
                            color: Color.lerp(
                              Colors.limeAccent,
                              Colors.green[600],
                              _controller.getRatingValue().value,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${charity.currentRating?.score?.round()}',
                          style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 26,
                          ),
                        ),
                        Text(
                          '%',
                          style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${charity.charityName}",
                    style: GoogleFonts.lora(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${charity.tagLine}",
                    style: GoogleFonts.lora(
                      textStyle: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${charity.mailingAddress?.city}, ${charity.mailingAddress?.stateOrProvince}",
                    style: GoogleFonts.lora(
                      textStyle: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
