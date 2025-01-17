import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayomart_dashboard/My_App/app_theme.dart';
import 'package:mayomart_dashboard/My_App/my_provider.dart';
import 'package:mayomart_dashboard/Shared_Components/field_label.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class AddAdminScreen extends StatelessWidget {
  static const String routeName = "AddAdminScreen";

  AddAdminScreen({super.key});

  var userNameCon = TextEditingController();
  var emailCon = TextEditingController();
  var phoneNumberCon = TextEditingController();
  var passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    ScreenUtil.init(context, designSize: const Size(1920, 1080));
    return Scaffold(
      body: Center(
        child: Form(
            child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              Label(
                  labelText: AppLocalizations.of(context)!.userName,
                  color: AppTheme.mainColor),
              Container(
                width: 600.w,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  controller: userNameCon,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.userNameRequired;
                    }
                  },
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: provider.appTheme == ThemeMode.light
                          ? AppTheme.secondColor
                          : Colors.grey.shade400,
                      fontFamily: "childos"),
                ),
              ),
              Label(
                  labelText: AppLocalizations.of(context)!.email,
                  color: AppTheme.mainColor),
              Container(
                width: 600.w,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  controller: emailCon,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.emailIsRequired;
                    }
                  },
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: provider.appTheme == ThemeMode.light
                        ? AppTheme.secondColor
                        : Colors.grey.shade400,
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
