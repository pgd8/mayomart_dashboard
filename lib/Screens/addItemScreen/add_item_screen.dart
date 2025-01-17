import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayomart_dashboard/Data_Classes/product_data_class.dart';
import 'package:mayomart_dashboard/Firebase/firebase_functions.dart';
import 'package:mayomart_dashboard/My_App/app_theme.dart';
import 'package:mayomart_dashboard/Shared_Components/button_label.dart';
import 'package:mayomart_dashboard/Shared_Components/field_label.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mayomart_dashboard/Shared_Components/show_alert.dart';
import 'package:provider/provider.dart';

import '../../My_App/my_provider.dart';

class AddItemScreen extends StatefulWidget {
  static const String routeName = "AddItemScreen";

  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  TextEditingController productNameCon = TextEditingController();
  TextEditingController productDescriptionCon = TextEditingController();
  TextEditingController productQuantityInStockCon = TextEditingController();
  TextEditingController productImageCon = TextEditingController();
  TextEditingController productCategoryCon = TextEditingController();
  TextEditingController productMinimumQuantityCon = TextEditingController();
  TextEditingController productMaxQuantityCon = TextEditingController();
  TextEditingController productPriceCon = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    ScreenUtil.init(context, designSize: const Size(1920, 1080));

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: formKey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Label(
                      labelText: AppLocalizations.of(context)!.productName,
                      color: Colors.black),
                  Container(
                    width: 600.w,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      controller: productNameCon,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!
                              .productNameRequired;
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
                  SizedBox(
                    height: 20,
                  ),
                  Label(
                      labelText:
                          AppLocalizations.of(context)!.productDescription,
                      color: Colors.black),
                  Container(
                    width: 600.w,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!
                              .productDescriptionRequired;
                        }
                      },
                      controller: productDescriptionCon,
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: provider.appTheme == ThemeMode.light
                              ? AppTheme.secondColor
                              : Colors.grey.shade400,
                          fontFamily: "childos"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Label(
                      labelText: AppLocalizations.of(context)!.productStock,
                      color: Colors.black),
                  Container(
                    width: 600.w,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!
                              .productStockRequired;
                        }
                      },
                      controller: productQuantityInStockCon,
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: provider.appTheme == ThemeMode.light
                            ? AppTheme.secondColor
                            : Colors.grey.shade400,
                      ),
                    ),
                  ),
                  Label(
                      labelText: AppLocalizations.of(context)!.productImageLink,
                      color: Colors.black),
                  Container(
                    width: 600.w,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!
                              .productImageLinkRequired;
                        }
                      },
                      controller: productImageCon,
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: provider.appTheme == ThemeMode.light
                              ? AppTheme.secondColor
                              : Colors.grey.shade400,
                          fontFamily: "childos"),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Label(
                      labelText: AppLocalizations.of(context)!.productCategory,
                      color: Colors.black),
                  Container(
                    width: 600.w,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!
                              .productCategoryRequired;
                        }
                      },
                      controller: productCategoryCon,
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: provider.appTheme == ThemeMode.light
                              ? AppTheme.secondColor
                              : Colors.grey.shade400,
                          fontFamily: "childos"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Label(
                      labelText:
                          AppLocalizations.of(context)!.productMinQuantity,
                      color: Colors.black),
                  Container(
                    width: 600.w,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!
                              .productMinQuantityRequired;
                        }
                      },
                      controller: productMinimumQuantityCon,
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: provider.appTheme == ThemeMode.light
                            ? AppTheme.secondColor
                            : Colors.grey.shade400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Label(
                      labelText:
                          AppLocalizations.of(context)!.productMaximumQuantity,
                      color: Colors.black),
                  Container(
                    width: 600.w,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!
                              .productMaximumQuantityRequired;
                        }
                      },
                      controller: productMaxQuantityCon,
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: provider.appTheme == ThemeMode.light
                            ? AppTheme.secondColor
                            : Colors.grey.shade400,
                      ),
                    ),
                  ),
                  Label(
                      labelText: AppLocalizations.of(context)!.productPrice,
                      color: Colors.black),
                  Container(
                    width: 600.w,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!
                              .productPriceRequired;
                        }
                      },
                      controller: productPriceCon,
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: provider.appTheme == ThemeMode.light
                            ? AppTheme.secondColor
                            : Colors.grey.shade400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          showAlert(
                              context, AppLocalizations.of(context)!.loading);
                          addProductToFireStore(ProductDataClass(
                                  productImageLink: productImageCon.text,
                                  productName: productNameCon.text,
                                  productDescription:
                                      productDescriptionCon.text,
                                  productCategory: productCategoryCon.text,
                                  productStock: productQuantityInStockCon.text,
                                  productPrice: productPriceCon.text,
                                  maxQuantity: productMaxQuantityCon.text,
                                  minQuantity: productMinimumQuantityCon.text))
                              .then((value) {
                            hideAlert(context);
                            showMessage(
                                context,
                                AppLocalizations.of(context)!.done,
                                AppLocalizations.of(context)!
                                    .productAddedSuccessfully, () {
                              Navigator.pop(context);
                            },
                                AppLocalizations.of(context)!.ok,
                                Icon(
                                  Icons.done,
                                  color: AppTheme.thirdColor,
                                ));
                          });
                          clearFields();
                        }
                      },
                      child: ButtonLabel(
                        label: AppLocalizations.of(context)!.addItem,
                        icon: const Icon(
                          Icons.add,
                          color: AppTheme.thirdColor,
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void clearFields() {
    productNameCon.clear();
    productDescriptionCon.clear();
    productImageCon.clear();
    productCategoryCon.clear();
    productMinimumQuantityCon.clear();
    productMaxQuantityCon.clear();
    productPriceCon.clear();
    productQuantityInStockCon.clear();
  }
}
