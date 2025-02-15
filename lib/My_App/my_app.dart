import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayomart_dashboard/My_App/app_theme.dart';
import 'package:mayomart_dashboard/Screens/Offer_Screens/add_offers_screen.dart';
import 'package:mayomart_dashboard/Screens/Offer_Screens/edit_offer_screen.dart';
import 'package:mayomart_dashboard/Screens/Recommended_Screens/add_recommended_screen.dart';
import 'package:mayomart_dashboard/Screens/Recommended_Screens/edit_recommended_screen.dart';
import 'package:mayomart_dashboard/Screens/HomeScreen/home_screen.dart';
import 'package:mayomart_dashboard/Screens/Order_Details_Screen/order_screen.dart';
import 'package:mayomart_dashboard/Screens/Users_Screen/add_user_screen.dart';
import 'package:mayomart_dashboard/Screens/Users_Screen/user_Details_Screen.dart';
import 'package:mayomart_dashboard/Screens/addItemScreen/add_item_screen.dart';
import 'package:mayomart_dashboard/Screens/poduct_details_screen.dart';
import 'package:provider/provider.dart';
import '../Screens/Users_Screen/add_admin_screen.dart';
import 'my_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      useInheritedMediaQuery: true,
      ensureScreenSize: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Mayo Mart Dash",
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(provider.language),
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: provider.appTheme,
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          AddItemScreen.routeName: (context) => const AddItemScreen(),
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          AddUserScreen.routeName: (context) => AddUserScreen(),
          AddAdminScreen.routeName: (context) => AddAdminScreen(),
          UserDetailsScreen.routeName: (context) => UserDetailsScreen(),
          OrderDetailsScreen.routeName: (context)=>OrderDetailsScreen(),
          AddRecommendedScreen.routeName: (context) => AddRecommendedScreen(),
          EditRecommendedScreen.routeName: (context) => EditRecommendedScreen(),
          AddOffersScreen.routeName: (context) => AddOffersScreen(),
          EditOfferScreen.routeName: (context) => EditOfferScreen(),
        },
      ),
    );
  }
}
