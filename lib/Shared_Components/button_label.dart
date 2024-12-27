import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayomart_dashboard/My_App/my_provider.dart';
import 'package:provider/provider.dart';
import '../My_App/app_theme.dart';

class ButtonLabel extends StatelessWidget {
  String label;
  Icon icon;

  ButtonLabel({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Row(
      children: [
        Text(label,
            style: TextStyle(
                color: AppTheme.thirdColor,
                fontSize: 22.sp,
                fontFamily: "childos",
                fontWeight: FontWeight.bold)),
        icon,
      ],
    );
  }
}
