import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayomart_dashboard/My_App/app_theme.dart';
import 'package:mayomart_dashboard/My_App/my_provider.dart';
import 'package:mayomart_dashboard/Shared_Components/field_label.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool enabled = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1920, 1080));
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: EdgeInsets.all(15.r),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Label(
              labelText: AppLocalizations.of(context)!.userName,
              color: Colors.grey.shade600,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              width: 600.w,
              child: TextFormField(
                enabled: enabled,
                style: TextStyle(
                    color: provider.appTheme == ThemeMode.light
                        ? AppTheme.secondColor
                        : Colors.grey.shade400,
                    fontSize: 20.sp,
                    fontFamily: "childos"),
              ),
            ),
            Label(
                labelText: AppLocalizations.of(context)!.email,
                color: Colors.grey.shade600),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              width: 600.w,
              child: TextFormField(
                enabled: enabled,
                style: TextStyle(
                    fontSize: 20.sp,
                    color: provider.appTheme == ThemeMode.light
                        ? AppTheme.secondColor
                        : Colors.grey.shade400,
                    fontFamily: "childos"),
              ),
            ),
            Label(
                labelText: AppLocalizations.of(context)!.phoneNumber,
                color: Colors.grey.shade600),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              width: 600.w,
              child: TextFormField(
                enabled: enabled,
                style: TextStyle(
                    fontSize: 20.sp,
                    color: provider.appTheme == ThemeMode.light
                        ? AppTheme.secondColor
                        : Colors.grey.shade400,
                    fontFamily: "childos"),
              ),
            ),
            Label(
                labelText: AppLocalizations.of(context)!.password,
                color: Colors.grey.shade600),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              width: 600.w,
              child: TextFormField(
                enabled: enabled,
                obscureText: !enabled,
                style: TextStyle(
                    fontSize: 20.sp,
                    color: provider.appTheme == ThemeMode.light
                        ? AppTheme.secondColor
                        : Colors.grey.shade400,
                    fontFamily: "childos"),
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      if (enabled == false) {
                        enabled = !enabled;
                      }
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        Label(
                            labelText: AppLocalizations.of(context)!.edit,
                            color: AppTheme.thirdColor),
                        Icon(
                          Icons.edit_note_rounded,
                          color: AppTheme.thirdColor,
                        )
                      ],
                    )),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (enabled == true) {
                        enabled = !enabled;
                        setState(() {});
                      }
                    },
                    child: Row(
                      children: [
                        Label(
                            labelText: AppLocalizations.of(context)!.save,
                            color: AppTheme.thirdColor),
                        const Icon(
                          Icons.save_rounded,
                          color: AppTheme.thirdColor,
                        )
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
