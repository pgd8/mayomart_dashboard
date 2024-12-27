import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayomart_dashboard/My_App/app_theme.dart';
import 'package:mayomart_dashboard/Shared_Components/button_label.dart';

 showAlert(BuildContext context, String title) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                color: AppTheme.secondColor,
                fontSize: 22.sp,
                fontFamily: "childos",
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 20.w,
          ),
          CircularProgressIndicator(),
        ],
      ),
    ),
  );
}

void hideAlert(BuildContext context) {
  Navigator.pop(context);
}

void showMessage(BuildContext context, String message, String description,
    Function() function, String buttonTitle, Icon icon) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: Text(
        message,
        style: TextStyle(
            color: AppTheme.secondColor,
            fontSize: 22.sp,
            fontFamily: "childos",
            fontWeight: FontWeight.bold),
      ),
      content: Text(description),
      actions: [
        ElevatedButton(
            onPressed: function,
            child: ButtonLabel(label: buttonTitle, icon: icon))
      ],
    ),
  );
}


