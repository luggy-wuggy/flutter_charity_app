import 'package:charity/controller/modules/home/rating_controller.dart';
import 'package:charity/models/charity_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CharityCard extends StatelessWidget {
  const CharityCard({
    Key? key,
    required this.charity,
  }) : super(key: key);

  final Charity charity;

  //RatingAnimationController ratingAnimationController = Get.find<RatingAnimationController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CircularPercentIndicator(
                    radius: 80,
                    lineWidth: 7,
                    animation: true,
                    percent: (charity.currentRating?.score)! / 100,
                    animationDuration: 2250,
                    curve: Curves.easeInOutQuint,
                    center: Row(
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
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Color.lerp(
                      Colors.lime[50],
                      Colors.green[600],
                      (charity.currentRating?.score)! / 100,
                    ),
                    backgroundColor: Colors.grey[200]!,
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 15,
                  ),
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
        ),
        FavoriteIcon(charity: charity),
      ],
    );
  }
}

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({Key? key, required this.charity}) : super(key: key);

  final Charity charity;

  @override
  FavoriteIconState createState() => FavoriteIconState();
}

class FavoriteIconState extends State<FavoriteIcon> with TickerProviderStateMixin {
  bool isFavorited = false;

  late AnimationController sizeController;
  late AnimationController colorController;
  late Animation<double> sizeValue;
  late Animation colorValue;

  @override
  void initState() {
    super.initState();
    sizeController = AnimationController(
      vsync: this,
      duration: 300.milliseconds,
    );
    colorController = AnimationController(
      vsync: this,
      duration: 450.milliseconds,
    );

    sizeValue = Tween<double>(begin: 25, end: 35).animate(
      CurvedAnimation(
        parent: sizeController,
        curve: Curves.easeInOutQuint,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          sizeController.reverse();
        }
      });

    colorValue = ColorTween(begin: Colors.white, end: Colors.red[600]).animate(
      CurvedAnimation(
        parent: colorController,
        curve: Curves.easeInOutQuint,
      ),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      right: 45,
      child: GestureDetector(
        onTap: () {
          setState(() {
            isFavorited = !isFavorited;
          });
          sizeController.forward();
          if (isFavorited) {
            colorController.forward();
          } else {
            colorController.reverse();
          }
        },
        child: SizedBox(
          height: sizeValue.value,
          width: sizeValue.value,
          child: FittedBox(
            fit: BoxFit.cover,
            child: isFavorited
                ? Icon(
                    Icons.favorite_rounded,
                    color: colorValue.value,
                  )
                : Icon(
                    Icons.favorite_border_rounded,
                    color: Colors.grey[300],
                  ),
          ),
        ),
      ),
    );
  }
}
