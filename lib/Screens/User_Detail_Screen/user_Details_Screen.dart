import 'package:flutter/material.dart';
import 'package:mayomart_dashboard/Data_Classes/user_data_class.dart';
import 'package:mayomart_dashboard/Screens/User_Detail_Screen/user_details_form.dart';

class UserDetailsScreen extends StatelessWidget {
  static const String routeName = "User Details Screen";

  UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var user = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      body: UserDetailsForm(
        oldUser: user,
      ),
    );
  }
}
