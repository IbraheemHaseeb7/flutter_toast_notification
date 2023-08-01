library toast_notification;

import 'dart:async';
import 'package:flutter/material.dart';
import 'ToasterController.dart';
import 'ToasterType.dart';

/// Toaster is used to add a toaster
/// message kind of like how it appears on the
/// new Threads app.
class _Toaster extends StatefulWidget {
  /// Instance variables for the toaster class
  String data;
  ToasterController? controller;
  ToasterType type;
  int? duration;
  Color? textColor, iconColor, backgroundColor;

  /// Toaster Class is not intended to be called directly into your
  /// application. It is called in the overlay class only
  _Toaster(
      {required this.data,
      required this.type,
      this.controller,
      this.duration,
      this.textColor,
      this.iconColor,
      this.backgroundColor});

  @override
  _ToasterState createState() {
    return _ToasterState();
  }
}

class _ToasterState extends State<_Toaster>
    with SingleTickerProviderStateMixin {
  double position = -80;

  @override
  void initState() {
    super.initState();

    if (widget.controller != null) {
      widget.controller!.start = start;
      widget.controller!.end = end;
      widget.controller!.setData = setData;
    }
    start();
  }

  /// starts the toast notification
  void start() {
    Timer(const Duration(milliseconds: 100), () {
      setState(() {
        position = 50;
      });
    });

    if (widget.duration != null) {
      pullDown(widget.duration!);
    }
  }

  /// ends the toast notification
  void end() {
    setState(() {
      position = -80;
    });
  }

  /// sets the text for toast notification
  void setData(String data) {
    setState(() {
      widget.data = data;
    });
  }

  /// automatically pulls down the toast notification if duration is set
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
    // double screenHeight = MediaQuery.of(context).size.height;

    return AnimatedPositioned(
      bottom: position,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
      child: Container(
        height: 65,
        margin: const EdgeInsets.only(left: 20),
        padding: const EdgeInsets.only(left: 20, right: 20),
        width: screenWidth - 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: widget.backgroundColor ?? const Color(0xFF1a1a1a)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          // ignore: sized_box_for_whitespace
          Container(
              height: 20,
              width: 20,
              child: (() {
                switch (widget.type) {
                  case ToasterType.Loading:
                    return CircularProgressIndicator(
                      color: widget.iconColor ?? Colors.white,
                    );
                  case ToasterType.Check:
                    return Icon(
                      Icons.check,
                      color: widget.iconColor ?? Colors.white,
                    );
                  case ToasterType.Error:
                    return Icon(
                      Icons.error,
                      color: widget.iconColor ?? Colors.white,
                    );
                  default:
                    return CircularProgressIndicator(
                      color: widget.iconColor ?? Colors.white,
                    );
                }
              }())),
          Text(
            widget.data,
            style: TextStyle(
                color: widget.textColor ?? Colors.white,
                fontSize: 15,
                decoration: TextDecoration.none),
          )
        ]),
      ),
    );
  }
}

/// ToastMe class is your main class to play with
/// where you can set the properties you want for
/// your toast notification and edit it however you
/// wish.
class ToastMe {
  // instance variables for class
  late _Toaster _toaster;
  late String text;
  late ToasterType type;
  late ToasterController? controller;
  late Color? iconColor;
  late Color? backgroundColor;
  late Color? textColor;
  late int? duration;

  /// Constructor that takes in text as string and type as ToasterType.
  /// The rest is just optional
  ToastMe(
      {required this.text,
      required this.type,
      this.controller,
      this.iconColor,
      this.backgroundColor,
      this.textColor,
      this.duration}) {
    _toaster = _Toaster(
      data: text,
      controller: controller,
      type: type,
      iconColor: iconColor,
      backgroundColor: backgroundColor,
      textColor: textColor,
      duration: duration,
    );
  }

  /// call this function to display your toast notification
  /// anywhere in your application. Perhaps on a button click or whenever you want.
  ///
  /// make sure to pass in the context of your builder function for
  /// its proper functioning
  void showToast(BuildContext context) {
    final overlay = Overlay.of(context);

    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => _toaster,
    );
    overlay.insert(overlayEntry);
  }
}
