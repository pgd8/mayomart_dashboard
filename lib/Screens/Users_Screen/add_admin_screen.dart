import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayomart_dashboard/Forms/User_Forms/add_admin_form.dart';

class AddAdminScreen extends StatelessWidget {
  static const String routeName = "AddAdminScreen";

  const AddAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1920, 1080));
    return const Scaffold(
      body: Center(
        child: AddAdminForm(),
      ),
    );
  }
}
