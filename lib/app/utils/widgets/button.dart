// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Button extends StatelessWidget {
  var onTap;
  final bool bold;
  final bool state;
  final String title;
  final double width;
  final double height;
  final double margin;
  final double padding;
  final Color itemColor;
  final Color textColor;
  final Color loaderColor;
  final Color borderColor;
  Button({
    Key? key,
    required this.onTap,
    required this.bold,
    required this.state,
    required this.title,
    required this.width,
    required this.height,
    required this.margin,
    required this.padding,
    required this.itemColor,
    required this.textColor,
    required this.loaderColor,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (state == true
        ? Container(
            padding:
                const EdgeInsets.only(top: 7, left: 10, right: 10, bottom: 7),
            child: const SpinKitCircle(
              color: Colors.blue,
              size: 70,
            ))
        : Container(
            height: height,
            width: width,
            margin: EdgeInsets.all(margin),
            alignment: Alignment.center,
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: borderColor),
              color: itemColor,
            ),
            child: InkWell(
                onTap: onTap,
                child: Center(
                    child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: (bold) ? FontWeight.bold : FontWeight.normal,
                      color: textColor),
                ))),
          ));
  }
}
