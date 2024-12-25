import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Label extends StatelessWidget {
  String labelText;
  Color color;
  Label({super.key, required this.labelText,required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      labelText,
      style: TextStyle(
        color: color,
        fontSize: 22.sp,
        fontFamily: "childos",
        fontWeight: FontWeight.bold
      ),
    );
  }
}
