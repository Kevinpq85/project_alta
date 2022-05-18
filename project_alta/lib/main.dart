import 'package:flutter/material.dart';
import 'package:project_alta/View/HomeView/home_view_model.dart';
import 'package:project_alta/View/SplachView/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HomeViewModel())],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'lato'),
        home: const SplachScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
