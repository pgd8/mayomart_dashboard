import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mayomart_dashboard/Firebase/firebase_functions.dart';
import 'package:mayomart_dashboard/Items/offer_item.dart';
import 'package:mayomart_dashboard/My_App/app_theme.dart';
import 'package:mayomart_dashboard/My_App/my_provider.dart';
import 'package:mayomart_dashboard/Screens/Offer_Screens/add_offers_screen.dart';
import 'package:mayomart_dashboard/Shared_Components/button_label.dart';
import 'package:provider/provider.dart';

class OffersPage extends StatefulWidget {
  OffersPage({super.key});

  @override
  State<OffersPage> createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  final searchController = SearchController();

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 900.w,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: SearchBar(
                  controller: searchController,

                  trailing: Iterable.generate(
                    0,
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
                    Icons.refresh,
                    color: provider.appTheme == ThemeMode.light
                        ? AppTheme.secondColor
                        : AppTheme.thirdColor,
                  )),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AddOffersScreen.routeName);
                  },
                  child: ButtonLabel(
                      label: AppLocalizations.of(context)!.addOffer,
                      icon: const Icon(
                        Icons.add,
                        color: AppTheme.thirdColor,
                      )))
            ],
          ),
          Expanded(
              child: FutureBuilder(
                  future: getOffers(),
                  builder: (context, snapshot) {
                    var offers = snapshot.data?.docs
                            .map((offer) => offer.data())
                            .toList() ??
                        [];
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Card();
                    } else {
                      return ListView.builder(
                        itemCount: offers.length,
                        itemBuilder: (BuildContext context, int index) =>
                            OfferItem(offer: offers[index]),
                      );
                    }
                  }))
        ],
      ),
    );
  }
}
