import 'package:flutter/material.dart';
import 'package:mayomart_dashboard/Data_Classes/recommended_data_class.dart';
import 'package:mayomart_dashboard/Forms/Recommended_Forms/add_recommended_form.dart';
import 'package:mayomart_dashboard/Forms/Recommended_Forms/edit_recommended_form.dart';

class EditRecommendedScreen extends StatelessWidget {
  static const String routeName = "Edit Recommended Screen";

  const EditRecommendedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var recommended =
        ModalRoute.of(context)!.settings.arguments as RecommendedDataClass;
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(30),
          alignment: Alignment.center,
          child: EditRecommendedForm(recommended: recommended)),
    );
  }
}
