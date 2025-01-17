import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mayomart_dashboard/Firebase/firebase_functions.dart';
import 'package:mayomart_dashboard/My_App/app_theme.dart';
import 'package:mayomart_dashboard/My_App/my_provider.dart';
import 'package:mayomart_dashboard/Pages/Users_Page/Component/user_item.dart';
import 'package:mayomart_dashboard/Screens/AddUserScreen/add_user_screen.dart';
import 'package:mayomart_dashboard/Shared_Components/button_label.dart';
import 'package:provider/provider.dart';

class UsersPage extends StatefulWidget {
  UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1920, 1080));
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 900.w,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: SearchBar(
                controller: searchController,
                trailing: Iterable.generate(
                  1,
                  (index) => IconButton(
                      onPressed: () {}, icon: const Icon(Icons.search)),
                ),
                hintText: AppLocalizations.of(context)!.searchHere,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AddUserScreen.routeName);
                },
                child: ButtonLabel(
                    label: AppLocalizations.of(context)!.addUser,
                    icon: Icon(
                      Icons.person_add_alt_1,
                      color: AppTheme.thirdColor,
                    ))),
            IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: Icon(
                  Icons.refresh,
                  color: provider.appTheme == ThemeMode.light
                      ? AppTheme.secondColor
                      : AppTheme.thirdColor,
                ))
          ],
        ),
        Expanded(
            child: FutureBuilder(
                future: getUser(),
                builder: (context, snapshot) {
                  var users =
                      snapshot.data?.docs.map((user) => user.data()).toList() ??
                          [];
                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (BuildContext context, int index) =>
                        UserItem(user: users[index]),
                  );
                }))
      ]),
    );
  }
}
