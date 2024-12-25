import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayomart_dashboard/My_App/app_theme.dart';
import 'package:mayomart_dashboard/My_App/my_provider.dart';
import 'package:mayomart_dashboard/Pages/History_Page/history_page.dart';
import 'package:mayomart_dashboard/Pages/Invetory_Page/inventory_page.dart';
import 'package:mayomart_dashboard/Pages/Profile_Page/profile_page.dart';
import 'package:mayomart_dashboard/Pages/Settings_Page/settings_page.dart';
import 'package:mayomart_dashboard/Pages/Users_Page/users_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();

  SideMenuController sideMenuController = SideMenuController();

  @override
  void initState() {
    sideMenuController.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    List<SideMenuItem> sideMenuItems = [
      SideMenuItem(
          icon: const Icon(Icons.dashboard),
          title: AppLocalizations.of(context)!.dashboard,
          onTap: (index, sideMenuController) {
            sideMenuController.changePage(index);
          }),
      SideMenuItem(
          icon: const Icon(Icons.inventory),
          title: AppLocalizations.of(context)!.inventory,
          onTap: (index, sideMenuController) {
            sideMenuController.changePage(index);
          }),
      SideMenuItem(
          icon: const Icon(Icons.shopping_cart_rounded),
          title: AppLocalizations.of(context)!.orders,
          onTap: (index, sideMenuController) {
            sideMenuController.changePage(index);
          }),
      SideMenuItem(
          icon: const Icon(Icons.people),
          title: AppLocalizations.of(context)!.users,
          onTap: (index, sideMenuController) {
            sideMenuController.changePage(index);
          }),
      SideMenuItem(
          icon: const Icon(Icons.history),
          title: AppLocalizations.of(context)!.history,
          onTap: (index, sideMenuController) {
            sideMenuController.changePage(index);
          }),
      SideMenuItem(
          icon: const Icon(Icons.person),
          title: AppLocalizations.of(context)!.profile,
          onTap: (index, sideMenuController) {
            sideMenuController.changePage(index);
          }),
      SideMenuItem(
          icon: const Icon(Icons.settings),
          title: AppLocalizations.of(context)!.settings,
          onTap: (index, sideMenuController) {
            sideMenuController.changePage(index);
          }),
    ];
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            style: SideMenuStyle(
              toggleColor: provider.appTheme == ThemeMode.light
                  ? AppTheme.mainColor
                  : AppTheme.thirdColor,
              displayMode: SideMenuDisplayMode.compact,
              selectedIconColor: provider.appTheme == ThemeMode.light
                  ? AppTheme.mainColor
                  : AppTheme.thirdColor,
              unselectedIconColor: Colors.grey,
              selectedTitleTextStyle: TextStyle(
                  color: provider.appTheme == ThemeMode.light
                      ? AppTheme.mainColor
                      : AppTheme.thirdColor,
                  fontFamily: "childos",
                  fontWeight: FontWeight.bold),
              unselectedTitleTextStyle:
                  const TextStyle(fontFamily: "childos", color: Colors.grey),
            ),
            items: sideMenuItems,
            showToggle: true,
            controller: sideMenuController,
            title: Container(
                margin: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.h),
                alignment: Alignment.center,
                width: 60,
                height: 60,
                child: Image.asset("assets/images/logo.png")),
          ),
          Expanded(
              child: PageView(controller: pageController, children: pages)),
        ],
      ),
    );
  }

  List<Widget> pages = [
    Container(),
    InventoryPage(),
    Container(),
    UsersPage(),
    HistoryPage(),
    ProfilePage(),
    SettingsPage(),
  ];
}
