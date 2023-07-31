library toast_notification;

import 'dart:async';

import 'package:flutter/material.dart';

import 'ToasterController.dart';
import 'ToasterType.dart';

/// Toaster is used to add a toaster
/// message kind of like how it appears on the
/// new Threads app.
class Toaster extends StatefulWidget {
  /// Instance variables for the toaster class
  String data;
  ToasterController controller;
  ToasterType type;
  int? duration;
  Color? textColor, iconColor, backgroundColor;
  Toaster(
      {required this.data,
      required this.controller,
      required this.type,
      this.duration,
      this.textColor,
      this.iconColor,
      this.backgroundColor});

  @override
  ToasterState createState() {
    return ToasterState();
  }
}

class ToasterState extends State<Toaster> {
  double position = -50;

  @override
  void initState() {
    super.initState();

    widget.controller.start = start;
    widget.controller.end = end;
    widget.controller.setData = setData;
  }

  void start() {
    setState(() {
      position = 50;
    });

    if (widget.duration != null) {
      pullDown(widget.duration!);
    }
  }

  void end() {
    setState(() {
      position = -50;
    });
  }

  void setData(String data) {
    setState(() {
      widget.data = data;
    });
  }

  void pullDown(int time) {
    Timer(Duration(milliseconds: time), () {
      setState(() {
        end();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    /// these variables are used to assist the sizing of
    /// components inside
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return AnimatedPositioned(
      bottom: position,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: widget.backgroundColor == null
                ? Color(0xFF1a1a1a)
                : widget.backgroundColor),
        height: 65,
        width: screenWidth - 40,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              height: 20,
              width: 20,
              child: (() {
                switch (widget.type) {
                  case ToasterType.Loading:
                    return CircularProgressIndicator(
                      color: widget.iconColor == null
                          ? Colors.white
                          : widget.iconColor,
                    );
                  case ToasterType.Check:
                    return Icon(
                      Icons.check,
                      color: widget.iconColor == null
                          ? Colors.white
                          : widget.iconColor,
                    );
                  case ToasterType.Error:
                    return Icon(
                      Icons.error,
                      color: widget.iconColor == null
                          ? Colors.white
                          : widget.iconColor,
                    );
                  default:
                    return CircularProgressIndicator(
                      color: widget.iconColor == null
                          ? Colors.white
                          : widget.iconColor,
                    );
                }
              }())),
          Text(
            widget.data,
            style: TextStyle(
                color:
                    widget.textColor == null ? Colors.white : widget.textColor),
          )
        ]),
      ),
    );
  }
}
