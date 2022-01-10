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

class _CharityMissionState extends State<CharityMission>
    with TickerProviderStateMixin<CharityMission> {
  late AnimationController _controller;
  late Animation<double> _animation;
  late String firstHalf;
  late String secondHalf;

  @override
  void initState() {
    super.initState();
    _seperateText();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutBack,
    );
  }

  _seperateText() {
    if (widget.mission.length > 200) {
      firstHalf = widget.mission.substring(0, 200) + "...";
      secondHalf = widget.mission.substring(200, widget.mission.length);
    } else {
      firstHalf = widget.mission;
      secondHalf = "";
    }
  }

  _toggleContainer() {
    print(_animation.status);
    setState(() {
      widget.isExpanded = !widget.isExpanded;
    });
    if (_animation.status != AnimationStatus.completed) {
      _controller.forward();
    } else {
      _controller.animateBack(0, duration: const Duration(seconds: 1));
    }
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
          const SizedBox(height: 5),
          // Text(
          //   firstHalf,
          //   style: GoogleFonts.lato(
          //     textStyle: const TextStyle(
          //       color: Colors.black,
          //       fontSize: 14,
          //     ),
          //   ),
          // ),
          SizeTransition(
            sizeFactor: _animation,
            axis: Axis.vertical,
            axisAlignment: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.mission,
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: const BoxDecoration(
                        color: Color(0xFF57b894),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        // boxShadow: [
                        //   BoxShadow(
                        //     blurRadius: 3,
                        //     spreadRadius: 1,
                        //     offset: Offset(-2, 2),
                        //     color: Color.fromARGB(255, 214, 211, 211),
                        //   )
                        // ],
                      ),
                      child: Text(
                        "Website",
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Is this your organization? ",
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      "Contact us!",
                      style: GoogleFonts.lato(
                        color: Colors.blue,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // AnimatedSize(
          //   duration: const Duration(milliseconds: 500),
          //   child: ConstrainedBox(
          //     constraints: widget.isExpanded
          //         ? new BoxConstraints()
          //         : new BoxConstraints(maxHeight: 50.0),
          //     child: Text(
          //       widget.mission,
          //       style: GoogleFonts.lato(
          //         textStyle: const TextStyle(
          //           color: Colors.black,
          //           fontSize: 14,
          //         ),
          //       ),
          //       softWrap: true,
          //       overflow: TextOverflow.ellipsis,
          //     ),
          //   ),
          // ),
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
    );
  }
}
