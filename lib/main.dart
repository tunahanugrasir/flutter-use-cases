import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/init/main_build.dart';
import 'use_case/generic_filter/filter_home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final String _appTitle = 'FLUTTER DEMO';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: MainBuild.build,
      home: const FilterHomeView(),
    );
  }
}
