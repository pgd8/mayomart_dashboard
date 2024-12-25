import 'package:flutter/material.dart';
import 'package:mayomart_dashboard/Shared_Components/field_label.dart';
import '../My_App/app_theme.dart';

class ButtonLabel extends StatelessWidget {
  String label;
  Icon icon;
  ButtonLabel({super.key,required this.label,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Label(labelText: label,
            color: AppTheme.thirdColor),
        icon,
      ],
    );
  }
}
