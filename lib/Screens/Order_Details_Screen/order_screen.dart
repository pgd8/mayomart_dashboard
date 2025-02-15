import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayomart_dashboard/Data_Classes/order_data_class.dart';
import 'package:mayomart_dashboard/My_App/app_theme.dart';
import 'package:mayomart_dashboard/My_App/my_provider.dart';
import 'package:mayomart_dashboard/Items/cart_Item.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderDetailsScreen extends StatelessWidget {
  static const String routeName = "OrderDetailsScreen";
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    ScreenUtil.init(context, designSize: const Size(1920, 1080));
    var order = ModalRoute.of(context)!.settings.arguments as OrderDataClass;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppTheme.mainColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    "${AppLocalizations.of(context)!.id} ${order.id}",
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: AppTheme.thirdColor,
                        fontFamily: "childos",
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppTheme.mainColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    "${AppLocalizations.of(context)!.userID} ${order.userID}",
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: AppTheme.thirdColor,
                        fontFamily: "childos",
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppTheme.mainColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    "${AppLocalizations.of(context)!.totalCost} ${order.totalPrice}",
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.thirdColor),
                  ),
                ),
              ],
            ),
            Expanded(
                child: ListView.builder(
              itemCount: order.orderProducts.length,
              itemBuilder: (context, index) => CartItem(
                order: order,
                index: index,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
