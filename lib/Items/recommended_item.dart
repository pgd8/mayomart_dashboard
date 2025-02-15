import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mayomart_dashboard/Data_Classes/recommended_data_class.dart';
import 'package:mayomart_dashboard/Screens/Recommended_Screens/edit_recommended_screen.dart';

class RecommendedItem extends StatelessWidget {
  final RecommendedDataClass recommended;

  const RecommendedItem({super.key, required this.recommended});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.02.sh),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, EditRecommendedScreen.routeName,
              arguments: recommended);
        },
        title: Text(
            "${AppLocalizations.of(context)!.title}: ${recommended.title}"),
        subtitle:
            Text("${AppLocalizations.of(context)!.id}: ${recommended.id}"),
        subtitleTextStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
        ),
        trailing: Image.network(
          recommended.imagePath,
          errorBuilder: (context, error, stackTrace) => Text(error.toString()),
        ),
      ),
    );
  }
}
