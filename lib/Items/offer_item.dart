import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayomart_dashboard/Data_Classes/offer_data_class.dart';
import 'package:mayomart_dashboard/Data_Classes/order_data_class.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mayomart_dashboard/My_App/app_theme.dart';
import 'package:mayomart_dashboard/Screens/Offer_Screens/edit_offer_screen.dart';
import 'package:mayomart_dashboard/Screens/Order_Details_Screen/order_screen.dart';

class OfferItem extends StatelessWidget {
  final OfferDataClass offer;

  const OfferItem({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.02.sh),
      child: ListTile(
          onTap: () {
            Navigator.pushNamed(context, EditOfferScreen.routeName,
                arguments: offer);
          },
          title: Text(
            "${AppLocalizations.of(context)!.title}: ${offer.title}",
          ),
          subtitle: Text("${AppLocalizations.of(context)!.id}: ${offer.id}"),
          titleTextStyle: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
          subtitleTextStyle: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
          trailing: Image.network(
            offer.imagePath,
            errorBuilder: (context, error, stackTrace) =>
                Text(error.toString()),
          )),
    );
  }
}
