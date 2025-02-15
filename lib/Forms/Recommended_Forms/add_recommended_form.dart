import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayomart_dashboard/Data_Classes/recommended_data_class.dart';
import 'package:mayomart_dashboard/Firebase/firebase_functions.dart';
import 'package:mayomart_dashboard/My_App/app_theme.dart';
import 'package:mayomart_dashboard/My_App/my_provider.dart';
import 'package:mayomart_dashboard/Shared_Components/button_label.dart';
import 'package:mayomart_dashboard/Shared_Components/field_label.dart';
import 'package:mayomart_dashboard/Shared_Components/show_alert.dart';
import 'package:provider/provider.dart';

class RecommendedForm extends StatefulWidget {
  const RecommendedForm({super.key});

  @override
  State<RecommendedForm> createState() => _RecommendedFormState();
}

class _RecommendedFormState extends State<RecommendedForm> {
  final titleCon = TextEditingController();

  final descriptionCon = TextEditingController();

  final imagePathCon = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    ScreenUtil.init(context, designSize: const Size(1920, 1080));
    return Form(
      key: formKey,
      child: Column(
        children: [
          Label(
              labelText: AppLocalizations.of(context)!.title,
              color: AppTheme.mainColor),
          Container(
            margin: EdgeInsets.symmetric(vertical: 25.h),
            width: 600.w,
            child: TextFormField(
              controller: titleCon,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppLocalizations.of(context)!.titleIsRequired;
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
              labelText: AppLocalizations.of(context)!.description,
              color: AppTheme.mainColor),
          Container(
            width: 600.w,
            margin: EdgeInsets.symmetric(vertical: 25.h),
            child: TextFormField(
              controller: descriptionCon,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return AppLocalizations.of(context)!
                      .productDescriptionRequired;
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
              labelText: AppLocalizations.of(context)!.imagePath,
              color: AppTheme.mainColor),
          Container(
            width: 600.w,
            margin: EdgeInsets.symmetric(vertical: 25.h),
            child: TextFormField(
              controller: imagePathCon,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppLocalizations.of(context)!.productImageLinkRequired;
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
            margin: EdgeInsets.symmetric(vertical: 25.h),
            child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (ConnectionState == ConnectionState.waiting) {
                      showAlert(context, AppLocalizations.of(context)!.loading);
                    }
                    showMessage(context, AppLocalizations.of(context)!.done,
                        AppLocalizations.of(context)!.recommendedAdded, () {
                      addRecommended(RecommendedDataClass(
                          title: titleCon.text,
                          description: descriptionCon.text,
                          imagePath: imagePathCon.text));
                      hideAlert(context);
                      clearData();
                      setState(() {});
                    },
                        AppLocalizations.of(context)!.ok,
                        const Icon(
                          Icons.thumb_up_outlined,
                          color: AppTheme.thirdColor,
                        ));
                  }
                },
                child: ButtonLabel(
                  icon: const Icon(
                    Icons.add_rounded,
                    color: AppTheme.thirdColor,
                  ),
                  label: AppLocalizations.of(context)!.recommendedAdded,
                )),
          ),
        ],
      ),
    );
  }

  void clearData() {
    titleCon.clear();
    descriptionCon.clear();
    imagePathCon.clear();
  }
}
