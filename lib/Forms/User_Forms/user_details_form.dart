import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayomart_dashboard/Data_Classes/user_data_class.dart';
import 'package:mayomart_dashboard/Firebase/firebase_functions.dart';
import 'package:mayomart_dashboard/My_App/app_theme.dart';
import 'package:mayomart_dashboard/My_App/my_provider.dart';
import 'package:mayomart_dashboard/Shared_Components/button_label.dart';
import 'package:mayomart_dashboard/Shared_Components/field_label.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mayomart_dashboard/Shared_Components/show_alert.dart';
import 'package:provider/provider.dart';

class UserDetailsForm extends StatefulWidget {
  @override
  State<UserDetailsForm> createState() =>
      UserDetailsFormState(oldUser: oldUser);
  User oldUser;

  UserDetailsForm({required this.oldUser});
}

class UserDetailsFormState extends State<UserDetailsForm> {
  User oldUser;

  UserDetailsFormState({required this.oldUser});

  var userNameCon = TextEditingController();
  var emailCon = TextEditingController();
  var phoneNumberCon = TextEditingController();
  var addressCon = TextEditingController();
  var passwordCon = TextEditingController();
  var formKey = GlobalKey<FormState>();
  late User user;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    getData();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Label(
                    labelText: AppLocalizations.of(context)!.userName,
                    color: Colors.white),
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
                    color: Colors.white),
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
                Label(
                    labelText: AppLocalizations.of(context)!.phoneNumber,
                    color: Colors.white),
                Container(
                  width: 600.w,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    controller: phoneNumberCon,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!
                            .phoneNumberIsRequired;
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Label(
                    labelText: AppLocalizations.of(context)!.address,
                    color: Colors.white),
                Container(
                  width: 600.w,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    controller: addressCon,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!.addressIsRequired;
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
                    color: Colors.white),
                Container(
                  width: 600.w,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    controller: passwordCon,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!.passwordIsRequired;
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
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          showAlert(
                              context, AppLocalizations.of(context)!.loading);
                          deleteUser(oldUser);
                          hideAlert(context);
                          showMessage(
                              context,
                              AppLocalizations.of(context)!.done,
                              AppLocalizations.of(context)!
                                  .userDeletedSuccessfully, () {
                            hideAlert(context);
                            Navigator.pop(context);
                          },
                              AppLocalizations.of(context)!.ok,
                              const Icon(
                                Icons.done,
                                color: Colors.white,
                              ));
                        },
                        child: ButtonLabel(
                          label: AppLocalizations.of(context)!.deleteUser,
                          icon: const Icon(
                            Icons.person_off_rounded,
                            color: AppTheme.thirdColor,
                          ),
                        )),
                    SizedBox(
                      width: 20.w,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          showAlert(
                              context, AppLocalizations.of(context)!.loading);
                          updateUser(oldUser.id, update());
                          hideAlert(context);
                          showMessage(
                              context,
                              AppLocalizations.of(context)!.done,
                              AppLocalizations.of(context)!.userAdded, () {
                            hideAlert(context);
                          },
                              AppLocalizations.of(context)!.ok,
                              const Icon(
                                Icons.done,
                                color: AppTheme.thirdColor,
                              ));
                        },
                        child: ButtonLabel(
                          label: AppLocalizations.of(context)!.update,
                          icon: const Icon(
                            Icons.update,
                            color: AppTheme.thirdColor,
                          ),
                        ))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  getData() {
    userNameCon.text = oldUser.userName;
    emailCon.text = oldUser.email;
    phoneNumberCon.text = oldUser.phoneNumber;
    addressCon.text = oldUser.address;
    passwordCon.text = oldUser.password;
  }

  User update() {
    return User(
        id: oldUser.id,
        userName: userNameCon.text,
        email: emailCon.text,
        address: addressCon.text,
        phoneNumber: phoneNumberCon.text,
        password: passwordCon.text);
  }
}
