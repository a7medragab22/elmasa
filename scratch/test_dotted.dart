import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

void main() {
  DottedBorder(
    options: RoundedRectDottedBorderOptions(
       radius: const Radius.circular(10),
       dashPattern: [4, 4],
       strokeWidth: 1,
       color: Colors.grey,
    ),
    child: Container(),
  );
}
