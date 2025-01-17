import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayomart_dashboard/Data_Classes/product_data_class.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mayomart_dashboard/Firebase/firebase_functions.dart';
import 'package:mayomart_dashboard/My_App/app_theme.dart';
import 'package:mayomart_dashboard/My_App/my_provider.dart';
import 'package:mayomart_dashboard/Screens/HomeScreen/home_screen.dart';
import 'package:mayomart_dashboard/Shared_Components/button_label.dart';
import 'package:mayomart_dashboard/Shared_Components/show_alert.dart';
import 'package:provider/provider.dart';
import '../Shared_Components/field_label.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = "Product Details";

  ProductDetailScreen({super.key});

  var productNameCon = TextEditingController();
  var productDescriptionCon = TextEditingController();
  var productQuantityInStockCon = TextEditingController();
  var productImageCon = TextEditingController();
  var productCategoryCon = TextEditingController();
  var productMinimumQuantityCon = TextEditingController();
  var productMaxQuantityCon = TextEditingController();
  var productPriceCon = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isUpdated = false;

  getData(ProductDataClass product) {
    productNameCon.text = product.productName;
    productDescriptionCon.text = product.productDescription;
    productQuantityInStockCon.text = product.productStock.toString();
    productImageCon.text = product.productImageLink;
    productCategoryCon.text = product.productCategory;
    productMinimumQuantityCon.text = product.minQuantity.toString();
    productMaxQuantityCon.text = product.maxQuantity.toString();
    productPriceCon.text = product.productPrice.toString();
    return product;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1920, 1080));

    var provider = Provider.of<MyProvider>(context);
    var product =
        ModalRoute.of(context)!.settings.arguments as ProductDataClass;
    isUpdated ? clearFields() : getData(product);
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
                    margin: const EdgeInsets.symmetric(vertical: 10),
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
                  const SizedBox(
                    height: 20,
                  ),
                  Label(
                      labelText:
                          AppLocalizations.of(context)!.productDescription,
                      color: Colors.black),
                  Container(
                    width: 600.w,
                    margin: const EdgeInsets.symmetric(vertical: 10),
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
                  const SizedBox(
                    height: 20,
                  ),
                  Label(
                      labelText: AppLocalizations.of(context)!.productStock,
                      color: Colors.black),
                  Container(
                    width: 600.w,
                    margin: const EdgeInsets.symmetric(vertical: 10),
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
                    margin: const EdgeInsets.symmetric(vertical: 10),
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
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          isUpdated = !isUpdated;
                          var newProduct = ProductDataClass(
                              productImageLink: productImageCon.text,
                              productName: productNameCon.text,
                              productDescription: productDescriptionCon.text,
                              productCategory: productCategoryCon.text,
                              productStock: productQuantityInStockCon.text,
                              productPrice: productPriceCon.text,
                              maxQuantity: productMaxQuantityCon.text,
                              minQuantity: productMinimumQuantityCon.text);
                          showAlert(
                              context, AppLocalizations.of(context)!.loading);
                          updateProduct(product.id, newProduct).then((value) {
                            hideAlert(context);
                            getData(newProduct);
                            showMessage(
                                context,
                                AppLocalizations.of(context)!.done,
                                AppLocalizations.of(context)!
                                    .productUpdatedSuccessfully, () {
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
                          label: AppLocalizations.of(context)!.save,
                          icon: const Icon(
                            Icons.save_rounded,
                            color: AppTheme.thirdColor,
                          )))
                ],
              ),
              Column(
                children: [
                  Label(
                      labelText: AppLocalizations.of(context)!.productCategory,
                      color: Colors.black),
                  Container(
                    width: 600.w,
                    margin: const EdgeInsets.symmetric(vertical: 10),
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
                  const SizedBox(
                    height: 20,
                  ),
                  Label(
                      labelText:
                          AppLocalizations.of(context)!.productMinQuantity,
                      color: Colors.black),
                  Container(
                    width: 600.w,
                    margin: const EdgeInsets.symmetric(vertical: 10),
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
                  const SizedBox(
                    height: 20,
                  ),
                  Label(
                      labelText:
                          AppLocalizations.of(context)!.productMaximumQuantity,
                      color: Colors.black),
                  Container(
                    width: 600.w,
                    margin: const EdgeInsets.symmetric(vertical: 10),
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
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!
                              .productPriceRequired;
                        }
                      },
                      controller: productPriceCon,
                      keyboardType: const TextInputType.numberWithOptions(
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
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        deleteProduct(product);
                        showMessage(
                            context,
                            AppLocalizations.of(context)!.done,
                            AppLocalizations.of(context)!
                                .productDeletedSuccessfully, () {
                          hideAlert(context);
                          Navigator.popAndPushNamed(
                              context, HomeScreen.routeName);
                        },
                            AppLocalizations.of(context)!.ok,
                            const Icon(
                              Icons.done,
                              color: AppTheme.thirdColor,
                            ));
                        clearFields();
                      },
                      child: ButtonLabel(
                        label: AppLocalizations.of(context)!.deleteItem,
                        icon: const Icon(
                          Icons.delete,
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
