import 'package:flutter/material.dart';
import 'package:mayomart_dashboard/Pages/Settings_Page/language_button.dart';
import 'package:mayomart_dashboard/Pages/Settings_Page/mode_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayomart_dashboard/Screens/Users_Screen/add_admin_screen.dart';
import 'package:mayomart_dashboard/Shared_Components/button_label.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1920, 1080));
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModeButton(),
          SizedBox(
            height: 50.h,
          ),
          LanguageButton(),
          SizedBox(
            height: 50.h,
          ),
          Container(
            width: 350.w,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AddAdminScreen.routeName);
                },
                child: ButtonLabel(
                    label: AppLocalizations.of(context)!.addAdmin,
                    icon: Icon(
                      Icons.admin_panel_settings,
                      color: Colors.white,
                    ))),
          )
        ],
      ),
    );
  }
}
