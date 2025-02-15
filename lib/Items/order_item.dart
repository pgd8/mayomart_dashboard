import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayomart_dashboard/Data_Classes/order_data_class.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mayomart_dashboard/Firebase/firebase_functions.dart';
import 'package:mayomart_dashboard/My_App/app_theme.dart';
import 'package:mayomart_dashboard/Screens/Order_Details_Screen/order_screen.dart';
import 'package:mayomart_dashboard/Shared_Components/show_alert.dart';

class OrderItem extends StatelessWidget {
  final OrderDataClass order;

  const OrderItem({super.key, required this.order});

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
        trailing: ElevatedButton(
            onPressed: () {
              order.isCompleted = true;
              showAlert(context, AppLocalizations.of(context)!.loading);
              addToOrdersHistory(order);
              hideAlert(context);
              showMessage(context, AppLocalizations.of(context)!.done,
                  AppLocalizations.of(context)!.orderCompleted, () {
                deleteOrder(order);
                hideAlert(context);
              },
                  AppLocalizations.of(context)!.ok,
                  const Icon(
                    Icons.done,
                    color: AppTheme.thirdColor,
                  ));
            },
            child: const Icon(
              Icons.thumb_up_outlined,
              color: AppTheme.thirdColor,
            )),
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
