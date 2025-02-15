import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayomart_dashboard/Data_Classes/order_data_class.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mayomart_dashboard/My_App/app_theme.dart';
import 'package:mayomart_dashboard/Screens/Order_Details_Screen/order_screen.dart';

class HistoryItem extends StatelessWidget {
  final OrderDataClass order;

  const HistoryItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.02.sh),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, OrderDetailsScreen.routeName,
              arguments: order);
        },
        title: Text(
          "${AppLocalizations.of(context)!.totalCost} ${order.totalPrice}",
        ),
        subtitle: Text("${AppLocalizations.of(context)!.items} ${itemCount()}"),
        titleTextStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
        ),
        subtitleTextStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
        ),
        trailing: Text(
          order.id,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
        )
      ),
    );
  }

  int itemCount() {
    int count = 0;
    for (int i = 0; i < order.orderProducts.length; i++) {
      count++;
    }
    return count;
  }
}
