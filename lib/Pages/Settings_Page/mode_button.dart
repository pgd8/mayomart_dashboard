import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:mayomart_dashboard/My_App/app_theme.dart';
import 'package:mayomart_dashboard/My_App/my_provider.dart';
import 'package:mayomart_dashboard/Shared_Components/field_label.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ModeButton extends StatefulWidget {
  const ModeButton({super.key});

  @override
  State<ModeButton> createState() => _ModeButtonState();
}

class _ModeButtonState extends State<ModeButton> {
  ActionSliderController controller = ActionSliderController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(
            labelText: AppLocalizations.of(context)!.appMode,
            color: Colors.grey.shade600),
        ActionSlider.standard(
          sliderBehavior: SliderBehavior.stretch,
          rolling: true,
          icon: Icon(
            provider.appTheme == ThemeMode.light
                ? Icons.light_mode_outlined
                : Icons.dark_mode_outlined,
            color: AppTheme.thirdColor,
          ),
          backgroundColor: AppTheme.thirdColor,
          toggleColor: AppTheme.mainColor,
          controller: controller,
          action: (controller) {
            provider.changeAppTheme(provider.appTheme == ThemeMode.light
                ? ThemeMode.dark
                : ThemeMode.light);
            controller.success();
            setState(() {});
            controller.reset();
          },
          width: 500.w,
          successIcon: Icon(Icons.done),
          child: Text(
            provider.appTheme == ThemeMode.light
                ? AppLocalizations.of(context)!.changeToDark
                : AppLocalizations.of(context)!.changeToLight,
            style: TextStyle(
                color: AppTheme.secondColor,
                fontFamily: "childos",
                fontSize: 22.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
