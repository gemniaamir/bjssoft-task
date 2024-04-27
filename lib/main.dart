import 'package:bjssoft/utils/helpers/provider_helper.dart';
import 'package:bjssoft/utils/helpers/routes_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utils/constants.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Assessment Task',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: appRoutes,
        initialRoute: Constants.homeScreen,
      ),
    );
  }
}
