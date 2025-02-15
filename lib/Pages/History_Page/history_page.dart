import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mayomart_dashboard/Firebase/firebase_functions.dart';
import 'package:mayomart_dashboard/Items/history_item.dart';
import 'package:mayomart_dashboard/My_App/app_theme.dart';
import 'package:mayomart_dashboard/My_App/my_provider.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1920, 1080));
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 900.w,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
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
              IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.refresh_rounded,
                    color: provider.appTheme == ThemeMode.light
                        ? AppTheme.secondColor
                        : AppTheme.thirdColor,
                  ))
            ],
          ),
          Expanded(
              child: FutureBuilder(
            future: getOrderHistory(),
            builder: (context, snapshot) {
              var ordersHistory =
                  snapshot.data?.docs.map((order) => order.data()).toList() ??
                      [];
              if (ConnectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                return ListView.builder(
                  itemCount: ordersHistory.length,
                  itemBuilder: (context, index) =>
                      HistoryItem(order: ordersHistory[index]),
                );
              }
            },
          )),
        ],
      ),
    );
  }
}
