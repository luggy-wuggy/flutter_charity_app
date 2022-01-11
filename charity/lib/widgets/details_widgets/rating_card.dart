import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: const EdgeInsets.symmetric(horizontal: 25.0),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xFFBDBDBD),
            blurRadius: 5,
            offset: Offset(-5, 5),
            spreadRadius: 1.7,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Organization Rating',
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 17,
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'B+',
                        style: GoogleFonts.lato(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      RichText(
                        text: TextSpan(
                          text: "CharityWatch ",
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF207B59),
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Grade',
                              style: GoogleFonts.lato(
                                color: Color(0xFF424242),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "Our independent grade based on a",
                          style: GoogleFonts.lato(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF424242),
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' number of factors',
                              style: GoogleFonts.lato(
                                color: Color(0xFF2A8CB1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Financial Rating',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const LinearProgressIndicator(
                          minHeight: 12,
                          value: 0.8,
                          backgroundColor: Color(0xFFEAEBEB),
                          color: Color(0xFFA6D50A),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Accountability Rating',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const LinearProgressIndicator(
                          minHeight: 12,
                          value: 0.92,
                          backgroundColor: Color(0xFFEAEBEB),
                          color: Color(0xFF187754),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
