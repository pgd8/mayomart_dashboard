import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayomart_dashboard/My_App/app_theme.dart';
import 'package:mayomart_dashboard/My_App/my_provider.dart';
import 'package:provider/provider.dart';

class Label extends StatelessWidget {
  String labelText;
  Color color;

  Label({super.key, required this.labelText, required this.color});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Text(
      labelText,
      style: TextStyle(
          color: provider.appTheme == ThemeMode.light
              ? AppTheme.secondColor
              : AppTheme.thirdColor,
          fontSize: 22.sp,
          fontFamily: "childos",
          fontWeight: FontWeight.bold),
    );
  }
}
