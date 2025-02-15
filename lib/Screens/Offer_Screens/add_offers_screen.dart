import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayomart_dashboard/Forms/Offer_Forms/add_offer_form.dart';

class AddOffersScreen extends StatelessWidget {
  static const String routeName = "AddOffersScreen";

  const AddOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1920, 1080));
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(30),
          child: const OfferForm()),
    );
  }
}
