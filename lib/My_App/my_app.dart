import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayomart_dashboard/My_App/app_theme.dart';
import 'package:mayomart_dashboard/Screens/HomeScreen/home_screen.dart';
import 'package:provider/provider.dart';
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
        },
      ),
    );
  }
}
