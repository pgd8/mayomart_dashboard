import 'package:flutter/material.dart';
import 'package:mayomart_dashboard/Data_Classes/user_data_class.dart';

class UserItem extends StatelessWidget {
  User user;

  UserItem({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.userName),
      subtitle: Text(user.email),
      trailing: Text(user.phoneNumber),
    );
  }
}
