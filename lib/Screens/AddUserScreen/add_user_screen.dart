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

class AddUserScreen extends StatelessWidget {
  static const String routeName = "AddUserScreen";

  AddUserScreen({super.key});

  var userNameCon = TextEditingController();
  var emailCon = TextEditingController();
  var phoneNumberCon = TextEditingController();
  var addressCon = TextEditingController();
  var passwordCon = TextEditingController();
  var confirmPasswordCon = TextEditingController();
  var functions = FirebaseFunctions();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1920, 1080));
    var provider = Provider.of<MyProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
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
                      color: Colors.black),
                  Container(
                    width: 600.w,
                    margin: EdgeInsets.symmetric(vertical: 10),
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
                      color: Colors.black),
                  Container(
                    width: 600.w,
                    margin: EdgeInsets.symmetric(vertical: 10),
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
                      color: Colors.black),
                  Container(
                    width: 600.w,
                    margin: EdgeInsets.symmetric(vertical: 10),
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
                              : Colors.grey.shade400),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Label(
                      labelText: AppLocalizations.of(context)!.address,
                      color: Colors.black),
                  Container(
                    width: 600.w,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      controller: addressCon,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!
                              .addressIsRequired;
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
                      color: Colors.black),
                  Container(
                    width: 600.w,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      controller: passwordCon,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!
                              .passwordIsRequired;
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
                      labelText: AppLocalizations.of(context)!.confirmPassword,
                      color: Colors.black),
                  Container(
                    width: 600.w,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      controller: confirmPasswordCon,
                      validator: (String? value) {
                        if (value!.isEmpty || value != passwordCon.text) {
                          return AppLocalizations.of(context)!
                              .passwordDoesNotMatch;
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
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          showAlert(
                              context, AppLocalizations.of(context)!.loading);
                          functions
                              .addUserToFireStore(createUser())
                              .then((value) {
                            hideAlert(context);
                            showMessage(
                                context,
                                AppLocalizations.of(context)!.done,
                                AppLocalizations.of(context)!.userAdded, () {
                              hideAlert(context);
                              clearFields();
                            },
                                AppLocalizations.of(context)!.ok,
                                Icon(
                                  Icons.done,
                                  color: AppTheme.thirdColor,
                                ));
                          });
                        }
                      },
                      child: ButtonLabel(
                          label: AppLocalizations.of(context)!.addUser,
                          icon: const Icon(
                            Icons.add,
                            color: AppTheme.thirdColor,
                          ))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  User createUser() {
    return User(
        userName: userNameCon.text,
        email: emailCon.text,
        phoneNumber: phoneNumberCon.text,
        password: passwordCon.text,
        address: addressCon.text);
  }

  void clearFields() {
    userNameCon.clear();
    emailCon.clear();
    phoneNumberCon.clear();
    passwordCon.clear();
    confirmPasswordCon.clear();
  }
}
