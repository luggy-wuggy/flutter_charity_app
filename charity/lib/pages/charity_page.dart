import 'package:charity/models/charity_info.dart';
import 'package:charity/widgets/details_widgets/category_list_pills.dart';
import 'package:charity/widgets/details_widgets/charity_mission.dart';
import 'package:charity/widgets/details_widgets/charity_title.dart';
import 'package:charity/widgets/details_widgets/details_header.dart';
import 'package:charity/widgets/details_widgets/rating_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CharityPage extends StatelessWidget {
  const CharityPage({
    Key? key,
    required this.charity,
  }) : super(key: key);

  final Charity charity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 60),
        color: Colors.white,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailsHeader(charity: charity),
                const SizedBox(height: 20),
                CharityTitle(charity: charity),
                const SizedBox(height: 10),
                CategoryListPills(
                  category: charity.category!.categoryName!,
                  cause: charity.cause!.causeName!,
                ),
                CharityMission(mission: charity.mission!),
                const SizedBox(height: 10),
                RatingCard(
                  ratings: charity.currentRating!,
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 60,
                  width: 250,
                  margin: const EdgeInsets.only(bottom: 50),
                  decoration: const BoxDecoration(
                    color: Color(0xFF57b894),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFC8E6C9),
                        blurRadius: 10,
                        spreadRadius: 3,
                        offset: Offset(-4, 8),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Donate Now',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
