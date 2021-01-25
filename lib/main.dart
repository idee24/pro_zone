import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'networking/AppService.dart';

void main() {
  setUpServiceLocator();
  runApp(MyApp());
}

void setUpServiceLocator() {
  GetIt.instance.registerLazySingleton(() => AppService());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pro Zone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NoteList(),
    );
  }
}
