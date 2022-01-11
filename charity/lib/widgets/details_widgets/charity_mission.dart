import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CharityMission extends StatefulWidget {
  CharityMission({
    Key? key,
    required this.mission,
  }) : super(key: key);

  final String mission;
  bool isExpanded = false;

  @override
  State<CharityMission> createState() => _CharityMissionState();
}

class _CharityMissionState extends State<CharityMission> {
  _toggleContainer() {
    setState(() {
      widget.isExpanded = !widget.isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mission',
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 17,
              ),
            ),
          ),
          AnimatedSize(
            duration: Duration(milliseconds: 500),
            alignment: Alignment.topCenter,
            curve: Curves.easeInOutBack,
            child: Container(
              constraints: widget.isExpanded
                  ? const BoxConstraints(maxHeight: double.infinity)
                  : const BoxConstraints(maxHeight: 50),
              child: Text(widget.mission, overflow: TextOverflow.clip),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedOpacity(
                duration: Duration(milliseconds: 400),
                curve: Curves.easeInOutSine,
                opacity: widget.isExpanded ? 1 : 0,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOutSine,
                  padding: EdgeInsets.symmetric(
                    horizontal: widget.isExpanded ? 8 : 0,
                    vertical: widget.isExpanded ? 4 : 0,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFF57b894),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: AnimatedDefaultTextStyle(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeInOutSine,
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: widget.isExpanded ? 12 : 0,
                      fontWeight: FontWeight.w600,
                    ),
                    child: const Text("Website"),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              AnimatedOpacity(
                duration: Duration(milliseconds: 400),
                opacity: widget.isExpanded ? 1 : 0,
                curve: Curves.easeInOutSine,
                child: AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOutSine,
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontSize: widget.isExpanded ? 12 : 0,
                    fontWeight: FontWeight.w300,
                  ),
                  child: Text(
                    "Is this your organization? ",
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 400),
                opacity: widget.isExpanded ? 1 : 0,
                curve: Curves.easeInOutSine,
                child: AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOutSine,
                  style: GoogleFonts.lato(
                    color: Colors.blue,
                    fontSize: widget.isExpanded ? 12 : 0,
                    fontWeight: FontWeight.w600,
                  ),
                  child: Text("Contact us!"),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  _toggleContainer();
                },
                child: Text(
                  widget.isExpanded ? 'less' : 'more',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
