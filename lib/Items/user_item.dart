import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayomart_dashboard/Data_Classes/user_data_class.dart';
import 'package:mayomart_dashboard/Screens/Users_Screen/user_Details_Screen.dart';

class UserItem extends StatelessWidget {
  User user;

  UserItem({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      child: ListTile(
        title: Text(user.userName),
        subtitle: Text(user.email),
        trailing: Text(user.phoneNumber),
        onTap: () {
          Navigator.pushNamed(context, UserDetailsScreen.routeName,
              arguments: user);
        },
        subtitleTextStyle: TextStyle(
          color: Colors.grey.shade800,
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
