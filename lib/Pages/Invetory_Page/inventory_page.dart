import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayomart_dashboard/Firebase/firebase_functions.dart';
import 'package:mayomart_dashboard/My_App/app_theme.dart';
import 'package:mayomart_dashboard/Pages/Invetory_Page/Components/products.dart';
import 'package:mayomart_dashboard/Screens/addItemScreen/add_item_screen.dart';
import 'package:mayomart_dashboard/Shared_Components/button_label.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../My_App/my_provider.dart';

class InventoryPage extends StatefulWidget {
  InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  var searchController = TextEditingController();

  FirebaseFunctions firebaseFunction = FirebaseFunctions();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    ScreenUtil.init(context, designSize: const Size(1920, 1080));
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 900.w,
                child: SearchBar(
                  controller: searchController,
                  trailing: Iterable.generate(
                    1,
                    (index) => IconButton(
                        onPressed: () {}, icon: const Icon(Icons.search)),
                  ),
                  hintText: AppLocalizations.of(context)!.searchHere,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AddItemScreen.routeName);
                },
                child: ButtonLabel(
                  label: AppLocalizations.of(context)!.addItem,
                  icon: const Icon(
                    Icons.add,
                    color: AppTheme.thirdColor,
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.refresh,
                    color: provider.appTheme == ThemeMode.light
                        ? AppTheme.secondColor
                        : AppTheme.thirdColor,
                  ))
            ],
          ),
        ),
        Products(),
      ],
    );
  }
}
