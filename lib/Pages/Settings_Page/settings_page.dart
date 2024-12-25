import 'package:flutter/material.dart';
import 'package:mayomart_dashboard/Pages/Settings_Page/language_button.dart';
import 'package:mayomart_dashboard/Pages/Settings_Page/mode_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1920, 1080));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ModeButton(),
        SizedBox(height: 50.h,),
        LanguageButton()
      ],
    );
  }
}
