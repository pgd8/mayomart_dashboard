import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mayomart_dashboard/My_App/my_app.dart';
import 'package:mayomart_dashboard/My_App/my_provider.dart';
import 'package:mayomart_dashboard/Firebase/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(), child: MyApp()));
}
