import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayomart_dashboard/Data_Classes/order_data_class.dart';
import 'package:mayomart_dashboard/Firebase/firebase_functions.dart';
import 'package:mayomart_dashboard/My_App/app_theme.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class OrdersProgress extends StatelessWidget {
  OrdersProgress({super.key});

  @override
  Widget build(BuildContext context) {
    List<OrderDataClass> orders = [];
    var valueNotifier = ValueNotifier(orders.length.toDouble());
    return SimpleCircularProgressBar(
      progressColors: [AppTheme.mainColor],
      valueNotifier: valueNotifier,
      size: 0.12.sw,
      onGetText: (double value) {
        FutureBuilder(
          future: getOrder(),
          builder: (context, snapshot) {
             orders =
                snapshot.data?.docs.map((order) => order.data()).toList() ?? [];
            return Text("${orders.length}");
          },
        );
        return Text("${orders.length}",style: TextStyle(fontSize: 30.sp),);
      },
      animationDuration: 4,
      startAngle: 0.0,
    );
  }
}
