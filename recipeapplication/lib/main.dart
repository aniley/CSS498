import 'package:flutter/material.dart';
import 'package:recipeapplication/screens/auth/login.dart';
import 'package:recipeapplication/utils/screen_size.dart';
import 'package:recipeapplication/utils/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
          home: LoginScreen(),
        );
      });
    });
  }
}

