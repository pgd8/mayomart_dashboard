import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayomart_dashboard/Data_Classes/order_data_class.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mayomart_dashboard/My_App/app_theme.dart';

class CartItem extends StatelessWidget {
  final OrderDataClass order;
  int index;

  CartItem({super.key, required this.order, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListTile(
        title: Text(order.orderProducts[index].product.productName),
        subtitle: Text(
            "${AppLocalizations.of(context)!.itemCount}${order.orderProducts[index].quantity}"),
        subtitleTextStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
        ),
        trailing: Image.network(
          order.orderProducts[index].product.productImageLink,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) => Icon(
            Icons.error,
            color: AppTheme.mainColor,
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
