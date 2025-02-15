import 'package:flutter/material.dart';
import 'package:mayomart_dashboard/Forms/Recommended_Forms/add_recommended_form.dart';

class AddRecommendedScreen extends StatelessWidget {
  static const String routeName = "Add Recommended Screen";

  const AddRecommendedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(30),
          alignment: Alignment.center,
          child: const AddRecommendedForm()),
    );
  }
}
