import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class UsersPage extends StatelessWidget {
  UsersPage({super.key});

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1920, 1080));

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: 900.w,
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: SearchBar(
          controller: searchController,
          trailing: Iterable.generate(
            1,
                (index) =>
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ),
          hintText: AppLocalizations.of(context)!.searchHere,
        ),
      ),
    ]);
  }
}
