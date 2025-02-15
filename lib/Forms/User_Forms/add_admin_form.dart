import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayomart_dashboard/Data_Classes/admin_data_class.dart';
import 'package:mayomart_dashboard/Firebase/firebase_functions.dart';
import 'package:mayomart_dashboard/My_App/my_provider.dart';
import 'package:mayomart_dashboard/Shared_Components/button_label.dart';
import 'package:mayomart_dashboard/Shared_Components/field_label.dart';
import 'package:mayomart_dashboard/My_App/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mayomart_dashboard/Shared_Components/show_alert.dart';
import 'package:provider/provider.dart';

class AddAdminForm extends StatefulWidget {
  const AddAdminForm({super.key});

  @override
  State<AddAdminForm> createState() => _AddAdminFormState();
}

class _AddAdminFormState extends State<AddAdminForm> {
  var userNameCon = TextEditingController();
  var emailCon = TextEditingController();
  var phoneNumberCon = TextEditingController();
  var passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    ScreenUtil.init(context, designSize: const Size(1920, 1080));

    return Form(
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
              keyboardType: TextInputType.emailAddress,
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
          Label(
              labelText: AppLocalizations.of(context)!.phoneNumber,
              color: AppTheme.mainColor),
          Container(
            width: 600.w,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              controller: phoneNumberCon,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return AppLocalizations.of(context)!.phoneNumberIsRequired;
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
          Label(
              labelText: AppLocalizations.of(context)!.password,
              color: AppTheme.mainColor),
          Container(
            width: 600.w,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: TextFormField(
              controller: passwordCon,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return AppLocalizations.of(context)!.password;
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
          Container(
            width: 600.w,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
                onPressed: () {
                  if (ConnectionState == ConnectionState.waiting) {
                    showAlert(context, AppLocalizations.of(context)!.loading);
                  } else {
                    addAdmin(AdminDataClass(
                        userName: userNameCon.text,
                        email: emailCon.text,
                        phoneNumber: phoneNumberCon.text,
                        password: passwordCon.text));
                    showMessage(context, AppLocalizations.of(context)!.done,
                        AppLocalizations.of(context)!.adminAdded, () {
                      hideAlert(context);
                      clearData();
                    },
                        AppLocalizations.of(context)!.ok,
                        const Icon(
                          Icons.done,
                          color: AppTheme.thirdColor,
                        ));
                  }
                },
                child: ButtonLabel(
                    label: AppLocalizations.of(context)!.addAdmin,
                    icon: const Icon(Icons.add, color: AppTheme.thirdColor))),
          ),
        ],
      ),
    ));
  }

  void clearData() {
    userNameCon.clear();
    emailCon.clear();
    phoneNumberCon.clear();
    passwordCon.clear();
  }
}
