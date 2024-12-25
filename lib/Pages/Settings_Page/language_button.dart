import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayomart_dashboard/My_App/app_theme.dart';
import 'package:mayomart_dashboard/My_App/my_provider.dart';
import 'package:mayomart_dashboard/Shared_Components/field_label.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class LanguageButton extends StatefulWidget {
  const LanguageButton({super.key});

  @override
  State<LanguageButton> createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<LanguageButton> {
  ActionSliderController controller = ActionSliderController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(
          labelText: AppLocalizations.of(context)!.changeLanguage,
          color: Colors.grey.shade600,
        ),
        ActionSlider.standard(
          width: 500.w,
          sliderBehavior: SliderBehavior.stretch,
          rolling: true,
          icon: Icon(Icons.translate,
              color: AppTheme.thirdColor),
          backgroundColor: AppTheme.thirdColor,
          toggleColor: AppTheme.mainColor,
          action: (controller) {
            provider.changeLanguage();
            controller.success();
            setState(() {});
            controller.reset();
          },
          successIcon: Icon(
            Icons.done,
            color: AppTheme.thirdColor,
          ),
          child: Text(
            provider.language == "en"
                ? AppLocalizations.of(context)!.changeToAr
                : AppLocalizations.of(context)!.changeToEn,
            style: TextStyle(
                color: AppTheme.secondColor,
                fontFamily: "childos",
                fontSize: 22.sp,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
