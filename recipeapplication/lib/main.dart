import 'package:flutter/material.dart';
import 'package:recipeapplication/homePage.dart';
import 'package:recipeapplication/screens/auth/login.dart';
import 'package:recipeapplication/utils/screen_size.dart';
import 'package:recipeapplication/utils/theme.dart';
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // socketService.createSocketConnection();
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return MaterialApp(
          theme: themeData,
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        );
      });
    });
  }
}
