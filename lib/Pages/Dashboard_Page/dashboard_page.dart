import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayomart_dashboard/My_App/app_theme.dart';
import 'package:mayomart_dashboard/Shared_Components/field_label.dart';
import 'package:mayomart_dashboard/Shared_Components/orders_progress.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1920, 1080));
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Label(labelText: AppLocalizations.of(context)!.numOfOrders,
              color: AppTheme.thirdColor),
          Container(
            width: double.infinity,
            height: 0.4.sh,
            margin:const  EdgeInsets.all(25),
            alignment: Alignment.topLeft,
            child: const OrdersProgress(),
          ),
        ],
      ),
    );
  }
}
