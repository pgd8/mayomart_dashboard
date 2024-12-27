import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayomart_dashboard/My_App/app_theme.dart';
import 'package:mayomart_dashboard/Screens/addItemScreen/add_item_screen.dart';
import 'package:mayomart_dashboard/Shared_Components/button_label.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InventoryPage extends StatelessWidget {
  InventoryPage({super.key});

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              ElevatedButton(
                onPressed: () {},
                child: ButtonLabel(
                  label: AppLocalizations.of(context)!.deleteItem,
                  icon: Icon(
                    Icons.delete,
                    color: AppTheme.thirdColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
