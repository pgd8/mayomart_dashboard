import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayomart_dashboard/Data_Classes/offer_data_class.dart';
import 'package:mayomart_dashboard/Forms/Offer_Forms/edit_offer_form.dart';

class EditOfferScreen extends StatelessWidget {
  static const String routeName = "EditOfferScreen";

  const EditOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1920, 1080));
    var offer = ModalRoute.of(context)!.settings.arguments as OfferDataClass;
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(30),
          child:  EditOfferForm(offer:offer)),
    );
  }
}
